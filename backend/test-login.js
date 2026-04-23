const sql = require('mssql');
const bcrypt = require('bcrypt');

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

const testUsername = 'admin';
const testPassword = 'admin123';

console.log('========================================');
console.log('正在测试登录验证...');
console.log('========================================\n');

async function testLogin() {
  try {
    console.log('1/3 正在连接数据库...');
    const pool = await sql.connect(config);
    console.log('✅ 数据库连接成功！\n');

    console.log('2/3 查询用户...');
    const result = await pool.request().query(`
      SELECT * FROM sys_user WHERE username = '${testUsername}'
    `);

    if (result.recordset.length === 0) {
      console.log('❌ 用户不存在！');
      await pool.close();
      return;
    }

    const user = result.recordset[0];
    console.log('✅ 用户找到！');
    console.log('   用户名:', user.username);
    console.log('   真实姓名:', user.realName);
    console.log('   角色:', user.role);
    console.log('   状态:', user.status);
    console.log('   密码哈希长度:', user.password.length, '\n');

    console.log('3/3 验证密码...');
    console.log('   输入密码:', testPassword);
    console.log('   存储哈希:', user.password);
    
    const isValid = await bcrypt.compare(testPassword, user.password);
    
    if (isValid) {
      console.log('✅ 密码验证成功！\n');
      console.log('========================================');
      console.log('🎉 登录验证通过！');
      console.log('========================================\n');
    } else {
      console.log('❌ 密码验证失败！\n');
      
      console.log('正在重新生成密码哈希...');
      const newHash = await bcrypt.hash(testPassword, 10);
      console.log('新哈希:', newHash);
      
      console.log('\n正在更新数据库中的密码...');
      await pool.request().query(`
        UPDATE sys_user 
        SET password = '${newHash}', updateTime = GETDATE()
        WHERE username = '${testUsername}'
      `);
      console.log('✅ 密码已更新！\n');
      
      console.log('再次验证...');
      const result2 = await pool.request().query(`
        SELECT password FROM sys_user WHERE username = '${testUsername}'
      `);
      const isValid2 = await bcrypt.compare(testPassword, result2.recordset[0].password);
      console.log('验证结果:', isValid2 ? '✅ 成功' : '❌ 失败');
    }

    await pool.close();
  } catch (error) {
    console.error('\n❌ 测试失败！');
    console.error('========================================');
    console.error('错误信息:', error.message);
    console.error('========================================\n');
    process.exit(1);
  }
}

testLogin();
