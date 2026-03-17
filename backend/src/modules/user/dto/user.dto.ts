import { IsNotEmpty, IsString, IsEmail, MinLength, IsOptional, IsNumber, IsIn } from 'class-validator';

export class CreateUserDto {
  @IsNotEmpty({ message: '用户名不能为空' })
  @IsString()
  username: string;

  @IsNotEmpty({ message: '密码不能为空' })
  @MinLength(6, { message: '密码至少6位' })
  password: string;

  @IsNotEmpty({ message: '真实姓名不能为空' })
  realName: string;

  @IsNotEmpty({ message: '邮箱不能为空' })
  @IsEmail({ message: '邮箱格式不正确' })
  email: string;

  @IsOptional()
  @IsString()
  phone?: string;

  @IsOptional()
  @IsIn(['admin', 'user'])
  role?: string = 'user';

  @IsOptional()
  @IsNumber()
  status?: number = 1;
}

export class UpdateUserDto {
  @IsOptional()
  realName?: string;

  @IsOptional()
  @IsEmail({ message: '邮箱格式不正确' })
  email?: string;

  @IsOptional()
  @IsString()
  phone?: string;

  @IsOptional()
  @IsIn(['admin', 'user'])
  role?: string;

  @IsOptional()
  @IsNumber()
  status?: number;
}

export class QueryUserDto {
  @IsOptional()
  @IsNumber()
  page?: number = 1;

  @IsOptional()
  @IsNumber()
  pageSize?: number = 10;

  @IsOptional()
  @IsString()
  keyword?: string;

  @IsOptional()
  @IsNumber()
  status?: number;
}
