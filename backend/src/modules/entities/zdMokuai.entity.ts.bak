import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('zd_mokuai')
export class ZdMokuai {

  @PrimaryColumn({ name: 'ID' })
  id: number;

  @Column({ name: 'banben', length: 50, type: 'varchar' })
  banben: string;

  @Column({ name: 'mokuaimc', length: 50, type: 'varchar' })
  mokuaimc: string;

  @Column({ name: 'mokuaidm' })
  mokuaidm: number;
}
