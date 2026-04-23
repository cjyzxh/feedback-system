const mysql = require('mysql2/promise');
const bcrypt = require('bcrypt');

async function testUserLogin() {
  try {
    // 连接数据库
    const connection = await mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: 'Cjysoft#01',
      database: 'cjy_wtfk'
    });

    console.log('连接数据库成功');

    // 测试1: 查询admin用户
    console.log('\n测试1: 查询admin用户');
    const [users1] = await connection.execute(
      "SELECT * FROM sys_user WHERE username = ?",
      ['admin']
    );
    console.log('查询结果:', users1);

    if (users1.length > 0) {
      const user = users1[0];
      console.log('用户信息:', user);
      
      // 测试2: 验证密码
      console.log('\n测试2: 验证密码');
      const password = '123456';
      const isMatch = await bcrypt.compare(password, user.password);
      console.log('密码验证结果:', isMatch);
      
      if (isMatch) {
        console.log('✅ 密码验证成功');
      } else {
        console.log('❌ 密码验证失败');
      }
    }

    // 测试3: 通过ID查询用户
    console.log('\n测试3: 通过ID查询用户');
    const [users2] = await connection.execute(
      "SELECT * FROM sys_user WHERE id = ?",
      [1]
    );
    console.log('查询结果:', users2);

    await connection.end();
  } catch (error) {
    console.error('测试失败:', error.message);
  }
}

testUserLogin();