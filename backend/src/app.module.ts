import { Module } from '@nestjs/common';
import { ConfigModule as NestConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AuthModule } from './modules/auth/auth.module';
import { UserModule } from './modules/user/user.module';
import { FeedbackModule } from './modules/feedback/feedback.module';
import { HospitalModule } from './modules/hospital/hospital.module';
import { RoleModule } from './modules/role/role.module';
import { DictModule } from './modules/dict/dict.module';
import { StaffModule } from './modules/staff/staff.module';
import { ConfigModule } from './modules/config/config.module';

// 这是应用程序的根模块
// 类似于 VB6 的工程文件（.vbp），负责注册所有子模块
@Module({
  imports: [
    // 环境配置模块
    // 读取 .env 文件中的配置，全局可用
    NestConfigModule.forRoot({
      isGlobal: true,
      envFilePath: '.env',
    }),

    // 数据库连接配置
    TypeOrmModule.forRoot({
      type: (process.env.DB_TYPE || 'mssql') as any,
      host: process.env.DB_HOST || '192.168.2.5',
      port: parseInt(process.env.DB_PORT || '1433'),
      username: process.env.DB_USERNAME || 'SA',
      password: process.env.DB_PASSWORD || '1',
      database: process.env.DB_NAME || 'cjy_wtfk',
      entities: [__dirname + '/**/*.entity{.ts,.js}'],
      synchronize: false, // 关闭自动同步，避免表结构冲突
      logging: process.env.NODE_ENV === 'development',
      // MSSQL 特殊配置
      extra: {
        trustServerCertificate: true,
      },
      options: {
        encrypt: true,
        trustServerCertificate: true,
      },
    }),

    // 业务模块
    AuthModule,        // 认证模块
    UserModule,        // 用户管理模块
    FeedbackModule,    // 问题反馈模块
    HospitalModule,    // 医院管理模块
    RoleModule,        // 角色管理模块
    DictModule,        // 字典模块
    StaffModule,       // 人员模块

    // 配置管理模块
    ConfigModule,
  ],
})
export class AppModule {}