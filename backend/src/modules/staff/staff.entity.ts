import { Entity, Column, PrimaryGeneratedColumn, CreateDateColumn, UpdateDateColumn } from 'typeorm';

@Entity('zd_jishuyuan')
export class Staff {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: 'xingming', length: 50, nullable: true })
  xingming: string;

  @Column({ name: 'gender', length: 10, nullable: true })
  gender: string;

  @Column({ name: 'birth_date', type: 'date', nullable: true })
  birthDate: Date;

  @Column({ name: 'phone', length: 20, nullable: true })
  phone: string;

  @Column({ name: 'email', length: 50, nullable: true })
  email: string;

  @Column({ name: 'zhiwu', length: 50, nullable: true })
  zhiwu: string;

  @Column({ name: 'zhuangtai', type: 'int', default: 1 })
  zhuangtai: number;

  @Column({ name: 'category', length: 20, nullable: true })
  category: string;

  @CreateDateColumn({ name: 'createTime' })
  createTime: Date;

  @UpdateDateColumn({ name: 'updateTime' })
  updateTime: Date;
}
