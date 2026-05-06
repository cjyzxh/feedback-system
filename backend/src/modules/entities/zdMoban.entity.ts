import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('zd_moban')
export class ZdMoban {

  @PrimaryColumn({ name: 'ID' })
  id: number;

  @Column({ name: 'mobanlx', length: 12, type: 'varchar' })
  mobanlx: string;

  @Column({ name: 'moban', length: 100, type: 'varchar' })
  moban: string;
}
