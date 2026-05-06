import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('xt_YiYuanCRM')
export class XtYiYuanCRM {

  @PrimaryColumn({ name: 'ID1' })
  id1: number;

  @Column({ name: 'ID', nullable: true })
  id?: number | null;

  @Column({ name: '用户码', length: 255, nullable: true, type: 'nvarchar' })
  用户码?: string | null;

  @Column({ name: '集团名称', length: 255, nullable: true, type: 'nvarchar' })
  集团名称?: string | null;

  @Column({ name: '医院代码', length: 255, nullable: true, type: 'nvarchar' })
  医院代码?: string | null;

  @Column({ name: '医院名称', length: 255, nullable: true, type: 'nvarchar' })
  医院名称?: string | null;

  @Column({ name: '地区', length: 255, nullable: true, type: 'nvarchar' })
  地区?: string | null;

  @Column({ name: '售后到期时间', length: 255, nullable: true, type: 'nvarchar' })
  售后到期时间?: string | null;

  @Column({ name: '站点数', length: 255, nullable: true, type: 'nvarchar' })
  站点数?: string | null;

  @Column({ name: '模块', length: 255, nullable: true, type: 'nvarchar' })
  模块?: string | null;
}
