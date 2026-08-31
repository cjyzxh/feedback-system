import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('xt_ConfigServer')
export class Hospital {
  @PrimaryGeneratedColumn({ name: 'ID' })
  id: number;

  @Column({ name: 'YHM', type: 'nvarchar', length: 'MAX', nullable: true })
  yhm: string;

  @Column({ name: 'YHMC', length: 200, nullable: true })
  name: string;

  @Column({ name: 'SJ', type: 'datetime', nullable: true })
  sj: Date;

  @Column({ name: 'ZZDS', type: 'int', nullable: true })
  zzds: number;

  @Column({ name: 'MK', type: 'nvarchar', length: 'MAX', nullable: true })
  mk: string;

  @Column({ name: 'ZCM', type: 'nvarchar', length: 'MAX', nullable: true })
  zcm: string;

  @Column({ name: 'SYQ', type: 'int', nullable: true })
  syq: number;

  @Column({ name: 'YJLX', length: 50, nullable: true })
  yjlx: string;

  @Column({ name: 'RQLX', length: 50, nullable: true })
  rqlx: string;

  @Column({ name: 'YJID', length: 100, nullable: true })
  yjid: string;

  @Column({ name: 'SJS', length: 100, nullable: true })
  sjs: string;

  @Column({ name: 'LXR', length: 50, nullable: true })
  lxr: string;

  @Column({ name: 'DH', length: 100, nullable: true })
  dh: string;

  @Column({ name: 'QY', length: 50, nullable: true })
  qy: string;

  @Column({ name: 'ZuoFeiBZ', length: 10, nullable: true })
  zuofeibz: string;

  @Column({ name: 'pym', length: 100, nullable: true })
  pym: string;
}
