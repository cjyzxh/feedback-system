import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('permission')
export class Permission {

  @PrimaryColumn({ name: 'id' })
  id: number;

  @Column({ name: 'code', length: 50, type: 'nvarchar' })
  code: string;

  @Column({ name: 'name', length: 100, type: 'nvarchar' })
  name: string;

  @Column({ name: 'parentCode', length: 50, nullable: true, type: 'nvarchar' })
  parentCode?: string | null;

  @Column({ name: 'status', nullable: true })
  status?: number | null;

  @Column({ name: 'sort', nullable: true })
  sort?: number | null;
}
