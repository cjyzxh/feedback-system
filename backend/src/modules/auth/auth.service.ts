import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { UserService } from '../user/user.service';
import { User } from '../user/user.entity';
import { LoginDto, SmsLoginDto, SendCodeDto } from './dto/auth.dto';

// 认证服务层
// 类似于 VB6 的业务类（.cls），负责处理具体的业务逻辑
// @Injectable() - 表示这个类可以被 NestJS 依赖注入
@Injectable()
export class AuthService {
  constructor(
    private userService: UserService,
    private jwtService: JwtService,
  ) {}

  // 存储验证码的临时容器（实际项目中应该使用 Redis）
  // 类似于 VB6 的全局变量或 Dictionary 对象
  private codeStore: Map<string, { code: string; expireTime: number }> = new Map();

  // 用户名/密码登录
  async login(loginDto: LoginDto): Promise<{ token: string; user: Omit<User, 'password'> }> {
    const { username, password } = loginDto;
    
    // 1. 查询用户（支持用户名或ID）
    const user = await this.userService.findByUsernameOrId(username);
    
    if (!user) {
      throw new UnauthorizedException('用户名或密码错误');
    }
    
    // 2. 验证密码（bcrypt 加密比对）
    const isPasswordValid = await this.userService.validatePassword(user, password);
    
    if (!isPasswordValid) {
      throw new UnauthorizedException('用户名或密码错误');
    }
    
    // 3. 检查用户状态（0=禁用，1=正常）
    if (user.status === 0) {
      throw new UnauthorizedException('账号已被禁用');
    }
    
    // 4. 生成 JWT Token（有效期24小时）
    // Token 包含用户信息，前端会存储在 localStorage 中
    const payload = { sub: user.id, username: user.username, role: user.role };
    const token = this.jwtService.sign(payload);
    
    // 5. 返回用户信息（不包含密码字段）
    const { password: _, ...userInfo } = user;
    
    return { token, user: userInfo };
  }

  // 发送短信验证码
  async sendCode(sendCodeDto: SendCodeDto): Promise<void> {
    const { phone } = sendCodeDto;
    
    // 1. 验证手机号格式
    const phoneReg = /^1[3-9]\d{9}$/;
    if (!phoneReg.test(phone)) {
      throw new UnauthorizedException('手机号格式错误');
    }
    
    // 2. 检查手机号是否绑定用户
    const user = await this.userService.findByPhone(phone);
    
    if (!user) {
      throw new UnauthorizedException('该手机号未绑定用户');
    }
    
    // 3. 生成6位随机验证码
    const code = Math.floor(100000 + Math.random() * 900000).toString();
    const expireTime = Date.now() + 10 * 60 * 1000; // 10分钟后过期
    
    // 4. 存储验证码（实际项目应该用 Redis）
    this.codeStore.set(phone, { code, expireTime });
    
    // 5. 模拟发送短信（控制台打印）
    console.log(`向 ${phone} 发送验证码：${code}`);
    
    // 实际项目中这里应该调用短信服务商的 API
  }

  // 短信验证码登录
  async loginSms(smsLoginDto: SmsLoginDto): Promise<{ token: string; user: Omit<User, 'password'> }> {
    const { phone, code } = smsLoginDto;
    
    // 1. 获取存储的验证码
    const storedCodeInfo = this.codeStore.get(phone);
    
    if (!storedCodeInfo) {
      throw new UnauthorizedException('验证码不存在或已过期');
    }
    
    // 2. 检查验证码是否过期
    if (storedCodeInfo.expireTime < Date.now()) {
      this.codeStore.delete(phone);
      throw new UnauthorizedException('验证码已过期');
    }
    
    // 3. 验证验证码是否正确
    if (storedCodeInfo.code !== code) {
      throw new UnauthorizedException('验证码错误');
    }
    
    // 4. 查找用户
    const user = await this.userService.findByPhone(phone);
    
    if (!user) {
      throw new UnauthorizedException('用户不存在');
    }
    
    // 5. 检查用户状态
    if (user.status === 0) {
      throw new UnauthorizedException('账号已被禁用');
    }
    
    // 6. 清除已使用的验证码
    this.codeStore.delete(phone);
    
    // 7. 生成 JWT Token
    const payload = { sub: user.id, username: user.username, role: user.role };
    const token = this.jwtService.sign(payload);
    
    // 8. 返回用户信息（不含密码）
    const { password: _, ...userInfo } = user;
    
    return { token, user: userInfo };
  }

  // 根据用户ID获取用户信息
  async getUserInfo(userId: number): Promise<Omit<User, 'password'>> {
    return this.userService.findById(userId);
  }

  // 退出登录（JWT 是无状态的，主要由前端清除 Token）
  async logout(): Promise<void> {
    // JWT 无状态，后端不需要做特殊处理
    // 前端只需清除 localStorage 中的 token 即可
  }
}
