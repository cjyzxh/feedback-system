// =============================================
// JWT 守卫（接口的"门卫"）
// 作用：哪个接口想"必须登录才能访问"，就在它上面挂 @UseGuards(JwtAuthGuard)
// 类比 VB6：类似 frmMain 的 Enabled 控制——不登录时整个功能灰掉不可用
// =============================================
import { Injectable } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';

@Injectable()
export class JwtAuthGuard extends AuthGuard('jwt') {}
// AuthGuard('jwt') = 使用上面 JwtStrategy 里注册的 'jwt' 策略
// 一行代码即可：没有 token / token 无效 / token 过期 → 自动返回 401
