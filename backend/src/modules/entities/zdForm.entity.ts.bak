import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('zd_form')
export class ZdForm {

  @PrimaryColumn({ name: 'id' })
  id: number;

  @Column({ name: 'name', length: 100, nullable: true, type: 'nvarchar' })
  name?: string | null;

  @Column({ name: 'module', length: 100, nullable: true, type: 'nvarchar' })
  module?: string | null;

  @Column({ name: 'status', nullable: true })
  status?: number | null;
}
