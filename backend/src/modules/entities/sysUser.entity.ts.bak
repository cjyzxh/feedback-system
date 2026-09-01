import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('sys_user')
export class SysUser {

  @PrimaryColumn({ name: 'id' })
  id: number;

  @Column({ name: 'username', length: 50, type: 'nvarchar' })
  username: string;

  @Column({ name: 'password', length: 200, type: 'nvarchar' })
  password: string;

  @Column({ name: 'realName', length: 50, nullable: true, type: 'nvarchar' })
  realName?: string | null;

  @Column({ name: 'email', length: 100, nullable: true, type: 'nvarchar' })
  email?: string | null;

  @Column({ name: 'phone', length: 20, nullable: true, type: 'nvarchar' })
  phone?: string | null;

  @Column({ name: 'role', length: 20, nullable: true, type: 'nvarchar' })
  role?: string | null;

  @Column({ name: 'status', nullable: true })
  status?: number | null;

  @Column({ name: 'createTime', nullable: true, type: 'datetime' })
  createTime?: Date | null;

  @Column({ name: 'updateTime', nullable: true, type: 'datetime' })
  updateTime?: Date | null;
}
