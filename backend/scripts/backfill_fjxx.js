// ============================================================
// 老附件初始化脚本 backfill_fjxx.js（本地 / 远程服务器通用）
//
// 用途：
//   把 fileUploadPath 目录下已存在的附件文件补录进 zd_fjxx 表。
//   老附件默认归为该问题的"处理工程师"上传：
//     uploadUser = yw_wentilb.xggcsBM（处理工程师编码）
//     uploadName = yw_wentilb.xggcs （处理工程师姓名）
//   幂等：zd_fjxx 里已存在的 filename 跳过，可重复执行。
//
// 用法：node backfill_fjxx.js
// ============================================================
const fs = require('fs');
const path = require('path');

let DB = {
  server: '192.168.2.5',
  port: 1433,
  user: 'SA',
  password: '1',
  database: 'New_WTFK',
  options: { encrypt: false, trustServerCertificate: true }
};

const envPath = path.join(__dirname, '..', '.env');
if (fs.existsSync(envPath)) {
  const env = fs.readFileSync(envPath, 'utf8');
  const get = (k) => { const m = env.match(new RegExp('^' + k + '=(.+)$', 'm')); return m ? m[1].trim() : undefined; };
  DB.server = get('DB_HOST') || DB.server;
  DB.port = Number(get('DB_PORT')) || DB.port;
  DB.user = get('DB_USERNAME') || DB.user;
  DB.password = get('DB_PASSWORD') || DB.password;
  DB.database = get('DB_NAME') || DB.database;
  console.log('已从 .env 读取连接配置:', DB.database);
}

const mssql = require(path.join(__dirname, '..', 'node_modules', 'mssql'));

// 读取附件存储目录（与后端 ConfigService 同一来源：backend/database-config.json）
function getFileUploadPath() {
  const cfgPath = path.join(__dirname, '..', 'database-config.json');
  try {
    if (fs.existsSync(cfgPath)) {
      const cfg = JSON.parse(fs.readFileSync(cfgPath, 'utf8'));
      if (cfg.fileUploadPath) return cfg.fileUploadPath;
    }
  } catch (e) { /* 忽略，用默认 */ }
  return './file-uploads';
}

(async () => {
  const fileDir = getFileUploadPath();
  const absDir = path.isAbsolute(fileDir) ? fileDir : path.join(__dirname, '..', fileDir);
  console.log('附件目录:', absDir);

  if (!fs.existsSync(absDir)) {
    console.log('附件目录不存在，没有可初始化的文件');
    return;
  }

  const pool = await mssql.connect(DB);
  console.log('数据库连接成功:', DB.server + '/' + DB.database);

  // 已入库的 filename 集合（幂等）
  const existing = await pool.request().query('SELECT filename FROM zd_fjxx');
  const existingSet = new Set(existing.recordset.map(r => r.filename));

  const files = fs.readdirSync(absDir).filter(f => /^\d+-\d+#/.test(f));
  console.log('目录下匹配规则的文件数:', files.length);

  let inserted = 0, skipped = 0, noEngineer = 0;

  for (const f of files) {
    if (existingSet.has(f)) { skipped++; continue; }

    // 解析 {id}-{seq}#{原文件名}
    const hashIdx = f.indexOf('#');
    const logical = f.substring(0, hashIdx);
    const origin = f.substring(hashIdx + 1);
    const seqMatch = logical.match(/^(\d+)-(\d+)$/);
    if (!seqMatch) { skipped++; continue; }
    const wentiId = parseInt(seqMatch[1]);
    const seq = parseInt(seqMatch[2]);

    // 查该问题的处理工程师（编码 + 姓名）
    const q = await pool.request()
      .input('id', mssql.Int, wentiId)
      .query('SELECT xggcsBM, xggcs FROM yw_wentilb WHERE ID = @id');
    const row = q.recordset[0];
    const uploadUser = row && row.xggcsBM ? row.xggcsBM : null;
    const uploadName = row && row.xggcs ? row.xggcs : null;
    if (!uploadUser) noEngineer++;

    await pool.request()
      .input('wentiId', mssql.Int, wentiId)
      .input('filename', mssql.NVarChar, f)
      .input('baseName', mssql.NVarChar, origin)
      .input('seq', mssql.Int, seq)
      .input('uploadUser', mssql.NVarChar, uploadUser)
      .input('uploadName', mssql.NVarChar, uploadName)
      .query(`INSERT INTO zd_fjxx (wentiId, filename, baseName, seq, uploadUser, uploadName)
              VALUES (@wentiId, @filename, @baseName, @seq, @uploadUser, @uploadName)`);
    inserted++;
  }

  await pool.close();
  console.log(`完成：新增 ${inserted} 条，跳过 ${skipped} 条（已存在），其中 ${noEngineer} 条无处理工程师（uploadUser 为空，前端不显示删除按钮）`);
})().catch(e => { console.error('失败:', e.message); process.exit(1); });
