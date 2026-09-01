import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('role')
export class Role {

  @PrimaryColumn({ name: 'id' })
  id: number;

  @Column({ name: 'name', length: 50, type: 'nvarchar' })
  name: string;

  @Column({ name: 'description', nullable: true })
  description?: string | null;

  @Column({ name: 'view_others', nullable: true })
  viewOthers?: number | null;

  @Column({ name: 'is_admin', nullable: true })
  isAdmin?: number | null;

  @Column({ name: 'status', nullable: true })
  status?: number | null;

  @Column({ name: 'create_time', nullable: true, type: 'datetime' })
  createTime?: Date | null;

  @Column({ name: 'update_time', nullable: true, type: 'datetime' })
  updateTime?: Date | null;
}
