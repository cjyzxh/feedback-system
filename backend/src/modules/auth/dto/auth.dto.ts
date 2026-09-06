// =============================================
// DTO（Data Transfer Object）= 数据传输对象
// 作用：定义"前端传上来的数据长什么样"，并在进入接口前自动校验
// 类比 VB6：相当于给接口定义了参数表 + 参数合法性检查（Len()>0 之类）
// 前端传来的 JSON 会自动映射成这里的类，校验不过直接报 400，不会进入业务逻辑
// =============================================
import { IsNotEmpty, IsString, MinLength, IsPhoneNumber } from 'class-validator';

// 账号密码登录时的请求体（对应前端 POST /api/auth/login 的 body）
export class LoginDto {
  // @IsNotEmpty() = 不能为空；@IsString() = 必须是字符串
  // 就像 VB6 里判断：If Trim(Text1.Text) = "" Then MsgBox "用户名不能为空"
  @IsNotEmpty({ message: '用户名不能为空' })
  @IsString()
  username: string;

  @IsNotEmpty({ message: '密码不能为空' })
  @MinLength(6, { message: '密码至少6位' }) // 密码至少 6 位
  password: string;
}

// 发送短信验证码时的请求体（对应前端 POST /api/auth/send-code 的 body）
export class SendCodeDto {
  @IsNotEmpty({ message: '手机号不能为空' })
  @IsString()
  phone: string;

  // 图片验证码的唯一标识（获取 /api/auth/captcha 时返回）
  // 前端把 codeId 原样传回来，后端靠它找到之前生成的那张验证码图片
  @IsNotEmpty({ message: '图片验证码不能为空' })
  @IsString()
  codeId: string;

  // 用户输入的图片验证码内容（后端会与存储的值做不区分大小写的比对）
  @IsNotEmpty({ message: '图片验证码不能为空' })
  @IsString()
  captchaCode: string;
}

// 短信验证码登录时的请求体（对应前端 POST /api/auth/login-sms 的 body）
export class SmsLoginDto {
  @IsNotEmpty({ message: '手机号不能为空' })
  @IsString()
  phone: string;

  @IsNotEmpty({ message: '验证码不能为空' })
  @IsString()
  code: string;
}
