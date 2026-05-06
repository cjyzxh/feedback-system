import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('ok')
export class Ok {

  @PrimaryColumn({ name: 'lsh' })
  lsh: number;

  @Column({ name: 'rzlsh', nullable: true })
  rzlsh?: number | null;

  @Column({ name: 'banben', length: 50, nullable: true, type: 'varchar' })
  banben?: string | null;
}
