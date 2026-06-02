// 引入 Nest 模块功能
import { Module } from '@nestjs/common';
// 引入 TypeORM 数据库功能
import { TypeOrmModule } from '@nestjs/typeorm';

// 引入 用户实体（表结构）
import { User } from './user.entity';
// 引入 用户服务（业务逻辑）
import { UserService } from './user.service';
// 引入 用户控制器（接口/路由）
import { UserController } from './user.controller';

// ==============================================
// @Module()  表示这是一个【模块】
// 作用：把 controller、service、entity 打包在一起
// ==============================================
@Module({
  // 1. 引入依赖（这里是注册 User 表，让这个模块能用）
  imports: [
    TypeOrmModule.forFeature([User])  // 注册数据库实体：User 表
  ],

  // 2. 控制器（路由、接口、入口）
  controllers: [UserController],

  // 3. 服务（业务逻辑）
  providers: [UserService],

  // 4. 导出（让其他模块能用这个服务）
  exports: [UserService],
})

// 导出整个用户模块
export class UserModule {}