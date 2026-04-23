const mysql = require('mysql2/promise');

async function createAdminUser() {
  try {
    // 连接数据库
    const connection = await mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: 'Cjysoft#01',
      database: 'cjy_wtfk'
    });

    console.log('连接数据库成功');

    // 检查user表是否存在
    const [tables] = await connection.execute(
      "SHOW TABLES LIKE 'sys_user'"
    );

    if (tables.length === 0) {
      console.log('sys_user表不存在，需要等待应用启动时自动创建');
      await connection.end();
      return;
    }

    console.log('sys_user表存在');

    // 检查是否已有管理员用户
    const [users] = await connection.execute(
      "SELECT * FROM sys_user WHERE username = 'admin'"
    );

    if (users.length > 0) {
      console.log('管理员用户已存在');
      await connection.end();
      return;
    }

    // 创建管理员用户（密码：123456）
    // 密码哈希：$2b$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW
    await connection.execute(
      `INSERT INTO sys_user (username, password, realName, email, phone, role, status, createTime, updateTime)
       VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), NOW())`,
      [
        'admin',
        '$2b$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', // 123456
        '管理员',
        'admin@example.com',
        '13800138000',
        'admin',
        1
      ]
    );

    console.log('管理员用户创建成功');
    console.log('账号：admin');
    console.log('密码：123456');

    await connection.end();
  } catch (error) {
    console.error('创建管理员用户失败:', error.message);
  }
}

createAdminUser();