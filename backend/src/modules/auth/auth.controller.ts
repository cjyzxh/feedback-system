import { Controller, Post, Get, Body, UseGuards, Request } from '@nestjs/common';
import { AuthService } from './auth.service';
import { LoginDto } from './dto/auth.dto';
import { JwtAuthGuard } from './guards/jwt-auth.guard';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  // 登录
  @Post('login')
  async login(@Body() loginDto: LoginDto) {
    const result = await this.authService.login(loginDto);
    return {
      code: 200,
      message: '登录成功',
      data: result,
    };
  }

  // 获取用户信息
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
  @Post('logout')
  async logout() {
    return {
      code: 200,
      message: '退出成功',
      data: null,
    };
  }
}
