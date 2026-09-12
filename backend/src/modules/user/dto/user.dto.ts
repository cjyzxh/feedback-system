import { IsString, IsOptional, IsNumber, Min, Max, IsEnum } from 'class-validator';

export class CreateUserDto {
  @IsString()
  username: string;

  @IsString()
  password: string;

  @IsString()
  realName: string;

  @IsOptional()
  @IsString()
  gender?: string; // 男 | 女

  @IsOptional()
  @IsString()
  birthDate?: string; // 出生日期 YYYY-MM-DD

  @IsOptional()
  @IsString()
  email?: string;

  @IsString()
  phone: string;

  @IsOptional()
  @IsString()
  userCode?: string;

  @IsOptional()
  @IsNumber()
  roleId?: number;

  @IsOptional()
  @IsString()
  role?: string;

  @IsOptional()
  @IsString()
  userType?: string; // 内部员工 | 客户

  @IsOptional()
  @IsString()
  hospital?: string; // 医院名称（客户用户使用）

  @IsOptional()
  @IsString()
  follower?: string; // 跟进人员（客户用户使用）

  @IsOptional()
  @IsString()
  themeMode?: string; // 个人界面样式偏好：空=跟随系统，morandi/light/dark

  @IsOptional()
  @IsString()
  fontSize?: string; // 个人字体大小偏好：空=跟随系统，small/standard/large/xlarge

  @IsOptional()
  @IsNumber()
  @Min(0)
  @Max(1)
  isShishi?: number; // 是否实施人员：1=是，0=否

  @IsOptional()
  @IsNumber()
  @Min(0)
  @Max(1)
  isYanfa?: number; // 是否研发人员：1=是，0=否

  @IsOptional()
  @IsNumber()
  @Min(0)
  @Max(1)
  status?: number;
}

export class UpdateUserDto {
  @IsOptional()
  @IsString()
  realName?: string;

  @IsOptional()
  @IsString()
  gender?: string; // 男 | 女

  @IsOptional()
  @IsString()
  birthDate?: string; // 出生日期 YYYY-MM-DD

  @IsOptional()
  @IsString()
  email?: string;

  @IsOptional()
  @IsString()
  phone?: string;

  @IsOptional()
  @IsString()
  password?: string; // 新密码（明文，后端会加密）

  @IsOptional()
  @IsString()
  userCode?: string;

  @IsOptional()
  @IsNumber()
  roleId?: number;

  @IsOptional()
  @IsString()
  role?: string;

  @IsOptional()
  @IsString()
  userType?: string; // 内部员工 | 客户

  @IsOptional()
  @IsString()
  hospital?: string; // 医院名称（客户用户使用）

  @IsOptional()
  @IsString()
  follower?: string; // 跟进人员（客户用户使用）

  @IsOptional()
  @IsString()
  themeMode?: string; // 个人界面样式偏好：空=跟随系统，morandi/light/dark

  @IsOptional()
  @IsString()
  fontSize?: string; // 个人字体大小偏好：空=跟随系统，small/standard/large/xlarge

  @IsOptional()
  @IsNumber()
  @Min(0)
  @Max(1)
  isShishi?: number; // 是否实施人员：1=是，0=否

  @IsOptional()
  @IsNumber()
  @Min(0)
  @Max(1)
  isYanfa?: number; // 是否研发人员：1=是，0=否

  @IsOptional()
  @IsNumber()
  @Min(0)
  @Max(1)
  status?: number;
}

export class QueryUserDto {
  @IsOptional()
  @IsString()
  keyword?: string;

  @IsOptional()
  @IsString()
  username?: string;

  @IsOptional()
  @IsString()
  realName?: string;

  @IsOptional()
  @IsString()
  role?: string;

  @IsOptional()
  @IsNumber()
  @Min(0)
  @Max(1)
  status?: number;

  @IsOptional()
  @IsNumber()
  roleId?: number;

  @IsOptional()
  page?: number;

  @IsOptional()
  pageSize?: number;
}
