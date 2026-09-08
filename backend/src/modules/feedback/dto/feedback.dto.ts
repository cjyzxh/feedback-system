// ============================================================
// DTO（数据传输对象）= 定义接口"接收/返回的数据形状"
// 这里全部用 @IsOptional()（可选），因为保存时前端会传完整字段，
// 而更新接口（处理/测试）常常只传一两个字段
// 注意很多字段有两个名字：yiyuanmc/hospital、mokuai/module、
//       chuangtimc/form、xggcs/engineer —— 兼容新旧前端，
//       service 里统一用 || 取其中一个
// ============================================================
import { IsString, IsOptional, IsNumber, Min, Max } from 'class-validator';

// 新增问题时的请求体（POST /api/feedback）
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
  @IsOptional()
  shishiryBM?: string;

  @IsOptional()
  xggcsBM?: string;

  @IsOptional()
  szcsgcsBM?: string;

  @IsOptional()
  shcsgcsBM?: string;

  @IsOptional()
  LSH?: string;
}

// 更新问题时的请求体（PUT /api/feedback/:id）
// 与 Create 几乎一样，但语义是"传哪个改哪个"
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
  @IsOptional()
  shishiryBM?: string;

  @IsOptional()
  xggcsBM?: string;

  @IsOptional()
  szcsgcsBM?: string;

  @IsOptional()
  shcsgcsBM?: string;

  @IsOptional()
  LSH?: string;
}

// 查询列表时的查询参数（GET /api/feedback?xxx=...）
// 页面顶部的搜索条件都映射到这里
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

  @IsOptional()
  shishiryBM?: string;

  @IsOptional()
  xggcsBM?: string;
}
