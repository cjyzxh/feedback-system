import { NestFactory } from '@nestjs/core';
import { ValidationPipe } from '@nestjs/common';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  
  // 全局前缀
  app.setGlobalPrefix('api');
  
  // 启用验证
  app.useGlobalPipes(new ValidationPipe({
    whitelist: true, // 自动剥离非 DTO 属性
    transform: true  // 自动转换类型
  }));
  
  // 启用 CORS
  app.enableCors();
  
  const port = process.env.PORT || 3001;
  await app.listen(port);
  console.log(`🚀 Server is running on http://localhost:${port}/api`);
}

bootstrap();
