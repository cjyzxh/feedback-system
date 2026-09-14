// ============================================================
// sys_user 表加 session_id 字段（登录互斥用）——幂等脚本（本地 / 远程通用）
//
// 用途：
//   同账号只能一处登录：每次登录生成新会话标识写入本字段，
//   旧 token 校验时发现与库中不一致即被判定"被顶下线"。
//
// 用法：node add_session_id.js
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

  // 本库列名使用驼峰（与实体属性一致，如 realName），因此目标列名为 sessionId
  const hasSessionId = await pool.request().query(
    "SELECT COUNT(*) AS n FROM sys.columns WHERE object_id = OBJECT_ID('sys_user') AND name = 'sessionId'");
  const hasSessionIdOld = await pool.request().query(
    "SELECT COUNT(*) AS n FROM sys.columns WHERE object_id = OBJECT_ID('sys_user') AND name = 'session_id'");

  if (hasSessionId.recordset[0].n > 0) {
    console.log('sys_user.sessionId 列已存在，跳过');
  } else if (hasSessionIdOld.recordset[0].n > 0) {
    // 之前误建了下划线列名，改名成驼峰
    await pool.request().query("EXEC sp_rename 'sys_user.session_id', 'sessionId', 'COLUMN'");
    console.log('已将 sys_user.session_id 改名为 sessionId');
  } else {
    await pool.request().query("ALTER TABLE sys_user ADD sessionId varchar(64) NULL");
    console.log('已添加列: sys_user.sessionId varchar(64) NULL');
  }

  await pool.close();
  console.log('完成');
})().catch(e => {
  console.error('执行失败:', e.message);
  process.exit(1);
});
