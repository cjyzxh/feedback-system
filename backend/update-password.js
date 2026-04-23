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

const newPassword = '123456';

console.log('========================================');
console.log('正在更新密码...');
console.log('========================================\n');

async function updatePassword() {
  try {
    console.log('1/3 正在连接数据库...');
    const pool = await sql.connect(config);
    console.log('✅ 数据库连接成功！\n');

    console.log('2/3 生成密码哈希...');
    const hash = await bcrypt.hash(newPassword, 10);
    console.log('✅ 哈希生成成功！\n');

    console.log('3/3 更新数据库...');
    await pool.request().query(`
      UPDATE sys_user 
      SET password = '${hash}', updateTime = GETDATE()
      WHERE username = 'admin'
    `);
    console.log('✅ 密码更新成功！\n');

    console.log('========================================');
    console.log('🎉 密码已更新！');
    console.log('========================================');
    console.log('\n新登录信息：');
    console.log('   用户名: admin');
    console.log('   密码: ' + newPassword + '\n');

    await pool.close();
  } catch (error) {
    console.error('\n❌ 更新失败！');
    console.error('========================================');
    console.error('错误信息:', error.message);
    console.error('========================================\n');
    process.exit(1);
  }
}

updatePassword();
