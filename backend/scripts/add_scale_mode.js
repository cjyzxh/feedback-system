// ============================================================
// sys_user 表加 scale_mode 字段（个人缩放模式偏好）——幂等脚本（本地 / 远程通用）
//
// 用途：
//   个人缩放模式偏好：空=跟随系统，auto=等比缩放，none=原始缩放
//   与 themeMode/fontSize 同构。
//
// 用法：node add_scale_mode.js
// 说明：列已存在时自动跳过，可重复执行
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

  // 本库列名使用驼峰（与实体属性一致，如 realName），因此目标列名为 scaleMode
  const hasCol = await pool.request().query(
    "SELECT COUNT(*) AS n FROM sys.columns WHERE object_id = OBJECT_ID('sys_user') AND name = 'scaleMode'");
  const hasOld = await pool.request().query(
    "SELECT COUNT(*) AS n FROM sys.columns WHERE object_id = OBJECT_ID('sys_user') AND name = 'scale_mode'");

  if (hasCol.recordset[0].n > 0) {
    console.log('sys_user.scaleMode 列已存在，跳过');
  } else if (hasOld.recordset[0].n > 0) {
    await pool.request().query("EXEC sp_rename 'sys_user.scale_mode', 'scaleMode', 'COLUMN'");
    console.log('已将 sys_user.scale_mode 改名为 scaleMode');
  } else {
    await pool.request().query("ALTER TABLE sys_user ADD scaleMode varchar(20) NULL");
    console.log('已添加列: sys_user.scaleMode varchar(20) NULL');
  }

  await pool.close();
  console.log('完成');
})().catch(e => {
  console.error('执行失败:', e.message);
  process.exit(1);
});
