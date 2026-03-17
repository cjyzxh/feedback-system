import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { UserService } from '../user/user.service';
import { User } from '../user/user.entity';
import { LoginDto } from './dto/auth.dto';

@Injectable()
export class AuthService {
  constructor(
    private userService: UserService,
    private jwtService: JwtService,
  ) {}

  // 登录
  async login(loginDto: LoginDto): Promise<{ token: string; user: Omit<User, 'password'> }> {
    const { username, password } = loginDto;
    
    // 查询用户
    const user = await this.userService.findByUsername(username);
    
    if (!user) {
      throw new UnauthorizedException('用户名或密码错误');
    }
    
    // 验证密码
    const isPasswordValid = await this.userService.validatePassword(user, password);
    
    if (!isPasswordValid) {
      throw new UnauthorizedException('用户名或密码错误');
    }
    
    // 检查用户状态
    if (user.status === 0) {
      throw new UnauthorizedException('账号已被禁用');
    }
    
    // 生成 token
    const payload = { sub: user.id, username: user.username, role: user.role };
    const token = this.jwtService.sign(payload);
    
    // 返回用户信息（不含密码）
    const { password: _, ...userInfo } = user;
    
    return { token, user: userInfo };
  }

  // 获取用户信息
  async getUserInfo(userId: number): Promise<Omit<User, 'password'>> {
    return this.userService.findById(userId);
  }

  // 退出登录
  async logout(): Promise<void> {
    // JWT 无状态，退出登录由前端处理 token
  }
}
