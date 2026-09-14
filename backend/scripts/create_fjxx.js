// ============================================================
// 附件信息表 zd_fjxx 幂等建表脚本（本地 / 远程服务器通用）
//
// 用途：
//   问题处理/测试页上传的附件（文件）元信息表。附件本体存在
//   fileUploadPath 目录（与图片 uploadPath 分开），本表记录
//   每个附件属于哪个问题、谁上传的，用于列表显示上传者、
//   以及"仅上传者本人可删除"的权限控制。
//
// 字段说明：
//   id            主键自增
//   wentiId       问题ID（yw_wentilb.ID）
//   filename      磁盘文件名（{问题ID}-{序号}#{原文件名}，唯一）
//   baseName      原文件名（列表展示用，去掉 # 前面的逻辑名）
//   seq           序号（同一问题下第几个附件）
//   uploadUser    上传者编码（sys_user.username，权限过滤用）
//   uploadName    上传者姓名（sys_user.realName，列表显示用）
//   lrsj          上传时间
//
// 用法：node create_fjxx.js
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
    "SELECT COUNT(*) AS n FROM sys.tables WHERE name = 'zd_fjxx'");
  if (exists.recordset[0].n > 0) {
    console.log('zd_fjxx 表已存在，跳过建表');
    const cols = await pool.request().query(
      "SELECT name FROM sys.columns WHERE object_id = OBJECT_ID('zd_fjxx')");
    const names = cols.recordset.map(c => c.name.toLowerCase());
    console.log('现有列:', names.join(', '));
  } else {
    await pool.request().query(`
      CREATE TABLE zd_fjxx (
        id INT IDENTITY(1,1) PRIMARY KEY,
        wentiId INT NOT NULL,
        filename nvarchar(255) NOT NULL,
        baseName nvarchar(255) NULL,
        seq INT NULL,
        uploadUser nvarchar(50) NULL,
        uploadName nvarchar(50) NULL,
        lrsj datetime DEFAULT GETDATE()
      )`);
    // 按问题ID建索引，列表查询走索引
    await pool.request().query(
      "CREATE INDEX IX_zd_fjxx_wentiId ON zd_fjxx (wentiId)");
    console.log('zd_fjxx 表创建成功（含 wentiId 索引）');
  }

  await pool.close();
  console.log('完成');
})().catch(e => { console.error('失败:', e.message); process.exit(1); });
