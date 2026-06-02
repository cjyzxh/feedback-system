// 1. 引入需要的工具（相当于 VB6 里的 引用控件、API函数）
import { Controller, Post, Get, Body, UseGuards, Request } from '@nestjs/common';
import { AuthService } from './auth.service'; // 引入业务逻辑（核心办事员）
import { LoginDto, SmsLoginDto, SendCodeDto } from './dto/auth.dto'; // 引入数据格式校验
import { JwtAuthGuard } from './guards/jwt-auth.guard'; // 引入登录验证守卫

// 2. 定义控制器
// @Controller('auth') = 访问地址前缀：/api/auth
// 所有接口都要在前面加上 /api/auth
// 比如 login → /api/auth/login
@Controller('auth')
export class AuthController {

  // 3. 把 AuthService 引进来（相当于 VB6 里调用一个模块里的函数）
  constructor(private readonly authService: AuthService) {}

  // ======================================================
  // 🔥 【账号密码登录】最重要的接口！你的前端按钮就是调用这个！
  // 访问地址：POST /api/auth/login
  // ======================================================
  @Post('login')
  async login(@Body() loginDto: LoginDto) {
    // @Body() loginDto = 接收前端传来的 用户名、密码
    // 相当于 VB6 里的：username = Text1.Text, password = Text2.Text

    console.log('收到登录请求:', loginDto); // 后台打印日志：谁在登录

    try {
      // 调用 service 去验证账号密码、查数据库、生成token
      const result = await this.authService.login(loginDto);

      console.log('登录成功:', result.user.username);

      // 返回给前端的数据！
      // 这就是你前端 res = await response.json() 拿到的数据！
      return {
        code: 200,          // 状态码：200=成功
        message: '登录成功', // 提示文字
        data: result,       // 包含 token、用户信息 ← 你前端最需要的东西
      };
    } catch (error) {
      // 如果账号错、密码错，就走到这里
      console.error('登录失败:', error.message);
      throw error; // 把错误信息返回给前端
    }
  }

  // ======================================================
  // 发送短信验证码
  // 地址：POST /api/auth/send-code
  // ======================================================
  @Post('send-code')
  async sendCode(@Body() sendCodeDto: SendCodeDto) {
    // 接收手机号，调用service发送验证码
    await this.authService.sendCode(sendCodeDto);
    return {
      code: 200,
      message: '验证码发送成功',
      data: null,
    };
  }

  // ======================================================
  // 短信验证码登录
  // 地址：POST /api/auth/login-sms
  // ======================================================
  @Post('login-sms')
  async loginSms(@Body() smsLoginDto: SmsLoginDto) {
    // 接收手机号+验证码，去登录
    const result = await this.authService.loginSms(smsLoginDto);
    return {
      code: 200,
      message: '登录成功',
      data: result,
    };
  }

  // ======================================================
  // 获取当前登录用户信息
  // 地址：GET /api/auth/userInfo
  // ======================================================
  @Get('userInfo')
  async getUserInfo(@Request() req) {
    // 登录成功后，前端会调用这个接口获取用户信息
    // 现在是测试写死的，返回固定管理员账号
    return {
      code: 200,
      message: 'success',
      data: {
        id: 1,
        username: 'admin',
        xingming: '管理员'
      },
    };
  }

  // ======================================================
  // 退出登录
  // 地址：POST /api/auth/logout
  // ======================================================
  @Post('logout')
  async logout() {
    return {
      code: 200,
      message: '退出成功',
      data: null,
    };
  }
}