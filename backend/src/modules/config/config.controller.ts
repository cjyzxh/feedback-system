import { Controller, Get, Post, Body, Logger } from '@nestjs/common';
import { DatabaseConfigService } from './config.service';

// 配置控制器
// 类似于 VB6 的窗体代码，负责处理 HTTP 请求并调用服务层
// 访问路径前缀：/api/config
@Controller('config')
export class ConfigController {
  private logger = new Logger(ConfigController.name);

  // 构造函数注入服务（依赖注入）
  // 类似于 VB6 中声明一个类实例并使用
  constructor(private configService: DatabaseConfigService) {}

  // 获取数据库配置
  // GET /api/config/database
  @Get('database')
  getDatabaseConfig() {
    this.logger.log('获取数据库配置');
    return this.configService.getDatabaseConfig();
  }

  // 测试数据库连接
  // POST /api/config/database/test
  @Post('database/test')
  async testDatabaseConnection(@Body() config: any) {
    this.logger.log('测试数据库连接:', config);
    return await this.configService.testConnection(config);
  }

  // 保存数据库配置
  // POST /api/config/database/save
  @Post('database/save')
  saveDatabaseConfig(@Body() config: any) {
    this.logger.log('保存数据库配置:', config);
    const success = this.configService.saveDatabaseConfig(config);
    return { success, message: success ? '配置保存成功' : '配置保存失败' };
  }

  // 检查数据库结构
  // POST /api/config/database/check
  @Post('database/check')
  async checkDatabaseStructure(@Body() config: any) {
    this.logger.log('检查数据库结构:', config);
    return await this.configService.checkDatabaseStructure(config);
  }
}
