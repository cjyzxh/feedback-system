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

  @Column({ length: 20, default: '' })
  themeMode: string; // 个人界面样式偏好：空=跟随系统，morandi/light/dark

  @Column({ length: 20, default: '' })
  fontSize: string; // 个人字体大小偏好：空=跟随系统，small/standard/large/xlarge

  @Column({ length: 20, default: '' })
  scaleMode: string; // 个人缩放模式偏好：空=跟随系统，auto=等比缩放，none=原始缩放

  @Column({ type: 'int', default: 0 })
  isShishi: number; // 是否实施人员：1=是，0=否（内部员工勾选）

  @Column({ type: 'int', default: 0 })
  isYanfa: number; // 是否研发人员：1=是，0=否（内部员工勾选）

  @Column({ type: 'int', default: 1 })
  status: number; // 0: 禁用, 1: 正常

  @Column({ length: 64, nullable: true })
  sessionId: string; // 当前登录会话标识（登录互斥：新登录顶掉旧登录）

  @CreateDateColumn()
  createTime: Date;

  @UpdateDateColumn()
  updateTime: Date;
}
