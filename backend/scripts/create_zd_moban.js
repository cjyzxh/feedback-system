// ============================================================
// 模板表 zd_MoBan 幂等建表脚本（本地 / 远程服务器通用）
//
// 用途：
//   模板维护功能使用的表（测试意见/处理意见/测试结果 模板）。
//   TypeORM synchronize=false，不会自动建表，需手动执行本脚本。
//
// 字段说明：
//   id            主键自增
//   moBanLX       模板类型（测试意见/处理意见/测试结果）
//   moBanFW       范围（个人/公用）
//   moBanNR       模板内容
//   createUser    创建人编码（sys_user.username，用于过滤）
//   createUserName 创建人姓名（sys_user.realName，用于显示）
//   createTime    创建时间
//
// 用法：node create_zd_moban.js
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

  const exists = await pool.request().query(
    "SELECT COUNT(*) AS n FROM sys.tables WHERE name = 'zd_MoBan'");
  if (exists.recordset[0].n > 0) {
    console.log('zd_MoBan 表已存在，跳过建表');
    // 幂等检查缺失列
    const cols = await pool.request().query(
      "SELECT name FROM sys.columns WHERE object_id = OBJECT_ID('zd_MoBan')");
    const names = cols.recordset.map(c => c.name.toLowerCase());
    console.log('现有列:', names.join(', '));
  } else {
    await pool.request().query(`
      CREATE TABLE zd_MoBan (
        id INT IDENTITY(1,1) PRIMARY KEY,
        moBanLX nvarchar(20) NOT NULL,
        moBanFW nvarchar(10) NOT NULL,
        moBanNR nvarchar(1000) NOT NULL,
        createUser nvarchar(50) NOT NULL,
        createUserName nvarchar(50) NULL,
        createTime datetime DEFAULT GETDATE()
      )`);
    console.log('zd_MoBan 表创建成功');
  }

  await pool.close();
  console.log('完成');
})().catch(e => { console.error('失败:', e.message); process.exit(1); });
