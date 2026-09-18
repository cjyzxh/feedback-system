// ============================================================
// 附件信息表 zd_fjxx 的实体类（Entity）
// 作用：告诉 TypeORM 这张表有哪些字段，代码里用 fjxxRepository
//       操作时自动生成 SQL（类比 VB6 中与表字段一一对应的 Type）
// 用途：问题处理/测试页上传的附件元信息，记录上传者，
//       支持列表显示上传者姓名、"仅上传者本人可删除"
// ============================================================
import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity('zd_fjxx')
export class Fjxx {
  @PrimaryGeneratedColumn({ name: 'id' })
  id: number;

  @Column({ name: 'wentiId', type: 'int' })  // 问题ID（yw_wentilb.ID）
  wentiId: number;

  @Column({ name: 'filename', length: 255 })  // 磁盘文件名 {id}-{seq}#{原名}，唯一
  filename: string;

  @Column({ name: 'baseName', length: 255, nullable: true })  // 原文件名（展示用）
  baseName: string;

  @Column({ name: 'seq', type: 'int', nullable: true })  // 序号
  seq: number;

  @Column({ name: 'uploadUser', length: 50, nullable: true })  // 上传者编码（sys_user.username）
  uploadUser: string;

  @Column({ name: 'uploadName', length: 50, nullable: true })  // 上传者姓名（sys_user.realName）
  uploadName: string;

  @Column({ name: 'lrsj', type: 'datetime', default: () => 'GETDATE()' })  // 上传时间
  lrsj: Date;

  @Column({ name: 'lx', length: 10, nullable: true })  // 附件类型：image=图片 / file=文件附件（老数据NULL视为file）
  lx: string;
}
