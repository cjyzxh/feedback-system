// ============================================================
// 实体类（Entity）= 数据库表的"映射模板"
// 作用：告诉 TypeORM 这张表有哪些字段、什么类型，代码里操作
//       feedbackRepository 时就能自动生成对应的 SQL
// 类比 VB6：相当于一个和数据库表字段一一对应的 Type/用户自定义类型，
//       也像 ADO 里 rs("字段名") 的标准列表
// 注意：字段名用的是拼音缩写（历史遗留命名），含义见每个字段注释
// ============================================================
import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

// @Entity('yw_wentilb') = 本类对应数据库里的 yw_wentilb 表（问题列表）
@Entity('yw_wentilb')
export class Feedback {
  // @PrimaryGeneratedColumn = 自增主键（类比 SQL Server 的 IDENTITY）
  // name: 'ID' = 数据库列名叫 ID，实体属性名叫 id
  @PrimaryGeneratedColumn({ name: 'ID' })
  id: number;

  @Column({ name: 'banben', nullable: true, length: 50 })  // 版本：HIS问题/医保接口/其它问题
  banben: string;

  @Column({ name: 'yiyuanmc', nullable: true, length: 50 })  // 医院名称
  yiyuanmc: string;

  @Column({ name: 'shishiry', nullable: true, length: 50 })  // 实施人员 = 跟进人员
  shishiry: string;

  @Column({ name: 'mokuai', nullable: true, length: 50 })  // 模块
  mokuai: string;

  @Column({ name: 'chuangtimc', nullable: true, length: 50 })  // 窗体名称
  chuangtimc: string;

  @Column({ name: 'wentism', type: 'text', nullable: true })  // 问题说明（长文本）
  wentism: string;

  @Column({ name: 'shouzhongcs', type: 'text', nullable: true })  // 测试说明（售后中转说明）
  shouzhongcs: string;

  @Column({ name: 'gongcscs', type: 'text', nullable: true })  // 工程师处理意见
  gongcscs: string;

  @Column({ name: 'shouhoucs', type: 'text', nullable: true })  // 测试结果（售后处理意见）
  shouhoucs: string;

  @Column({ name: 'shouzhongbz', nullable: true, length: 4 })  // 售后受理标志 Y/N
  shouzhongbz: string;

  @Column({ name: 'gongchengsbz', nullable: true, length: 4 })  // 工程师处理标志 Y/N（核心状态位）
  gongchengsbz: string;

  @Column({ name: 'shouhoubz', nullable: true, length: 4 })  // 售后完成标志 = 测试完成 Y/N
  shouhoubz: string;

  @Column({ name: 'xggcs', nullable: true, length: 50 })  // 修改工程师（谁负责处理）
  xggcs: string;

  @Column({ name: 'jingjicd', nullable: true, length: 10 })  // 紧急程度：一般/急/紧急
  jingjicd: string;

  @Column({ name: 'wentilx', nullable: true, length: 20 })  // 问题类型：软件BUG/业务逻辑/个性化/其它问题
  wentilx: string;

  @Column({ name: 'lvrusj', nullable: true })  // 录入时间（新增时自动写入）
  lvrusj: Date;

  @Column({ name: 'xgsj', nullable: true })  // 修改时间（每次更新自动刷新）
  xgsj: Date;

  @Column({ name: 'taolunbz', nullable: true, length: 4 })  // 待讨论标志 Y/N
  taolunbz: string;

  @Column({ name: 'szcsgcs', nullable: true, length: 50 })  // 反馈人（谁提的问题，删除权限用它判断）
  szcsgcs: string;

  @Column({ name: 'FanKuiQD', nullable: true, length: 20 })  // 反馈渠道（取登录者的用户类型）
  FanKuiQD: string;

  @Column({ name: 'shcsgcs', nullable: true, length: 50 })  // 测试人（谁测试的）
  shcsgcs: string;

  @Column({ name: 'cssj', nullable: true })  // 测试时间（确认测试通过时写入）
  cssj: Date;

  @Column({ name: 'fanhuisj', nullable: true })  // 问题返回时间（返回测试时写入，二次返回覆盖更新）
  fanhuisj: Date;

  @Column({ name: 'shishiryBM', nullable: true, length: 50 })  // 跟进人员编码（sys_user.username）
  shishiryBM: string;

  @Column({ name: 'xggcsBM', nullable: true, length: 50 })  // 修改工程师编码
  xggcsBM: string;

  @Column({ name: 'szcsgcsBM', nullable: true, length: 50 })  // 反馈人编码
  szcsgcsBM: string;

  @Column({ name: 'shcsgcsBM', nullable: true, length: 50 })  // 测试人编码
  shcsgcsBM: string;

  @Column({ name: 'LSH', nullable: true, length: 50 })  // 流水号（导入老数据用）
  LSH: string;
}
