// ============================================================
// sys_user 增加"个人字体大小"字段 fontSize（幂等脚本，本地/远程通用）
// 空=跟随系统，small/standard/large/xlarge
// 用法：node add_user_fontsize.js
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

  const cols = await pool.request().query(
    "SELECT name FROM sys.columns WHERE object_id = OBJECT_ID('sys_user')");
  const names = cols.recordset.map(c => c.name.toLowerCase());
  console.log('现有列:', names.join(', '));

  if (names.includes('fontsize')) {
    console.log('fontSize 列已存在，跳过');
  } else {
    await pool.request().query("ALTER TABLE sys_user ADD fontSize varchar(20) NOT NULL DEFAULT ''");
    console.log('已添加列 fontSize varchar(20) DEFAULT \'\'');
  }

  await pool.close();
  console.log('DONE');
})().catch(e => { console.error('失败:', e.message); process.exit(1); });
