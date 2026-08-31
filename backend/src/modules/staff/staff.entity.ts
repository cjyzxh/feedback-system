import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity('zd_jishuyuan')
export class Staff {
  @PrimaryGeneratedColumn({ name: 'ID' })
  id: number;

  @Column({ name: 'gonghao', type: 'int', nullable: true })
  gonghao: number;

  @Column({ name: 'xingming', length: 50, type: 'varchar', nullable: true })
  xingming: string;

  @Column({ name: 'gender', length: 10, type: 'varchar', nullable: true })
  gender: string;

  @Column({ name: 'birthDate', type: 'date', nullable: true })
  birthDate: string;

  @Column({ name: 'phone', length: 20, type: 'varchar', nullable: true })
  phone: string;

  @Column({ name: 'email', length: 100, type: 'varchar', nullable: true })
  email: string;

  @Column({ name: 'zhiwu', length: 50, type: 'varchar', nullable: true })
  zhiwu: string;

  @Column({ name: 'zhuangtai', type: 'int', nullable: true, default: 1 })
  zhuangtai: number;

  @Column({ name: 'category', length: 20, type: 'varchar', nullable: true })
  category: string;
}
