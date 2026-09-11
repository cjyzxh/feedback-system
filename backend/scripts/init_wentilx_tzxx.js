// ============================================================
// 问题类型字段 + 通知表 xt_tzxx 幂等初始化脚本（本地 / 远程服务器通用）
//
// 1. yw_wentilb 增加 wentilx 列（问题类型：软件BUG/业务逻辑/个性化/其它问题）
//    老数据全部回填为「其它问题」
// 2. 创建通知表 xt_tzxx（右下角消息提醒用）
//
// 用法：node init_wentilx_tzxx.js
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

  // 1) yw_wentilb 加 wentilx 列（幂等）
  const colRes = await pool.request().query(
    "SELECT COUNT(*) AS n FROM sys.columns WHERE object_id = OBJECT_ID('yw_wentilb') AND name = 'wentilx'");
  if (colRes.recordset[0].n === 0) {
    await pool.request().query("ALTER TABLE yw_wentilb ADD wentilx nvarchar(20) NULL");
    console.log('yw_wentilb 已增加 wentilx 列');
  } else {
    console.log('yw_wentilb.wentilx 列已存在，跳过');
  }

  // 老数据回填：没有问题类型的置为「其它问题」
  const upd = await pool.request().query(
    "UPDATE yw_wentilb SET wentilx = N'其它问题' WHERE wentilx IS NULL OR wentilx = ''");
  console.log('老数据回填「其它问题」:', upd.rowsAffected[0], '行');

  // 2) 建通知表 xt_tzxx（幂等）
  const tbRes = await pool.request().query(
    "SELECT COUNT(*) AS n FROM sys.tables WHERE name = 'xt_tzxx'");
  if (tbRes.recordset[0].n === 0) {
    await pool.request().query(`
      CREATE TABLE xt_tzxx (
        ID INT IDENTITY(1,1) PRIMARY KEY,
        wentiid INT NULL,
        lx nvarchar(20) NULL,
        jsrbm nvarchar(50) NULL,
        nr nvarchar(500) NULL,
        ydsj datetime NULL,
        lrsj datetime DEFAULT GETDATE()
      )`);
    console.log('xt_tzxx 表创建成功');
  } else {
    console.log('xt_tzxx 表已存在，跳过');
  }

  await pool.close();
  console.log('完成');
})().catch(e => { console.error('失败:', e.message); process.exit(1); });
