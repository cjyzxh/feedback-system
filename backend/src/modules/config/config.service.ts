import { Injectable, Logger } from '@nestjs/common';
import { ConfigService as NestConfigService } from '@nestjs/config';
import * as fs from 'fs';
import * as path from 'path';
import { createConnection, Connection } from 'typeorm';

@Injectable()
export class DatabaseConfigService {
  private logger = new Logger(DatabaseConfigService.name);
  private envPath: string;

  constructor(private nestConfigService: NestConfigService) {
    this.envPath = path.join(__dirname, '..', '..', '..', '.env');
  }

  // 获取数据库配置
  getDatabaseConfig() {
    return {
      type: this.nestConfigService.get<string>('DB_TYPE') || 'mysql',
      host: this.nestConfigService.get<string>('DB_HOST') || '',
      port: parseInt(this.nestConfigService.get<string>('DB_PORT') || '3306'),
      username: this.nestConfigService.get<string>('DB_USERNAME') || '',
      password: this.nestConfigService.get<string>('DB_PASSWORD') || '',
      database: this.nestConfigService.get<string>('DB_NAME') || '',
    };
  }

  // 测试数据库连接
  async testConnection(config: any): Promise<{ success: boolean; message: string }> {
    try {
      const connectionOptions: any = {
        type: config.type as any,
        host: config.host,
        port: config.port,
        username: config.username,
        password: config.password,
        database: config.database,
        entities: [],
        synchronize: false,
        extra: {},
      };

      // MSSQL 特殊配置
      if (config.type === 'mssql') {
        connectionOptions.options = {
          encrypt: true, // 使用加密
          trustServerCertificate: true, // 信任服务器证书（开发环境使用）
        };
        connectionOptions.extra = {
          trustServerCertificate: true,
        };
      }

      const connection: Connection = await createConnection(connectionOptions);
      await connection.close();
      return { success: true, message: '连接成功' };
    } catch (error) {
      this.logger.error('数据库连接测试失败:', error);
      return { success: false, message: error.message };
    }
  }

  // 保存数据库配置
  saveDatabaseConfig(config: any): boolean {
    try {
      // 读取当前 .env 文件内容
      let envContent = '';
      if (fs.existsSync(this.envPath)) {
        envContent = fs.readFileSync(this.envPath, 'utf8');
      }

      // 更新或添加数据库配置
      const configKeys = [
        'DB_TYPE',
        'DB_HOST',
        'DB_PORT',
        'DB_USERNAME',
        'DB_PASSWORD',
        'DB_NAME',
      ];

      configKeys.forEach(key => {
        const regex = new RegExp(`${key}=.*`, 'g');
        const value = config[key.toLowerCase().replace('db_', '')];
        const line = `${key}=${typeof value === 'string' && value.includes(' ') ? `"${value}"` : value}`;

        if (regex.test(envContent)) {
          envContent = envContent.replace(regex, line);
        } else {
          envContent += `\n${line}`;
        }
      });

      // 写入 .env 文件
      fs.writeFileSync(this.envPath, envContent.trim());
      return true;
    } catch (error) {
      this.logger.error('保存数据库配置失败:', error);
      return false;
    }
  }

  // 检查数据库结构
  async checkDatabaseStructure(config: any): Promise<{ success: boolean; message: string }> {
    try {
      const connectionOptions: any = {
        type: config.type as any,
        host: config.host,
        port: config.port,
        username: config.username,
        password: config.password,
        database: config.database,
        entities: [__dirname + '/../**/*.entity{.ts,.js}'],
        synchronize: true, // 自动生成表结构
        logging: true,
        extra: {},
      };

      // MSSQL 特殊配置
      if (config.type === 'mssql') {
        connectionOptions.options = {
          encrypt: true,
          trustServerCertificate: true,
        };
        connectionOptions.extra = {
          trustServerCertificate: true,
        };
      }

      const connection: Connection = await createConnection(connectionOptions);
      await connection.close();
      return { success: true, message: '数据库结构检查完成' };
    } catch (error) {
      this.logger.error('数据库结构检查失败:', error);
      return { success: false, message: error.message };
    }
  }
}
