const sql = require('mssql');

const config = {
  server: '192.168.2.5',
  port: 1433,
  user: 'SA',
  password: '1',
  database: 'cjy_wtfk',
  options: {
    encrypt: true,
    trustServerCertificate: true,
    enableArithAbort: true
  }
};

console.log('========================================');
console.log('正在初始化数据库...');
console.log('========================================\n');

async function initDB() {
  try {
    console.log('1/4 正在连接数据库...');
    const pool = await sql.connect(config);
    console.log('✅ 数据库连接成功！\n');

    console.log('2/4 检查并创建 sys_user 表...');
    const checkTable = await pool.request().query(`
      SELECT * FROM sys.objects 
      WHERE object_id = OBJECT_ID(N'[dbo].[sys_user]') 
      AND type in (N'U')
    `);

    if (checkTable.recordset.length === 0) {
      await pool.request().query(`
        CREATE TABLE sys_user (
          id INT IDENTITY(1,1) PRIMARY KEY,
          username NVARCHAR(50) NOT NULL UNIQUE,
          password NVARCHAR(200) NOT NULL,
          realName NVARCHAR(50),
          email NVARCHAR(100),
          phone NVARCHAR(20),
          role NVARCHAR(20) DEFAULT 'user',
          status INT DEFAULT 1,
          createTime DATETIME DEFAULT GETDATE(),
          updateTime DATETIME DEFAULT GETDATE()
        )
      `);
      console.log('✅ sys_user 表创建成功！\n');
    } else {
      console.log('ℹ️  sys_user 表已存在\n');
    }

    console.log('3/4 检查并创建 admin 用户...');
    const checkUser = await pool.request().query(`
      SELECT * FROM sys_user WHERE username = 'admin'
    `);

    if (checkUser.recordset.length === 0) {
      await pool.request().query(`
        INSERT INTO sys_user (username, password, realName, email, phone, role, status)
        VALUES (
          'admin', 
          '$2b$10$zElWi2FgV1FVx3gO4v9lSO.G2WWRHbnKFtNSHC004AqOOxz2qkzHa', 
          '系统管理员', 
          'admin@example.com', 
          '13800138000', 
          'admin', 
          1
        )
      `);
      console.log('✅ admin 用户创建成功！\n');
    } else {
      console.log('ℹ️  admin 用户已存在\n');
    }

    console.log('4/4 验证数据...');
    const result = await pool.request().query(`
      SELECT username, realName, role, status FROM sys_user WHERE username = 'admin'
    `);
    
    console.log('✅ 验证成功！');
    console.log('   用户信息:');
    console.log('     用户名:', result.recordset[0].username);
    console.log('     姓名:', result.recordset[0].realName);
    console.log('     角色:', result.recordset[0].role);
    console.log('     状态:', result.recordset[0].status === 1 ? '启用' : '禁用');

    console.log('\n========================================');
    console.log('✅ 数据库初始化完成！');
    console.log('========================================');
    console.log('\n现在可以使用以下账号登录：');
    console.log('  用户名: admin');
    console.log('  密码: admin123\n');

    await pool.close();
  } catch (error) {
    console.error('\n❌ 初始化失败！');
    console.error('========================================');
    console.error('错误信息:', error.message);
    console.error('========================================\n');
    process.exit(1);
  }
}

initDB();
