import { IsString, IsOptional, IsNumber, IsArray, Min, Max } from 'class-validator';

export class CreateRoleDto {
  @IsString()
  name: string;

  @IsOptional()
  @IsString()
  description?: string;

  @IsOptional()
  @IsArray()
  permissions?: { page: string; add: boolean; delete: boolean }[];

  @IsOptional()
  @IsNumber()
  @Min(0)
  @Max(1)
  viewOthers?: number;

  @IsOptional()
  @IsNumber()
  @Min(0)
  @Max(1)
  isAdmin?: number;
}

export class UpdateRoleDto {
  @IsOptional()
  @IsString()
  name?: string;

  @IsOptional()
  @IsString()
  description?: string;

  @IsOptional()
  @IsArray()
  permissions?: { page: string; add: boolean; delete: boolean }[];

  @IsOptional()
  @IsNumber()
  @Min(0)
  @Max(1)
  viewOthers?: number;

  @IsOptional()
  @IsNumber()
  @Min(0)
  @Max(1)
  status?: number;

  @IsOptional()
  @IsNumber()
  @Min(0)
  @Max(1)
  isAdmin?: number;
}

export class QueryRoleDto {
  @IsOptional()
  @IsString()
  name?: string;

  @IsOptional()
  @IsNumber()
  @Min(0)
  @Max(1)
  status?: number;
}
