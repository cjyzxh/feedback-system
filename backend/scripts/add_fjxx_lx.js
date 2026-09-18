// ============================================================
// zd_fjxx 表加 lx 字段（图片/附件统一入库用）
// lx: 'image'=图片 / 'file'=文件附件（老数据 NULL 视为 file）
// 用法：node add_fjxx_lx.js （幂等，可重复执行）
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

(async () => {
  const pool = await mssql.connect(DB);
  console.log('数据库连接成功:', DB.server + '/' + DB.database);

  const hasTable = await pool.request().query(
    "SELECT COUNT(*) AS n FROM sys.tables WHERE name = 'zd_fjxx'");
  if (hasTable.recordset[0].n === 0) {
    console.log('zd_fjxx 表不存在，请先运行 create_fjxx.js 建表');
    await pool.close();
    return;
  }

  const has = await pool.request().query(
    "SELECT COUNT(*) AS n FROM sys.columns c JOIN sys.tables t ON c.object_id = t.object_id WHERE t.name = 'zd_fjxx' AND c.name = 'lx'");
  if (has.recordset[0].n > 0) {
    console.log('zd_fjxx.lx 列已存在，跳过');
  } else {
    await pool.request().query("ALTER TABLE zd_fjxx ADD lx varchar(10) NULL");
    console.log('已添加列: zd_fjxx.lx varchar(10) NULL');
  }

  await pool.close();
  console.log('完成');
})().catch(e => {
  console.error('执行失败:', e.message);
  process.exit(1);
});
