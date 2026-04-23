import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, UpdateDateColumn } from 'typeorm';

@Entity('sys_role')
export class Role {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ length: 50, unique: true })
  name: string;

  @Column({ length: 200, nullable: true })
  description: string;

  @Column({ type: 'text', nullable: true })
  permissions: string;

  @Column({ name: 'view_others', type: 'int', default: 0 })
  viewOthers: number;

  @Column({ name: 'is_admin', type: 'int', default: 0 })
  isAdmin: number;

  @Column({ type: 'int', default: 1 })
  status: number;

  @CreateDateColumn({ name: 'create_time' })
  createTime: Date;

  @UpdateDateColumn({ name: 'update_time' })
  updateTime: Date;
}
