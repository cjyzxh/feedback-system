// ============================================================
// 通知消息实体（xt_tzxx 表）
// 作用：记录"事件通知"——谁做了什么操作，该提醒谁
//   新增问题 → 提醒工程师+跟进人
//   处理确认 → 提醒跟进人+反馈人
//   测试确认 → 提醒反馈人+工程师+跟进人
// 前端右下角轮询"我的未读通知"，点击后标记已读
// ============================================================
import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity('xt_tzxx')
export class Tzxx {
  @PrimaryGeneratedColumn({ name: 'ID' })
  id: number;

  @Column({ name: 'wentiid', nullable: true })  // 关联的问题ID
  wentiid: number;

  @Column({ name: 'lx', nullable: true, length: 20 })  // 通知类型：新增/处理/测试/返回
  lx: string;

  @Column({ name: 'jsrbm', nullable: true, length: 50 })  // 接收人编码（sys_user.username）
  jsrbm: string;

  @Column({ name: 'nr', nullable: true, length: 500 })  // 通知内容
  nr: string;

  @Column({ name: 'ydsj', nullable: true })  // 已读时间（NULL=未读）
  ydsj: Date;

  @Column({ name: 'lrsj', nullable: true })  // 创建时间
  lrsj: Date;
}
