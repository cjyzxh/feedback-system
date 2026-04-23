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
console.log('正在测试 MSSQL 数据库连接...');
console.log('========================================');
console.log('配置信息:');
console.log(`  服务器: ${config.server}:${config.port}`);
console.log(`  数据库: ${config.database}`);
console.log(`  用户: ${config.user}`);
console.log('========================================\n');

async function testConnection() {
  try {
    console.log('1/3 正在连接数据库...');
    const pool = await sql.connect(config);
    console.log('✅ 数据库连接成功！\n');

    console.log('2/3 测试简单查询...');
    const result1 = await pool.request().query('SELECT GETDATE() AS CurrentTime');
    console.log('✅ 查询成功！');
    console.log('   当前时间:', result1.recordset[0].CurrentTime, '\n');

    console.log('3/3 检查 sys_user 表是否存在...');
    const result2 = await pool.request().query(`
      SELECT * FROM sys.objects 
      WHERE object_id = OBJECT_ID(N'[dbo].[sys_user]') 
      AND type in (N'U')
    `);
    
    if (result2.recordset.length > 0) {
      console.log('✅ sys_user 表存在！');
      
      const result3 = await pool.request().query('SELECT COUNT(*) AS UserCount FROM sys_user');
      console.log('   用户数量:', result3.recordset[0].UserCount);
      
      const result4 = await pool.request().query('SELECT username, realName, role, status FROM sys_user');
      console.log('\n   用户列表:');
      result4.recordset.forEach(user => {
        console.log(`     - ${user.username} (${user.realName}) - ${user.role} - ${user.status === 1 ? '启用' : '禁用'}`);
      });
    } else {
      console.log('⚠️  sys_user 表不存在！');
      console.log('   请执行 create-admin.sql 创建表和用户');
    }

    console.log('\n========================================');
    console.log('✅ 所有测试完成！');
    console.log('========================================\n');

    await pool.close();
  } catch (error) {
    console.error('\n❌ 数据库连接失败！');
    console.error('========================================');
    console.error('错误信息:', error.message);
    console.error('========================================\n');
    process.exit(1);
  }
}

testConnection();
