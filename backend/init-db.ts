import { DataSource } from 'typeorm';
import * as bcrypt from 'bcrypt';
import { User } from './src/modules/user/user.entity';
import { Role } from './src/modules/user/role.entity';
import { Permission } from './src/modules/user/permission.entity';
import { Feedback } from './src/modules/feedback/feedback.entity';
import { FeedbackImage } from './src/modules/feedback/feedback-image.entity';
import { Hospital } from './src/modules/hospital/hospital.entity';
import { Hospital as DictHospital } from './src/modules/dict/hospital.entity';
import { Module } from './src/modules/dict/module.entity';
import { Form } from './src/modules/dict/form.entity';
import { Engineer } from './src/modules/dict/engineer.entity';
import { Staff } from './src/modules/staff/staff.entity';
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

async function initDB() {
  console.log('正在初始化数据库...\n');
  
  try {
    await AppDataSource.initialize();
    console.log('✅ 数据库连接成功！\n');

    // 创建默认管理员账号
    const userRepository = AppDataSource.getRepository(User);
    const existingAdmin = await userRepository.findOne({ where: { username: 'admin' } });
    
    if (!existingAdmin) {
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
      console.log('✅ 默认管理员账号已创建');
      console.log('   用户名: admin');
      console.log('   密码: admin123\n');
    } else {
      console.log('✅ 管理员账号已存在');
      console.log('   用户名: admin');
      console.log('   密码: admin123\n');
    }

    console.log('🎉 数据库初始化完成！');
    console.log('现在可以使用以下账号登录系统：');
    console.log('  用户名: admin');
    console.log('  密码: admin123\n');

  } catch (error) {
    console.error('❌ 初始化失败:', error.message);
  } finally {
    if (AppDataSource.isInitialized) {
      await AppDataSource.destroy();
    }
  }
}

initDB();
