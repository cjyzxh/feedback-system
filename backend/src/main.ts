import { NestFactory } from '@nestjs/core';
import { ValidationPipe } from '@nestjs/common';
import { AppModule } from './app.module';

// 这是 NestJS 应用程序的入口文件
// 类似于 VB6 的 Sub Main() 或 Form_Load()
async function bootstrap() {
  // 创建 NestJS 应用实例
  const app = await NestFactory.create(AppModule);
  
  // 设置全局路由前缀，所有接口都会以 /api 开头
  // 例如：/api/auth/login, /api/user/list
  app.setGlobalPrefix('api');
  
  // 启用全局数据验证管道
  // 类似于 VB6 的数据验证控件，会自动验证请求参数格式
  app.useGlobalPipes(new ValidationPipe({
    whitelist: true, // 自动去除 DTO 中未定义的字段
    transform: true, // 自动转换类型（例如：字符串转数字）
  }));
  
  // 启用跨域请求（CORS）
  // 允许前端从不同端口访问后端接口
  app.enableCors();
  
  // 启动服务器，监听端口 3001
  const port = process.env.PORT || 3001;
  await app.listen(port);
  console.log(`🚀 服务器已启动: http://localhost:${port}/api`);
  console.log('📝 登录说明：请确保数据库中有用户表和admin用户');
}

// 启动应用程序
bootstrap();
