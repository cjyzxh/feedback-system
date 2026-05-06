import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('xt_mokuai')
export class XtMokuai {

  @PrimaryColumn({ name: 'xt' })
  xt?: string | null;

  @Column({ name: 'mokuai', length: 50, nullable: true, type: 'varchar' })
  mokuai?: string | null;
}
