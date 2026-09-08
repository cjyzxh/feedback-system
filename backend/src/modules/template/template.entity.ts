import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('zd_MoBan')
export class MoBan {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ length: 20 })
  moBanLX: string;

  @Column({ length: 10 })
  moBanFW: string;

  @Column({ length: 1000 })
  moBanNR: string;

  // 用户编码（sys_user.username），用于过滤
  @Column({ length: 50 })
  createUser: string;

  // 用户姓名（sys_user.realName），用于显示
  @Column({ length: 50, nullable: true })
  createUserName: string;

  @Column({ type: 'datetime', default: () => 'GETDATE()' })
  createTime: Date;
}
