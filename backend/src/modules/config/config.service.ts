import { Injectable, Logger } from '@nestjs/common';
import { ConfigService as NestConfigService } from '@nestjs/config';
import * as fs from 'fs';
import * as path from 'path';
import { DataSource } from 'typeorm';

@Injectable()
export class DatabaseConfigService {
  private logger = new Logger(DatabaseConfigService.name);
  private envPath: string;
  private configFilePath: string;

  constructor(private nestConfigService: NestConfigService) {
    // 使用 process.cwd() 获取项目根目录（NestJS 运行时的工作目录）
    this.envPath = path.join(process.cwd(), '.env');
    this.configFilePath = path.join(process.cwd(), 'database-config.json');
  }

  // 从JSON文件读取所有类型的配置
  private getAllConfigs(): any {
    try {
      if (fs.existsSync(this.configFilePath)) {
        const content = fs.readFileSync(this.configFilePath, 'utf8');
        return JSON.parse(content);
      }
    } catch (error) {
      this.logger.error('读取数据库配置文件失败:', error);
    }
    return {};
  }

  // 保存所有类型的配置到JSON文件
  private saveAllConfigs(configs: any): void {
    try {
      fs.writeFileSync(this.configFilePath, JSON.stringify(configs, null, 2), 'utf8');
    } catch (error) {
      this.logger.error('保存数据库配置文件失败:', error);
    }
  }

  // 获取指定类型的数据库配置
  getDatabaseConfig(type?: string) {
    const configs = this.getAllConfigs();
    const targetType = type || this.nestConfigService.get<string>('DB_TYPE') || 'mssql';

    // 如果有该类型的保存配置，返回
    if (configs[targetType]) {
      return {
        type: targetType,
        host: configs[targetType].host || '',
        port: configs[targetType].port || null,
        username: configs[targetType].username || '',
        password: configs[targetType].password || '',
        database: configs[targetType].database || '',
      };
    }

    // 否则返回空配置
    return {
      type: targetType,
      host: '',
      port: null,
      username: '',
      password: '',
      database: '',
    };
  }

  // 测试数据库连接
  async testConnection(config: any): Promise<{ success: boolean; message: string }> {
    let dataSource: DataSource | null = null;
    try {
      this.logger.log('测试连接配置:', JSON.stringify(config));
      
      const connectionOptions: any = {
        type: config.type as any,
        host: config.host,
        port: Number(config.port), // 确保是数字类型
        username: config.username,
        password: config.password,
        database: config.database,
        entities: [],
        synchronize: false,
      };

      // MSSQL 特殊配置（和主应用保持一致）
      if (config.type === 'mssql') {
        connectionOptions.extra = {
          trustServerCertificate: true,
        };
        connectionOptions.options = {
          encrypt: false,
          trustServerCertificate: true,
        };
      }

      this.logger.log('DataSource 配置:', JSON.stringify(connectionOptions));
      
      dataSource = new DataSource(connectionOptions);
      await dataSource.initialize();
      this.logger.log('DataSource 初始化成功');

      // 执行一个简单的查询验证连接
      await dataSource.query('SELECT 1');
      this.logger.log('查询验证成功');

      await dataSource.destroy();
      return { success: true, message: '数据库连接成功' };
    } catch (error: any) {
      this.logger.error('数据库连接测试失败:', error);
      if (dataSource) {
        try { await dataSource.destroy(); } catch (e) {}
      }
      return { success: false, message: error.message || '数据库连接失败' };
    }
  }

  // 保存数据库配置
  saveDatabaseConfig(config: any): boolean {
    try {
      // 1. 保存到对应类型的JSON配置文件
      const configs = this.getAllConfigs();
      configs[config.type] = {
        host: config.host,
        port: config.port,
        username: config.username,
        password: config.password,
        database: config.database,
      };
      this.saveAllConfigs(configs);

      // 2. 同时更新 .env 文件（作为当前激活的配置）
      let envContent = '';
      if (fs.existsSync(this.envPath)) {
        envContent = fs.readFileSync(this.envPath, 'utf8');
      }

      const configMapping: { [key: string]: string } = {
        'DB_TYPE': 'type',
        'DB_HOST': 'host',
        'DB_PORT': 'port',
        'DB_USERNAME': 'username',
        'DB_PASSWORD': 'password',
        'DB_NAME': 'database',
      };

      Object.keys(configMapping).forEach(key => {
        const regex = new RegExp(`${key}=.*`, 'g');
        const field = configMapping[key];
        const value = config[field];
        const line = `${key}=${typeof value === 'string' && value.includes(' ') ? `"${value}"` : value}`;

        if (regex.test(envContent)) {
          envContent = envContent.replace(regex, line);
        } else {
          envContent += `\n${line}`;
        }
      });

      fs.writeFileSync(this.envPath, envContent.trim());
      return true;
    } catch (error) {
      this.logger.error('保存数据库配置失败:', error);
      return false;
    }
  }

  // 检查数据库结构
  async checkDatabaseStructure(config: any): Promise<{ success: boolean; message: string }> {
    let dataSource: DataSource | null = null;
    try {
      const connectionOptions: any = {
        type: config.type as any,
        host: config.host,
        port: config.port,
        username: config.username,
        password: config.password,
        database: config.database,
        entities: [__dirname + '/../**/*.entity{.ts,.js}'],
        synchronize: true,
        logging: true,
      };

      // MSSQL 特殊配置（和主应用保持一致）
      if (config.type === 'mssql') {
        connectionOptions.extra = {
          trustServerCertificate: true,
        };
        connectionOptions.options = {
          encrypt: false,
          trustServerCertificate: true,
        };
      }

      dataSource = new DataSource(connectionOptions);
      await dataSource.initialize();
      await dataSource.destroy();
      return { success: true, message: '数据库结构检查完成' };
    } catch (error: any) {
      this.logger.error('数据库结构检查失败:', error);
      if (dataSource) {
        try { await dataSource.destroy(); } catch (e) {}
      }
      return { success: false, message: error.message || '数据库结构检查失败' };
    }
  }

  // 获取图片上传路径配置
  getUploadPath(): string {
    try {
      const configs = this.getAllConfigs();
      // 默认路径为 ./uploads
      return configs.uploadPath || './uploads';
    } catch (error) {
      this.logger.error('获取图片上传路径失败:', error);
      return './uploads';
    }
  }

  // 保存图片上传路径配置
  saveUploadPath(uploadPath: string): boolean {
    try {
      const configs = this.getAllConfigs();
      configs.uploadPath = uploadPath || './uploads';
      this.saveAllConfigs(configs);
      this.logger.log('图片上传路径已保存:', uploadPath);
      return true;
    } catch (error) {
      this.logger.error('保存图片上传路径失败:', error);
      return false;
    }
  }

  // 获取短信服务配置
  getSmsConfig(): any {
    try {
      const configs = this.getAllConfigs();
      if (configs.sms) {
        return {
          userId: configs.sms.userId || '',
          companyId: configs.sms.companyId || '',
          password: configs.sms.password || '',
          apiUrl: configs.sms.apiUrl || '',
        };
      }
      // 配置文件中没有时，回退到 .env 中的值
      return {
        userId: this.nestConfigService.get<string>('SMS_USER_ID', '') || '',
        companyId: this.nestConfigService.get<string>('SMS_COMPANY_ID', '') || '',
        password: this.nestConfigService.get<string>('SMS_PASSWORD', '') || '',
        apiUrl: this.nestConfigService.get<string>('SMS_API_URL', '') || '',
      };
    } catch (error) {
      this.logger.error('获取短信配置失败:', error);
      return { userId: '', companyId: '', password: '', apiUrl: '' };
    }
  }

  // 保存短信服务配置
  saveSmsConfig(config: any): boolean {
    try {
      const configs = this.getAllConfigs();
      configs.sms = {
        userId: config.userId || '',
        companyId: config.companyId || '',
        password: config.password || '',
        apiUrl: config.apiUrl || '',
      };
      this.saveAllConfigs(configs);
      this.logger.log('短信服务配置已保存');
      return true;
    } catch (error) {
      this.logger.error('保存短信配置失败:', error);
      return false;
    }
  }

  // 获取系统默认界面样式（个人未设置时的兜底）
  getSystemTheme(): string {
    try {
      const configs = this.getAllConfigs();
      return configs.systemTheme || 'light';
    } catch (error) {
      this.logger.error('获取系统默认样式失败:', error);
      return 'light';
    }
  }

  // 保存系统默认界面样式
  saveSystemTheme(theme: string): boolean {
    try {
      const configs = this.getAllConfigs();
      configs.systemTheme = theme || 'light';
      this.saveAllConfigs(configs);
      this.logger.log('系统默认样式已保存:', theme);
      return true;
    } catch (error) {
      this.logger.error('保存系统默认样式失败:', error);
      return false;
    }
  }
}
