import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('zd_jishuyuan')
export class Engineer {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: 'xingming', length: 50, nullable: true })
  xingming: string;

  @Column({ name: 'zhiwu', length: 50, nullable: true })
  zhiwu: string;

  @Column({ name: 'zhuangtai', default: 1 })
  zhuangtai: number;
}
