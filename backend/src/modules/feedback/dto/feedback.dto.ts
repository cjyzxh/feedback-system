import { IsString, IsOptional, IsNumber, Min, Max } from 'class-validator';

export class CreateFeedbackDto {
  @IsOptional()
  lsh?: string | number;

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
  wentilx?: string;

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
  csgcs?: string;

  @IsOptional()
  jingjicd?: string;

  @IsOptional()
  taolunbz?: string;

  @IsOptional()
  lurusr?: string;

  @IsOptional()
  lurumid?: number;
}

export class UpdateFeedbackDto {
  @IsOptional()
  lsh?: string | number;

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
  wentilx?: string;

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
  csgcs?: string;

  @IsOptional()
  jingjicd?: string;

  @IsOptional()
  taolunbz?: string;

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
  lsh?: string | number;

  @IsOptional()
  shishiry?: string;

  @IsOptional()
  xggcs?: string;

  @IsOptional()
  engineer?: string;

  @IsOptional()
  gongchengsbz?: string;

  @IsOptional()
  lurumid?: number;

  @IsOptional()
  lurusr?: string;
}
