// ============================================================
// yw_wentilb 增加"问题返回时间"字段 fanhuisj（幂等脚本，本地/远程通用）
//
// 用途：问题测试页"返回问题"时记录返回时间，二次返回覆盖更新。
//       前端"测试返回时间"显示改用本字段。
//
// 用法：node add_fanhuisj.js
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
    "SELECT name FROM sys.columns WHERE object_id = OBJECT_ID('yw_wentilb')");
  const names = cols.recordset.map(c => c.name.toLowerCase());
  console.log('现有列:', names.join(', '));

  if (names.includes('fanhuisj')) {
    console.log('fanhuisj 列已存在，跳过');
  } else {
    await pool.request().query('ALTER TABLE yw_wentilb ADD fanhuisj datetime NULL');
    console.log('已添加列 fanhuisj datetime NULL');
  }

  await pool.close();
  console.log('DONE');
})().catch(e => { console.error('失败:', e.message); process.exit(1); });
