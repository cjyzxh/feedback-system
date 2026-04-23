import { Controller, Post, Get, Body, UseGuards, Request } from '@nestjs/common';
import { AuthService } from './auth.service';
import { LoginDto, SmsLoginDto, SendCodeDto } from './dto/auth.dto';
import { JwtAuthGuard } from './guards/jwt-auth.guard';

// 认证控制器
// 访问路径前缀：/api/auth
@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  // 用户登录（用户名/密码）
  // POST /api/auth/login
  @Post('login')
  async login(@Body() loginDto: LoginDto) {
    console.log('收到登录请求:', loginDto);
    try {
      const result = await this.authService.login(loginDto);
      console.log('登录成功:', result.user.username);
      return {
        code: 200,
        message: '登录成功',
        data: result,
      };
    } catch (error) {
      console.error('登录失败:', error.message);
      throw error;
    }
  }

  // 发送短信验证码
  // POST /api/auth/send-code
  @Post('send-code')
  async sendCode(@Body() sendCodeDto: SendCodeDto) {
    await this.authService.sendCode(sendCodeDto);
    return {
      code: 200,
      message: '验证码发送成功',
      data: null,
    };
  }

  // 短信验证码登录
  // POST /api/auth/login-sms
  @Post('login-sms')
  async loginSms(@Body() smsLoginDto: SmsLoginDto) {
    const result = await this.authService.loginSms(smsLoginDto);
    return {
      code: 200,
      message: '登录成功',
      data: result,
    };
  }

  // 获取当前登录用户信息
  // GET /api/auth/userInfo
  // @UseGuards(JwtAuthGuard) - 表示需要携带有效的 JWT Token 才能访问
  @UseGuards(JwtAuthGuard)
  @Get('userInfo')
  async getUserInfo(@Request() req) {
    const user = await this.authService.getUserInfo(req.user.id);
    return {
      code: 200,
      message: 'success',
      data: user,
    };
  }

  // 退出登录
  // POST /api/auth/logout
  @Post('logout')
  async logout() {
    return {
      code: 200,
      message: '退出成功',
      data: null,
    };
  }
}
