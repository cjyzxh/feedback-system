import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('xt_ConfigServer')
export class XtConfigServer {

  @PrimaryColumn({ name: 'YHM' })
  yhm?: string | null;

  @Column({ name: 'YHMC', length: 50, nullable: true, type: 'nvarchar' })
  yhmc?: string | null;

  @Column({ name: 'SJ', length: 30, nullable: true, type: 'nvarchar' })
  sj?: string | null;

  @Column({ name: 'ZZDS', nullable: true })
  zzds?: number | null;

  @Column({ name: 'MK', nullable: true, type: 'nvarchar' })
  mk?: string | null;

  @Column({ name: 'ZCM', nullable: true, type: 'nvarchar' })
  zcm?: string | null;

  @Column({ name: 'SYQ', nullable: true, type: 'datetime' })
  syq?: Date | null;

  @Column({ name: 'YJLX', length: 10, nullable: true, type: 'nvarchar' })
  yjlx?: string | null;

  @Column({ name: 'RQLX', length: 10, nullable: true, type: 'nvarchar' })
  rqlx?: string | null;

  @Column({ name: 'sID', length: 30, nullable: true, type: 'nvarchar' })
  sID?: string | null;

  @Column({ name: 'YJID', length: 30, nullable: true, type: 'nvarchar' })
  yjid?: string | null;

  @Column({ name: 'SJS', length: 40, nullable: true, type: 'nvarchar' })
  sjs?: string | null;

  @Column({ name: 'LXR', length: 255, nullable: true, type: 'nvarchar' })
  lxr?: string | null;

  @Column({ name: 'DH', length: 255, nullable: true, type: 'nvarchar' })
  dh?: string | null;

  @Column({ name: 'QY', length: 255, nullable: true, type: 'nvarchar' })
  qy?: string | null;

  @Column({ name: 'ZuoFeiBZ', length: 255, nullable: true, type: 'nvarchar' })
  zuoFeiBZ?: string | null;

  @Column({ name: 'FuWuQi', nullable: true, type: 'datetime' })
  fuWuQi?: Date | null;

  @Column({ name: 'FuWuFei', length: 255, nullable: true, type: 'nvarchar' })
  fuWuFei?: string | null;

  @Column({ name: 'BeiZhu', length: 255, nullable: true, type: 'nvarchar' })
  beiZhu?: string | null;
}
