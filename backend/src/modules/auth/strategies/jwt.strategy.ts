// =============================================
// JWT 策略（Token 的"验票员"）
// 作用：当接口挂了 JwtAuthGuard 守卫时，每次请求都会先经过这里，
//       把请求头里的 token 解析出来、验证签名和有效期，再把用户信息塞进 req.user
// 类比 VB6：相当于每个受保护窗体的 Form_Load 里先做一次"是否已登录"检查，
//       没登录就拒绝进入（返回 401）
// =============================================
import { Injectable, UnauthorizedException } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { UserService } from '../../user/user.service';

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor(private userService: UserService) {
    super({
      // 从请求头 Authorization: Bearer xxxxx 里取出 token（前端 axios 拦截器自动加的）
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      // 是否忽略过期：false = 不忽略，token 过期直接拒绝
      ignoreExpiration: false,
      // 验签密钥：与签发时用的密钥必须一致，否则验不过
      // 类比 VB6 的固定密钥，用于生成/校验签名
      secretOrKey: process.env.JWT_SECRET || 'u-rFB9tILwn1QcbXWk3-BRk4h6uHlo3TpfU0Y4c0MrXBPwhypQqaao0JuaYC78CB',
    });
  }

  // 验签通过后会调用这个方法，把 token 里存的信息解析出来
  // 返回的对象会被挂到 req.user 上，后面的接口用 @Request() req 就能取到
  async validate(payload: any) {
    // payload 就是签发 token 时塞进去的 { sub: 用户ID, username, role, sessionId }

    // ========== 登录互斥校验 ==========
    // token 里的 sessionId 必须等于用户表里"当前最新"的 sessionId，
    // 否则说明该账号在别处重新登录了（本 token 已被顶下线）
    // 旧 token（无 sessionId，功能上线前签发）一律视为失效，要求重新登录
    if (!payload.sessionId) {
      throw new UnauthorizedException({ code: 'SESSION_KICKED', message: '登录状态已失效，请重新登录' });
    }
    const currentSessionId = await this.userService.findSession(payload.sub);
    if (currentSessionId !== payload.sessionId) {
      throw new UnauthorizedException({ code: 'SESSION_KICKED', message: '您的账号已在其他设备登录，已强制下线' });
    }

    return { id: payload.sub, username: payload.username, role: payload.role };
  }
}
