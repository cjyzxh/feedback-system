import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AuthModule } from './modules/auth/auth.module';
import { UserModule } from './modules/user/user.module';

@Module({
  imports: [
    // TypeORM 配置 - 连接 SQL Server
    TypeOrmModule.forRoot({
      type: 'mssql',
      host: process.env.DB_HOST || 'localhost',
      port: parseInt(process.env.DB_PORT || '1433'),
      username: process.env.DB_USERNAME || 'sa',
      password: process.env.DB_PASSWORD || 'YourPassword',
      database: process.env.DB_NAME || 'FeedbackSystem',
      entities: [__dirname + '/**/*.entity{.ts,.js}'],
      synchronize: true, // 开发环境自动同步表结构
      logging: process.env.NODE_ENV === 'development',
      options: {
        encrypt: false,
        trustServerCertificate: true,
      },
    }),
    AuthModule,
    UserModule,
  ],
})
export class AppModule {}
