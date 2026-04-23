import { IsOptional, IsString, IsNumber } from 'class-validator';

export class CreateStaffDto {
  @IsString() xingming: string;
  @IsOptional() @IsString() gender?: string;
  @IsOptional() @IsString() birthDate?: string;
  @IsOptional() @IsString() phone?: string;
  @IsOptional() @IsString() email?: string;
  @IsOptional() @IsString() zhiwu?: string;
  @IsOptional() @IsNumber() zhuangtai?: number;
  @IsOptional() @IsString() category?: string;
}

export class UpdateStaffDto {
  @IsOptional() @IsString() xingming?: string;
  @IsOptional() @IsString() gender?: string;
  @IsOptional() @IsString() birthDate?: string;
  @IsOptional() @IsString() phone?: string;
  @IsOptional() @IsString() email?: string;
  @IsOptional() @IsString() zhiwu?: string;
  @IsOptional() @IsNumber() zhuangtai?: number;
  @IsOptional() @IsString() category?: string;
}

export class QueryStaffDto {
  @IsOptional() @IsString() category?: string;
  @IsOptional() @IsNumber() page?: number;
  @IsOptional() @IsNumber() pageSize?: number;
}
