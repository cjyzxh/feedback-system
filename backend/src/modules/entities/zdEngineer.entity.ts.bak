import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('zd_engineer')
export class ZdEngineer {

  @PrimaryColumn({ name: 'id' })
  id: number;

  @Column({ name: 'name', length: 50, nullable: true, type: 'nvarchar' })
  name?: string | null;

  @Column({ name: 'phone', length: 20, nullable: true, type: 'nvarchar' })
  phone?: string | null;

  @Column({ name: 'status', nullable: true })
  status?: number | null;
}
