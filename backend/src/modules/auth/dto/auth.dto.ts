import { IsNotEmpty, IsString, MinLength, IsPhoneNumber } from 'class-validator';

export class LoginDto {
  @IsNotEmpty({ message: '用户名不能为空' })
  @IsString()
  username: string;

  @IsNotEmpty({ message: '密码不能为空' })
  @MinLength(6, { message: '密码至少6位' })
  password: string;
}

export class SendCodeDto {
  @IsNotEmpty({ message: '手机号不能为空' })
  @IsString()
  phone: string;
}

export class SmsLoginDto {
  @IsNotEmpty({ message: '手机号不能为空' })
  @IsString()
  phone: string;

  @IsNotEmpty({ message: '验证码不能为空' })
  @IsString()
  code: string;
}
