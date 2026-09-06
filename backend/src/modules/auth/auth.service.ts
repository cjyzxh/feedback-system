import { Injectable, UnauthorizedException, Logger } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { UserService } from '../user/user.service';
import { User } from '../user/user.entity';
import { Role } from '../role/role.entity';
import { LoginDto, SmsLoginDto, SendCodeDto } from './dto/auth.dto';
import { SmsService } from '../sms/sms.service';

// 认证服务层
// 类似于 VB6 的业务类（.cls），负责处理具体的业务逻辑
// @Injectable() - 表示这个类可以被 NestJS 依赖注入
@Injectable()
export class AuthService {
  private readonly logger = new Logger(AuthService.name);

  constructor(
    private userService: UserService,
    private jwtService: JwtService,
    private smsService: SmsService,
    @InjectRepository(Role) private roleRepository: Repository<Role>,
  ) {}

  // 存储验证码的临时容器（实际项目中应该使用 Redis）
  // 类似于 VB6 的全局变量或 Dictionary 对象
  private codeStore: Map<string, { code: string; expireTime: number }> = new Map();

  // 存储图片验证码的临时容器（codeId -> 验证码内容 + 过期时间）
  private captchaStore: Map<string, { code: string; expireTime: number }> = new Map();

  // 生成4位随机图片验证码（去掉易混淆字符 I/O/0/1，保证清晰可辨）
  private generateCaptchaCode(): string {
    const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    let code = '';
    for (let i = 0; i < 4; i++) {
      code += chars[Math.floor(Math.random() * chars.length)];
    }
    return code;
  }

  // 生成 SVG 图片验证码（不依赖第三方包，手写 SVG 渲染）
  createCaptcha(): { codeId: string; svg: string } {
    const code = this.generateCaptchaCode();
    const codeId = 'cap_' + Date.now() + '_' + Math.random().toString(36).slice(2, 10);
    // 5 分钟后过期
    this.captchaStore.set(codeId, { code, expireTime: Date.now() + 5 * 60 * 1000 });

    const width = 120;
    const height = 40;
    const colors = ['#409eff', '#f56c6c', '#67c23a', '#e6a23c', '#8a5cf6'];

    let svg = `<svg xmlns="http://www.w3.org/2000/svg" width="${width}" height="${height}" viewBox="0 0 ${width} ${height}">`;
    // 背景
    svg += `<rect width="${width}" height="${height}" fill="#f2f3f5"/>`;
    // 干扰线（5条）
    for (let i = 0; i < 5; i++) {
      const x1 = (Math.random() * width).toFixed(0);
      const y1 = (Math.random() * height).toFixed(0);
      const x2 = (Math.random() * width).toFixed(0);
      const y2 = (Math.random() * height).toFixed(0);
      svg += `<line x1="${x1}" y1="${y1}" x2="${x2}" y2="${y2}" stroke="#c9cdd4" stroke-width="1"/>`;
    }
    // 噪点（25个）
    for (let i = 0; i < 25; i++) {
      const x = (Math.random() * width).toFixed(0);
      const y = (Math.random() * height).toFixed(0);
      svg += `<circle cx="${x}" cy="${y}" r="1" fill="#909399"/>`;
    }
    // 4个字符（随机颜色、随机上下偏移、随机旋转）
    for (let i = 0; i < code.length; i++) {
      const x = 16 + i * 26;
      const y = 22 + Math.floor(Math.random() * 10);
      const rotate = (Math.random() * 40 - 20).toFixed(0);
      const color = colors[Math.floor(Math.random() * colors.length)];
      svg += `<text x="${x}" y="${y}" fill="${color}" font-size="24" font-weight="bold" font-family="Arial, sans-serif" transform="rotate(${rotate} ${x} ${y})">${code[i]}</text>`;
    }
    svg += '</svg>';

    return { codeId, svg };
  }

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
    
    // 6. 查询角色信息，获取 viewOthers（查看非本人数据）、isAdmin（是否管理员）和 menuPermissions（菜单权限）
    let viewOthers = 0;
    let isAdmin = 0;
    let menuPermissions = '';
    try {
      const role = await this.roleRepository.findOne({ where: { name: user.role } });
      if (role) {
        viewOthers = role.viewOthers || 0;
        isAdmin = role.isAdmin || 0;
        menuPermissions = role.menuPermissions || '';
      }
    } catch (e) {
      this.logger.warn('查询角色信息失败:' + e.message);
    }
    
    // 把 viewOthers、isAdmin 和 menuPermissions 加到返回的 user 对象中
    const result = { ...userInfo, viewOthers, isAdmin, menuPermissions };
    
    return { token, user: result };
  }

  // 发送短信验证码
  async sendCode(sendCodeDto: SendCodeDto): Promise<void> {
    const { phone, codeId, captchaCode } = sendCodeDto;
    
    // 0. 校验图片验证码（必须先通过，才能发短信）
    if (!codeId || !captchaCode) {
      throw new UnauthorizedException('请输入图片验证码');
    }
    const captchaInfo = this.captchaStore.get(codeId);
    if (!captchaInfo) {
      throw new UnauthorizedException('图片验证码不存在或已过期');
    }
    if (captchaInfo.expireTime < Date.now()) {
      this.captchaStore.delete(codeId);
      throw new UnauthorizedException('图片验证码已过期，请刷新后重试');
    }
    // 不区分大小写比对
    if (captchaInfo.code.toUpperCase() !== captchaCode.trim().toUpperCase()) {
      throw new UnauthorizedException('图片验证码错误');
    }
    // 验证通过后立即作废（一次性）
    this.captchaStore.delete(codeId);
    
    // 1. 验证手机号格式
    const phoneReg = /^1[3-9]\d{9}$/;
    if (!phoneReg.test(phone)) {
      throw new UnauthorizedException('手机号格式错误');
    }
    
    // 2. 检查手机号是否已绑定用户且状态正常（status=1）
    const existingUser = await this.userService.findByPhone(phone);
    if (!existingUser) {
      throw new UnauthorizedException('手机号不存在');
    }
    if (existingUser.status !== 1) {
      throw new UnauthorizedException('该账号已被停用，请联系管理员');
    }
    
    // 3. 生成6位随机验证码
    const code = Math.floor(100000 + Math.random() * 900000).toString();
    const expireTime = Date.now() + 10 * 60 * 1000; // 10分钟后过期
    
    // 4. 存储验证码（实际项目应该用 Redis）
    this.codeStore.set(phone, { code, expireTime });
    
    // 5. 调用真实的短信服务发送
    this.logger.log(`准备向 ${phone} 发送验证码：${code}`);
    
    try {
      const sendResult = await this.smsService.sendVerificationCode(phone, code);
      
      if (!sendResult) {
        throw new UnauthorizedException('短信发送失败，请稍后重试');
      }
      
      this.logger.log(`验证码发送成功: ${phone}`);
    } catch (error) {
      this.logger.error(`短信发送异常: ${error.message}`);
      // 在开发环境下，即使发送失败也继续执行，模拟成功
      if (process.env.NODE_ENV === 'development' || !process.env.NODE_ENV) {
        this.logger.warn(`开发模式：忽略短信发送失败，模拟成功`);
      } else {
        throw error;
      }
    }
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
    // 严格验证验证码，无论开发环境还是生产环境
    const isCodeValid = storedCodeInfo.code === code;
    
    if (!isCodeValid) {
      throw new UnauthorizedException('验证码错误');
    }
    
    // 4. 查找用户
    let user = await this.userService.findByPhone(phone);
    
    // 开发环境下，如果用户不存在，创建一个测试用户
    if (!user && (process.env.NODE_ENV === 'development' || !process.env.NODE_ENV)) {
      this.logger.warn(`开发模式：用户不存在，创建测试用户: ${phone}`);
      user = await this.userService.create({
        username: phone,
        realName: '测试用户',
        password: '123456',
        phone: phone,
        email: `${phone}@test.com`,
        role: 'user',
        status: 1
      });
    }
    
    if (!user) {
      throw new UnauthorizedException('用户不存在');
    }
    
    // 5. 检查用户状态
    if (user.status === 0) {
      throw new UnauthorizedException('账号已被禁用');
    }
    
    // 6. 清除已使用的验证码
    this.codeStore.delete(phone);
    
    // 7. 生成 JWT Token（手机号登录有效期为6小时，与前端约定一致）
    const payload = { sub: user.id, username: user.username, role: user.role };
    const token = this.jwtService.sign(payload, { expiresIn: '6h' });
    
    // 8. 返回用户信息（不含密码）
    const { password: _, ...userInfo } = user;
    
    // 9. 查询角色信息，获取 viewOthers（查看非本人数据）、isAdmin（是否管理员）和 menuPermissions（菜单权限）
    let viewOthers = 0;
    let isAdmin = 0;
    let menuPermissions = '';
    try {
      const role = await this.roleRepository.findOne({ where: { name: user.role } });
      if (role) {
        viewOthers = role.viewOthers || 0;
        isAdmin = role.isAdmin || 0;
        menuPermissions = role.menuPermissions || '';
      }
    } catch (e) {
      this.logger.warn('查询角色信息失败:' + e.message);
    }
    
    // 把 viewOthers、isAdmin 和 menuPermissions 加到返回的 user 对象中
    const result = { ...userInfo, viewOthers, isAdmin, menuPermissions };
    
    return { token, user: result };
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
