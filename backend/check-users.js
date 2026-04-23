const mysql = require('mysql2/promise');

async function checkAdminUser() {
  try {
    // 连接数据库
    const connection = await mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: 'Cjysoft#01',
      database: 'cjy_wtfk'
    });

    console.log('连接数据库成功');

    // 查询用户表
    const [users] = await connection.execute(
      "SELECT * FROM sys_user"
    );

    console.log('用户列表:');
    users.forEach(user => {
      console.log(`ID: ${user.id}, 用户名: ${user.username}, 手机号: ${user.phone}, 状态: ${user.status}`);
    });

    // 检查admin用户
    const [adminUsers] = await connection.execute(
      "SELECT * FROM sys_user WHERE username = 'admin'"
    );

    if (adminUsers.length > 0) {
      console.log('\n管理员用户存在:');
      console.log(adminUsers[0]);
    } else {
      console.log('\n管理员用户不存在！');
    }

    await connection.end();
  } catch (error) {
    console.error('查询用户失败:', error.message);
  }
}

checkAdminUser();