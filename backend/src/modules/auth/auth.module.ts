// =============================================
// 认证模块（登录功能的"零件装配车间"）
// 作用：把登录相关的 控制器/服务/守卫/策略 以及它们依赖的其它模块组装在一起
// 类比 VB6 的工程文件（.vbp）：声明了这个功能块用到了哪些窗体、类、引用
// =============================================
import { Module } from '@nestjs/common';
import { JwtModule } from '@nestjs/jwt';
import { PassportModule } from '@nestjs/passport';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AuthService } from './auth.service';
import { AuthController } from './auth.controller';
import { JwtStrategy } from './strategies/jwt.strategy';
import { UserModule } from '../user/user.module'; // 查用户（登录要验证账号密码）
import { SmsModule } from '../sms/sms.module';     // 发短信（验证码登录用）
import { Role } from '../role/role.entity';        // 角色表（查权限标志）

@Module({
  imports: [
    UserModule,   // 引入用户模块，AuthService 里才能用 UserService
    SmsModule,    // 引入短信模块，AuthService 里才能用 SmsService
    TypeOrmModule.forFeature([Role]), // 把角色实体注册进本模块（可查 role 表）
    PassportModule.register({ defaultStrategy: 'jwt' }), // 指定默认认证策略
    JwtModule.register({
      secret: process.env.JWT_SECRET || 'feedback-system-secret-key', // 签发密钥
      signOptions: { expiresIn: '24h' }, // 账号登录 token 默认 24 小时过期（手机号登录在 service 里单独覆盖为 6h）
    }),
  ],
  controllers: [AuthController],  // 注册接口（路由）
  providers: [AuthService, JwtStrategy], // 注册服务与验票策略（可注入）
  exports: [AuthService], // 导出，别的模块也能用 AuthService
})
export class AuthModule {}
