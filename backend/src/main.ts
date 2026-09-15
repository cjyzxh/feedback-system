import { NestFactory } from '@nestjs/core';
import { ValidationPipe, Module } from '@nestjs/common';
import { ConfigModule as NestConfigModule, ConfigService } from '@nestjs/config';
import { DataSource } from 'typeorm';
import * as dotenv from 'dotenv';
import { AppModule } from './app.module';
import { ConfigModule } from './modules/config/config.module';
import * as fs from 'fs';
import * as path from 'path';

// CORS 白名单：开发端口 + 花生壳外网域名（前后端同源部署时基本用不到，仅兜底）
const corsOptions = {
  origin: [
    'http://localhost:5173',
    'http://127.0.0.1:5173',
    'http://cjysoft.zicp.fun',
    'http://w291v39035.zicp.vip',
  ],
  credentials: true,
};

// 全局状态：记录当前运行模式
globalThis.appState = {
  isSafeMode: false,
  startupTime: new Date().toISOString(),
  dbConnectionError: null,
};

// 安全模式模块（仅配置管理，不依赖数据库）
@Module({
  imports: [
    NestConfigModule.forRoot({
      isGlobal: true,
      envFilePath: '.env',
    }),
    ConfigModule,
  ],
})
class SafeModeModule {}

// 测试数据库连接
async function testDatabaseConnection(): Promise<{ success: boolean; error?: string; config?: any }> {
  let dataSource: DataSource | null = null;
  try {
    // 使用绝对路径读取 .env 文件
    const envPath = path.join(__dirname, '..', '..', '.env');
    console.log('读取配置文件:', envPath);
    console.log('文件是否存在:', fs.existsSync(envPath));
    
    // 使用 dotenv 加载配置，override: true 强制覆盖已存在的环境变量
    const result = dotenv.config({ path: envPath, override: true });
    if (result.error) {
      console.error('加载配置文件失败:', result.error);
    } else {
      console.log('配置文件加载成功');
    }

    // 读取 database-config.json，覆盖环境变量（优先使用界面保存的配置）
    const dbConfigPath = path.join(process.cwd(), 'database-config.json');
    console.log('读取数据库配置文件:', dbConfigPath);
    console.log('文件是否存在:', fs.existsSync(dbConfigPath));
    if (fs.existsSync(dbConfigPath)) {
      try {
        const dbConfigContent = fs.readFileSync(dbConfigPath, 'utf8');
        const dbConfigs = JSON.parse(dbConfigContent);
        const dbTypeFromEnv = process.env.DB_TYPE || 'mssql';
        if (dbConfigs[dbTypeFromEnv]) {
          const cfg = dbConfigs[dbTypeFromEnv];
          if (cfg.host) process.env.DB_HOST = cfg.host;
          if (cfg.port) process.env.DB_PORT = String(cfg.port);
          if (cfg.username) process.env.DB_USERNAME = cfg.username;
          if (cfg.password) process.env.DB_PASSWORD = cfg.password;
          if (cfg.database) process.env.DB_NAME = cfg.database;
          console.log('已从 database-config.json 加载配置:', JSON.stringify({
            type: dbTypeFromEnv,
            host: cfg.host,
            port: cfg.port,
            database: cfg.database,
          }));
        } else {
          console.log('database-config.json 中未找到', dbTypeFromEnv, '配置，使用环境变量默认值');
        }
      } catch (e: any) {
        console.error('解析 database-config.json 失败:', e.message);
      }
    }

    const dbType = process.env.DB_TYPE || 'mssql';
    const isMssql = dbType === 'mssql';

    console.log('数据库配置:', JSON.stringify({
      DB_TYPE: dbType,
      DB_HOST: process.env.DB_HOST,
      DB_PORT: process.env.DB_PORT,
      DB_USERNAME: process.env.DB_USERNAME,
      DB_NAME: process.env.DB_NAME,
    }));

    const connectionOptions: any = {
      type: dbType as any,
      host: process.env.DB_HOST || '192.168.2.5',
      port: parseInt(process.env.DB_PORT || (isMssql ? '1433' : '3306')),
      username: process.env.DB_USERNAME || 'SA',
      password: process.env.DB_PASSWORD || '1',
      database: process.env.DB_NAME || 'cjy_wtfk',
      entities: [],
      synchronize: false,
    };

    if (isMssql) {
      connectionOptions.extra = { trustServerCertificate: true };
      connectionOptions.options = { encrypt: false, trustServerCertificate: true };
    }

    console.log('连接选项:', JSON.stringify({
      type: connectionOptions.type,
      host: connectionOptions.host,
      port: connectionOptions.port,
      database: connectionOptions.database,
    }));

    dataSource = new DataSource(connectionOptions);
    await dataSource.initialize();
    await dataSource.query('SELECT 1');
    await dataSource.destroy();
    console.log('数据库连接测试成功');
    return { success: true };
  } catch (error: any) {
    console.error('数据库连接测试失败:', error.message);
    if (dataSource) {
      try { await dataSource.destroy(); } catch (e) {}
    }
    return { success: false, error: error.message };
  }
}

async function bootstrap() {
  const port = process.env.PORT || 3001;

  console.log('正在测试数据库连接...');
  const dbTest = await testDatabaseConnection();

  if (dbTest.success) {
    console.log('数据库连接成功，启动正常模式...');
    
    try {
      const app = await NestFactory.create(AppModule, {
        logger: ['error', 'warn', 'log'],
      });
      
      app.setGlobalPrefix('api');
      app.useGlobalPipes(new ValidationPipe({
        whitelist: true,
        transform: true,
      }));
      app.enableCors(corsOptions);
      
      // 主动测试 DataSource 连接
      try {
        const dataSource = app.get(DataSource);
        await dataSource.query('SELECT 1');
        console.log('DataSource 连接验证成功');
      } catch (dsError: any) {
        console.error('DataSource 连接验证失败:', dsError.message);
        await app.close();
        await startSafeMode(port, dsError.message);
        return;
      }
      
      await app.listen(port);
      globalThis.appState.isSafeMode = false;
      console.log(`服务器已启动: http://localhost:${port}/api`);
      console.log('数据库连接正常，所有功能可用');
    } catch (error) {
      console.error('正常模式启动失败:', error.message);
      await startSafeMode(port, error.message);
    }
  } else {
    console.warn('数据库连接失败:', dbTest.error);
    await startSafeMode(port, dbTest.error);
  }
}

async function startSafeMode(port: string | number, error: string) {
  console.warn('以安全模式启动（仅配置管理功能可用）');
  console.warn('请使用超级用户admin登录，配置数据库连接后重启服务');

  globalThis.appState.isSafeMode = true;
  globalThis.appState.dbConnectionError = error;

  try {
    const safeApp = await NestFactory.create(SafeModeModule, {
      logger: ['error', 'warn', 'log'],
    });
    
    safeApp.setGlobalPrefix('api');
    safeApp.useGlobalPipes(new ValidationPipe({
      whitelist: true,
      transform: true,
    }));
    safeApp.enableCors(corsOptions);
    
    await safeApp.listen(port);
    console.log(`安全模式已启动: http://localhost:${port}/api`);
    console.log('可用功能：数据库配置管理、测试连接、保存配置、重启服务');
  } catch (safeError) {
    console.error('安全模式启动也失败:', safeError.message);
    process.exit(1);
  }
}

bootstrap();
