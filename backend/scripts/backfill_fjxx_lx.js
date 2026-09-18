// ============================================================
// 老数据统一回填脚本 backfill_fjxx_lx.js（本地 / 远程服务器通用）
//
// 用途：
//   把 uploads（图片）和 fileUploadPath（文件附件）目录下已存在的
//   老文件全部补录进 zd_fjxx 表，实现"文件与表记录一一对应"：
//     - 图片目录：{id}-{seq}.{ext}         → lx='image'
//     - 附件目录：{id}-{seq}#{原文件名}     → lx='file'
//   附件沿用处理工程师作为上传者（与老脚本一致）；图片无上传者信息置空。
//   幂等：zd_fjxx 里已存在的 filename 跳过；顺带把老附件 lx 为空的统一置 'file'。
//
// 用法：node backfill_fjxx_lx.js
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

// 读取存储目录（与后端 ConfigService 同一来源：backend/database-config.json）
function getDir(key, def) {
  const cfgPath = path.join(__dirname, '..', 'database-config.json');
  try {
    if (fs.existsSync(cfgPath)) {
      const cfg = JSON.parse(fs.readFileSync(cfgPath, 'utf8'));
      if (cfg[key]) return cfg[key];
    }
  } catch (e) { /* 忽略，用默认 */ }
  return def;
}

(async () => {
  const imgDirCfg = getDir('uploadPath', './uploads');
  const fileDirCfg = getDir('fileUploadPath', './file-uploads');
  const imgDir = path.isAbsolute(imgDirCfg) ? imgDirCfg : path.join(__dirname, '..', imgDirCfg);
  const fileDir = path.isAbsolute(fileDirCfg) ? fileDirCfg : path.join(__dirname, '..', fileDirCfg);
  console.log('图片目录:', imgDir);
  console.log('附件目录:', fileDir);

  const pool = await mssql.connect(DB);
  console.log('数据库连接成功:', DB.server + '/' + DB.database);

  // 已入库的 filename 集合（幂等）
  const existing = await pool.request().query('SELECT filename FROM zd_fjxx');
  const existingSet = new Set(existing.recordset.map(r => r.filename));

  let insertedImg = 0, insertedFile = 0, skipped = 0;

  // ===== 1. 图片目录回填（{id}-{seq}.{ext} → lx='image'） =====
  if (fs.existsSync(imgDir)) {
    const imgFiles = fs.readdirSync(imgDir).filter(f => /^\d+-\d+\./.test(f));
    console.log('图片目录匹配文件数:', imgFiles.length);
    for (const f of imgFiles) {
      if (existingSet.has(f)) { skipped++; continue; }
      const m = f.match(/^(\d+)-(\d+)\./);
      if (!m) { skipped++; continue; }
      const wentiId = parseInt(m[1]);
      const seq = parseInt(m[2]);
      await pool.request()
        .input('wentiId', mssql.Int, wentiId)
        .input('filename', mssql.NVarChar, f)
        .input('baseName', mssql.NVarChar, f)
        .input('seq', mssql.Int, seq)
        .input('lx', mssql.NVarChar, 'image')
        .query(`INSERT INTO zd_fjxx (wentiId, filename, baseName, seq, uploadUser, uploadName, lx)
                VALUES (@wentiId, @filename, @baseName, @seq, NULL, NULL, @lx)`);
      insertedImg++;
    }
  }

  // ===== 2. 附件目录回填（{id}-{seq}#{原文件名} → lx='file'） =====
  if (fs.existsSync(fileDir)) {
    const fileFiles = fs.readdirSync(fileDir).filter(f => /^\d+-\d+#/.test(f));
    console.log('附件目录匹配文件数:', fileFiles.length);
    for (const f of fileFiles) {
      if (existingSet.has(f)) { skipped++; continue; }
      const hashIdx = f.indexOf('#');
      const logical = f.substring(0, hashIdx);
      const origin = f.substring(hashIdx + 1);
      const m = logical.match(/^(\d+)-(\d+)$/);
      if (!m) { skipped++; continue; }
      const wentiId = parseInt(m[1]);
      const seq = parseInt(m[2]);
      // 附件沿用处理工程师作为上传者（与老 backfill_fjxx 一致）
      const q = await pool.request()
        .input('id', mssql.Int, wentiId)
        .query('SELECT xggcsBM, xggcs FROM yw_wentilb WHERE ID = @id');
      const row = q.recordset[0];
      const uploadUser = row && row.xggcsBM ? row.xggcsBM : null;
      const uploadName = row && row.xggcs ? row.xggcs : null;
      await pool.request()
        .input('wentiId', mssql.Int, wentiId)
        .input('filename', mssql.NVarChar, f)
        .input('baseName', mssql.NVarChar, origin)
        .input('seq', mssql.Int, seq)
        .input('uploadUser', mssql.NVarChar, uploadUser)
        .input('uploadName', mssql.NVarChar, uploadName)
        .input('lx', mssql.NVarChar, 'file')
        .query(`INSERT INTO zd_fjxx (wentiId, filename, baseName, seq, uploadUser, uploadName, lx)
                VALUES (@wentiId, @filename, @baseName, @seq, @uploadUser, @uploadName, @lx)`);
      insertedFile++;
    }
  }

  // ===== 3. 老附件 lx 为空统一置 'file' =====
  const upd = await pool.request().query("UPDATE zd_fjxx SET lx = 'file' WHERE lx IS NULL");
  console.log('老附件 lx 置 file 更新行数:', upd.rowsAffected[0]);

  await pool.close();
  console.log(`完成：图片补录 ${insertedImg} 条，附件补录 ${insertedFile} 条，跳过 ${skipped} 条（已存在）`);
})().catch(e => { console.error('失败:', e.message); process.exit(1); });
