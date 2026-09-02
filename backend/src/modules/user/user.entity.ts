import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, UpdateDateColumn } from 'typeorm';

@Entity('sys_user')
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ unique: true, length: 50 })
  username: string;

  @Column({ length: 200 })
  password: string; // 加密后的密码

  @Column({ length: 50 })
  realName: string;

  @Column({ length: 10, nullable: true })
  gender: string; // 男 | 女

  @Column({ type: 'date', nullable: true })
  birthDate: Date; // 出生日期

  @Column({ length: 100, nullable: true })
  email: string;

  @Column({ length: 20, nullable: true })
  phone: string;

  @Column({ length: 20, default: 'user' })
  role: string; // admin | user

  @Column({ length: 20, default: '内部员工' })
  userType: string; // 内部员工 | 客户

  @Column({ length: 100, nullable: true })
  hospital: string; // 医院名称（客户用户使用）

  @Column({ length: 50, nullable: true })
  follower: string; // 跟进人员（客户用户使用）

  @Column({ type: 'int', default: 1 })
  status: number; // 0: 禁用, 1: 正常

  @CreateDateColumn()
  createTime: Date;

  @UpdateDateColumn()
  updateTime: Date;
}
