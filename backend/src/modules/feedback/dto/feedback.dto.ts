import { IsString, IsOptional, IsNumber, Min, Max } from 'class-validator';

export class CreateFeedbackDto {
  @IsOptional()
  banben?: string;

  @IsOptional()
  yiyuanmc?: string;

  @IsOptional()
  hospital?: string;

  @IsOptional()
  shishiry?: string;

  @IsOptional()
  mokuai?: string;

  @IsOptional()
  module?: string;

  @IsOptional()
  form?: string;

  @IsOptional()
  chuangtimc?: string;

  @IsOptional()
  wentism?: string;

  @IsOptional()
  shouzhongcs?: string;

  @IsOptional()
  gongcscs?: string;

  @IsOptional()
  shouhoucs?: string;

  @IsOptional()
  shouzhongbz?: string;

  @IsOptional()
  gongchengsbz?: string;

  @IsOptional()
  shouhoubz?: string;

  @IsOptional()
  xggcs?: string;

  @IsOptional()
  engineer?: string;

  @IsOptional()
  jingjicd?: string;

  @IsOptional()
  taolunbz?: string;

  @IsOptional()
  szcsgcs?: string;

  @IsOptional()
  FanKuiQD?: string;

  @IsOptional()
  shcsgcs?: string;

  @IsOptional()
  cssj?: Date;

  @IsOptional()
  lurusr?: string;

  @IsOptional()
  lurumid?: number;
}

export class UpdateFeedbackDto {
  @IsOptional()
  banben?: string;

  @IsOptional()
  yiyuanmc?: string;

  @IsOptional()
  hospital?: string;

  @IsOptional()
  shishiry?: string;

  @IsOptional()
  mokuai?: string;

  @IsOptional()
  module?: string;

  @IsOptional()
  form?: string;

  @IsOptional()
  chuangtimc?: string;

  @IsOptional()
  wentism?: string;

  @IsOptional()
  shouzhongcs?: string;

  @IsOptional()
  gongcscs?: string;

  @IsOptional()
  shouhoucs?: string;

  @IsOptional()
  shouzhongbz?: string;

  @IsOptional()
  gongchengsbz?: string;

  @IsOptional()
  shouhoubz?: string;

  @IsOptional()
  xggcs?: string;

  @IsOptional()
  engineer?: string;

  @IsOptional()
  jingjicd?: string;

  @IsOptional()
  taolunbz?: string;

  @IsOptional()
  szcsgcs?: string;

  @IsOptional()
  FanKuiQD?: string;

  @IsOptional()
  shcsgcs?: string;

  @IsOptional()
  cssj?: Date;

  @IsOptional()
  lurusr?: string;

  @IsOptional()
  lurumid?: number;
}

export class QueryFeedbackDto {
  @IsOptional()
  page?: number;

  @IsOptional()
  pageSize?: number;

  @IsOptional()
  id?: number;

  @IsOptional()
  keyword?: string;

  @IsOptional()
  hospital?: string;

  @IsOptional()
  yiyuanmc?: string;

  @IsOptional()
  module?: string;

  @IsOptional()
  mokuai?: string;

  @IsOptional()
  shishiry?: string;

  @IsOptional()
  xggcs?: string;

  @IsOptional()
  engineer?: string;

  @IsOptional()
  gongchengsbz?: string;

  @IsOptional()
  shouhoubz?: string;

  @IsOptional()
  taolunbz?: string;

  @IsOptional()
  zhuangtai?: string;

  @IsOptional()
  lurumid?: number;

  @IsOptional()
  lurusr?: string;

  @IsOptional()
  startDate?: string;

  @IsOptional()
  endDate?: string;

  @IsOptional()
  dateField?: string;  // 日期查询字段：lvrusj（录入时间，默认）或 xgsj（处理时间）
}
