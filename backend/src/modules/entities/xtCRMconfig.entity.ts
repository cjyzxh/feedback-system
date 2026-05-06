import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('xt_CRMconfig')
export class XtCRMconfig {

  @PrimaryColumn({ name: 'ID1' })
  id1: number;

  @Column({ name: 'ID', nullable: true })
  id?: number | null;

  @Column({ name: '用户码', length: 255, nullable: true, type: 'nvarchar' })
  用户码?: string | null;

  @Column({ name: '集团名称', length: 255, nullable: true, type: 'nvarchar' })
  集团名称?: string | null;

  @Column({ name: '地区', length: 255, nullable: true, type: 'nvarchar' })
  地区?: string | null;

  @Column({ name: '联系人', length: 255, nullable: true, type: 'nvarchar' })
  联系人?: string | null;

  @Column({ name: '联系方式', length: 255, nullable: true, type: 'nvarchar' })
  联系方式?: string | null;

  @Column({ name: '硬件类型', length: 255, nullable: true, type: 'nvarchar' })
  硬件类型?: string | null;

  @Column({ name: '集团售后日期', nullable: true, type: 'datetime' })
  集团售后日期?: Date | null;

  @Column({ name: '年维护费', length: 255, nullable: true, type: 'nvarchar' })
  年维护费?: string | null;

  @Column({ name: '硬件ID', length: 255, nullable: true, type: 'nvarchar' })
  硬件id?: string | null;

  @Column({ name: '锁ID', length: 255, nullable: true, type: 'nvarchar' })
  锁id?: string | null;

  @Column({ name: '随机数', length: 255, nullable: true, type: 'nvarchar' })
  随机数?: string | null;

  @Column({ name: '备注', length: 255, nullable: true, type: 'nvarchar' })
  备注?: string | null;

  @Column({ name: '秘钥', nullable: true, type: 'nvarchar' })
  秘钥?: string | null;

  @Column({ name: '作废标志', length: 255, nullable: true, type: 'nvarchar' })
  作废标志?: string | null;

  @Column({ name: '生成时间', nullable: true, type: 'datetime' })
  生成时间?: Date | null;
}
