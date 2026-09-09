// ============================================================
// 主表 yw_wentilb 人员编码回填脚本（本地 / 远程服务器通用）
//
// 用途：
//   新增了 shishiryBM / xggcsBM / szcsgcsBM / shcsgcsBM 四个编码字段后，
//   按"姓名"把存量老数据回填成"用户编码"。
//
// 编码来源（两级匹配，先技术人员表、再系统用户表）：
//   1. zd_jishuyuan.username —— 技术人员表（跟进人/工程师/测试人）
//   2. sys_user.username      —— 系统用户表（反馈人 = 登录用户）
//
// 用法：
//   node backfill_bm.js
//
// 远程服务器用法（覆盖连接配置即可）：
//   把下面 DB 配置改成远程库的信息，或复用后端 dist 下的 .env
// ============================================================
const fs = require('fs');
const path = require('path');

// ---------- 数据库连接配置（远程部署时改这里） ----------
let DB = {
  server: '192.168.2.5',
  port: 1433,
  user: 'SA',
  password: '1',
  database: 'New_WTFK',
  options: { encrypt: false, trustServerCertificate: true }
};

// 优先读 backend/.env（如果存在），与后端启动配置保持一致
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
} else {
  console.log('未找到 .env，使用脚本内置连接配置:', DB.database);
}

const mssql = require(path.join(__dirname, '..', 'node_modules', 'mssql'));

(async () => {
  const pool = await mssql.connect(DB);
  console.log('数据库连接成功:', DB.server + '/' + DB.database);

  // ===== 0. 建表加列（幂等：列已存在则跳过）=====
  // yw_wentilb 主表：4 个人员编码 + LSH 流水号
  const fbCols = [
    ['shishiryBM', 'nvarchar(50)'],
    ['xggcsBM', 'nvarchar(50)'],
    ['szcsgcsBM', 'nvarchar(50)'],
    ['shcsgcsBM', 'nvarchar(50)'],
    ['LSH', 'nvarchar(50)']
  ];
  for (const [col, type] of fbCols) {
    const r = await pool.request().query(
      `SELECT COUNT(*) AS n FROM sys.columns WHERE object_id = OBJECT_ID('yw_wentilb') AND name = '${col}'`);
    if (r.recordset[0].n === 0) {
      await pool.request().query(`ALTER TABLE yw_wentilb ADD ${col} ${type} NULL`);
      console.log('yw_wentilb 已加列:', col);
    }
  }
  // zd_jishuyuan 技术人员表：username 编码列
  const jsCol = await pool.request().query(
    "SELECT COUNT(*) AS n FROM sys.columns WHERE object_id = OBJECT_ID('zd_jishuyuan') AND name = 'username'");
  if (jsCol.recordset[0].n === 0) {
    await pool.request().query('ALTER TABLE zd_jishuyuan ADD username nvarchar(50) NULL');
    console.log('zd_jishuyuan 已加列: username');
  }

  // ===== 1. 技术人员表按姓名回填 username =====
  const jsBackfill = await pool.request().query(`
    UPDATE j SET j.username = u.username
    FROM zd_jishuyuan j
    INNER JOIN sys_user u ON u.realName = j.xingming
    WHERE (j.username IS NULL OR j.username = '')`);
  console.log('技术人员编码回填:', jsBackfill.rowsAffected[0], '条');

  // 建姓名→编码映射（技术人员表优先，再补系统用户表）
  const jishuyuan = await pool.request().query(
    "SELECT xingming, username FROM zd_jishuyuan WHERE username IS NOT NULL AND username != ''"
  );
  const sysUsers = await pool.request().query(
    "SELECT realName, username FROM sys_user WHERE username IS NOT NULL AND username != ''"
  );
  const nameToCode = {};
  for (const r of jishuyuan.recordset) if (r.xingming && !nameToCode[r.xingming]) nameToCode[r.xingming] = r.username;
  for (const r of sysUsers.recordset) if (r.realName && !nameToCode[r.realName]) nameToCode[r.realName] = r.username;
  console.log('姓名→编码映射条数:', Object.keys(nameToCode).length);

  // 逐字段回填
  const fields = [
    ['shishiryBM', 'shishiry'],   // 跟进人
    ['xggcsBM', 'xggcs'],         // 工程师
    ['szcsgcsBM', 'szcsgcs'],     // 反馈人
    ['shcsgcsBM', 'shcsgcs']      // 测试人
  ];

  for (const [bm, name] of fields) {
    const list = await pool.request().query(
      `SELECT ID, ${name} AS nm FROM yw_wentilb WHERE (${bm} IS NULL OR ${bm} = '') AND ${name} IS NOT NULL AND ${name} != ''`
    );
    let hit = 0, miss = 0;
    const missNames = new Set();
    for (const row of list.recordset) {
      const code = nameToCode[row.nm];
      if (code) {
        await pool.request()
          .input('c', mssql.NVarChar, code)
          .input('id', mssql.Int, row.ID)
          .query(`UPDATE yw_wentilb SET ${bm} = @c WHERE ID = @id`);
        hit++;
      } else {
        miss++;
        missNames.add(row.nm);
      }
    }
    console.log(`回填 ${bm}（来源 ${name}）: 成功 ${hit} 条, 未匹配 ${miss} 条${miss ? ' → ' + [...missNames].join('、') : ''}`);
  }

  // 校验结果
  const check = await pool.request().query(
    `SELECT 
       SUM(CASE WHEN shishiryBM IS NOT NULL AND shishiryBM != '' THEN 1 ELSE 0 END) AS a,
       SUM(CASE WHEN xggcsBM IS NOT NULL AND xggcsBM != '' THEN 1 ELSE 0 END) AS b,
       SUM(CASE WHEN szcsgcsBM IS NOT NULL AND szcsgcsBM != '' THEN 1 ELSE 0 END) AS c,
       SUM(CASE WHEN shcsgcsBM IS NOT NULL AND shcsgcsBM != '' THEN 1 ELSE 0 END) AS d,
       COUNT(*) AS total
     FROM yw_wentilb`
  );
  const r = check.recordset[0];
  console.log('回填后统计:', JSON.stringify(r));

  await pool.close();
  console.log('完成');
})().catch(e => { console.error('失败:', e.message); process.exit(1); });
