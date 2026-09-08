import { Module } from '@nestjs/common';
import { ConfigModule as NestConfigModule, ConfigService } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AuthModule } from './modules/auth/auth.module';
import { UserModule } from './modules/user/user.module';
import { FeedbackModule } from './modules/feedback/feedback.module';
import { HospitalModule } from './modules/hospital/hospital.module';
import { RoleModule } from './modules/role/role.module';
import { DictModule } from './modules/dict/dict.module';
// import { StaffModule } from './modules/staff/staff.module';  // 已停用：人员维护（人员数据源改为 sys_user）
import { ConfigModule } from './modules/config/config.module';
import { TemplateModule } from './modules/template/template.module';

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

    // 数据库连接配置（异步，确保配置加载完成后再连接）
    TypeOrmModule.forRootAsync({
      imports: [NestConfigModule],
      useFactory: (configService: ConfigService) => {
        const dbType = configService.get<string>('DB_TYPE') || 'mssql';
        const isMssql = dbType === 'mssql';
        
        const config: any = {
          type: dbType as any,
          host: configService.get<string>('DB_HOST') || '192.168.2.5',
          port: parseInt(configService.get<string>('DB_PORT') || (isMssql ? '1433' : '3306')),
          username: configService.get<string>('DB_USERNAME') || 'SA',
          password: configService.get<string>('DB_PASSWORD') || '1',
          database: configService.get<string>('DB_NAME') || 'cjy_wtfk',
          entities: [__dirname + '/**/*.entity{.ts,.js}'],
          synchronize: false,
          logging: configService.get<string>('NODE_ENV') === 'development',
          retryAttempts: 0,
        };

        // MSSQL 特殊配置
        if (isMssql) {
          config.extra = {
            trustServerCertificate: true,
            charset: 'UTF8',
          };
          config.options = {
            encrypt: false,
            trustServerCertificate: true,
            useUTC: false,
          };
        }

        return config;
      },
      inject: [ConfigService],
    }),

    // 业务模块
    AuthModule,
    UserModule,
    FeedbackModule,
    HospitalModule,
    RoleModule,
    DictModule,
    // StaffModule,  // 已停用：人员维护（人员数据源改为 sys_user）

    // 配置管理模块
    ConfigModule,

    // 模板维护模块
    TemplateModule,
  ],
})
export class AppModule {}
