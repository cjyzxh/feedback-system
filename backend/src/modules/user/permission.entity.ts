import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('sys_permission')
export class Permission {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ length: 50 })
  code: string; // 页面代码，如 'feedback', 'test', 'settings'

  @Column({ length: 100 })
  name: string; // 页面名称，如 '问题反馈'

  @Column({ length: 50, nullable: true })
  parentCode: string; // 父级页面代码

  @Column({ type: 'int', default: 1 })
  status: number; // 0: 禁用, 1: 正常

  @Column({ type: 'int', default: 0 })
  sort: number; // 排序
}
