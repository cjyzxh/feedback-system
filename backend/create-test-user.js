const { createConnection } = require('typeorm');
const bcrypt = require('bcrypt');
const User = require('./dist/src/modules/user/user.entity').User;

async function createTestUser() {
  try {
    // 创建数据库连接
    const connection = await createConnection({
      type: 'mssql',
      host: '192.168.2.5',
      port: 1433,
      username: 'SA',
      password: '1',
      database: 'cjy_wtfk',
      entities: [User],
      extra: {
        trustServerCertificate: true,
      },
      options: {
        encrypt: true,
        trustServerCertificate: true,
      },
    });

    console.log('数据库连接成功');

    // 检查用户是否已存在
    const existingUser = await connection.getRepository(User).findOne({
      where: { phone: '13800138000' },
    });

    if (existingUser) {
      console.log('测试用户已存在:', existingUser);
      await connection.close();
      return;
    }

    // 加密密码
    const hashedPassword = await bcrypt.hash('123456', 10);

    // 创建测试用户
    const user = new User();
    user.username = 'testuser';
    user.realName = '测试用户';
    user.email = 'test@example.com';
    user.phone = '13800138000';
    user.password = hashedPassword;
    user.role = 'user';
    user.status = 1;
    user.createTime = new Date();
    user.updateTime = new Date();

    // 保存用户
    const savedUser = await connection.getRepository(User).save(user);
    console.log('测试用户创建成功:', savedUser);

    // 关闭连接
    await connection.close();
    console.log('数据库连接已关闭');
  } catch (error) {
    console.error('创建测试用户失败:', error.message);
    console.error(error.stack);
  }
}

// 执行函数
createTestUser();
