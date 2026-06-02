import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('zd_jishuyuan')
export class Staff {
  @PrimaryColumn({ name: 'ID' })
  id: number;

  @Column({ name: 'gonghao' })
  gonghao: number;

  @Column({ name: 'xingming', length: 10, type: 'varchar' })
  xingming: string;

  @Column({ name: 'zhiwu', length: 8, type: 'varchar' })
  zhiwu: string;

  @Column({ name: 'zhuangtai', length: 50, nullable: true, type: 'varchar' })
  zhuangtai?: string | null;
}
