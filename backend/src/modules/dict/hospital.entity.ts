import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('zd_yiyuanmc')
export class Hospital {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: 'yiyuanmc', length: 200, nullable: true })
  yiyuanmc: string;

  @Column({ name: 'pym', length: 100, nullable: true })
  pym: string;

  @Column({ name: 'mk', length: 100, nullable: true })
  mk: string;

  @Column({ name: 'syq', length: 100, nullable: true })
  syq: string;

  @Column({ name: 'beizhu', length: 500, nullable: true })
  beizhu: string;

  @Column({ name: 'zhuangtai', default: 1 })
  zhuangtai: number;
}
