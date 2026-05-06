import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('yw_banben')
export class YwBanben {

  @PrimaryColumn({ name: 'lsh' })
  lsh: number;

  @Column({ name: 'banben', length: 50, type: 'varchar' })
  banben: string;
}
