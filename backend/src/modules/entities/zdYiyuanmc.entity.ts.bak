import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('zd_yiyuanmc')
export class ZdYiyuanmc {

  @PrimaryColumn({ name: 'ID' })
  id: number;

  @Column({ name: 'daima', nullable: true })
  daima?: number | null;

  @Column({ name: 'yiyuanmc', length: 50, type: 'varchar' })
  yiyuanmc: string;

  @Column({ name: 'pym', length: 50, nullable: true, type: 'varchar' })
  pym?: string | null;
}
