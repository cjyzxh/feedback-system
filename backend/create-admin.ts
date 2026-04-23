import { DataSource } from 'typeorm';
import * as bcrypt from 'bcrypt';
import { User } from './src/modules/user/user.entity';
import * as path from 'path';

const AppDataSource = new DataSource({
  type: 'mssql',
  host: '192.168.2.5',
  port: 1433,
  username: 'SA',
  password: '1',
  database: 'cjy_wtfk',
  entities: [path.join(__dirname, 'src/**/*.entity{.ts,.js}')],
  synchronize: true,
  options: {
    encrypt: true,
    trustServerCertificate: true,
  },
});

async function createAdmin() {
  console.log('正在连接数据库...');
  
  try {
    await AppDataSource.initialize();
    console.log('数据库连接成功！\n');

    const userRepository = AppDataSource.getRepository(User);

    // 检查是否已存在 admin 用户
    const existingAdmin = await userRepository.findOne({ where: { username: 'admin' } });
    if (existingAdmin) {
      console.log('管理员账号已存在！');
      console.log('用户名: admin');
      console.log('密码: admin123\n');
      await AppDataSource.destroy();
      return;
    }

    // 创建管理员用户
    const hashedPassword = await bcrypt.hash('admin123', 10);
    
    const admin = userRepository.create({
      username: 'admin',
      password: hashedPassword,
      realName: '系统管理员',
      email: 'admin@example.com',
      phone: '13800138000',
      role: 'admin',
      status: 1,
    });

    await userRepository.save(admin);

    console.log('✅ 管理员账号创建成功！');
    console.log('用户名: admin');
    console.log('密码: admin123\n');

  } catch (error) {
    console.error('❌ 创建管理员失败:', error);
  } finally {
    if (AppDataSource.isInitialized) {
      await AppDataSource.destroy();
    }
  }
}

createAdmin();
