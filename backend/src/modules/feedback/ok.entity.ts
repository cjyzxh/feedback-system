import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('ok')
export class Ok {
  @PrimaryColumn({ name: 'lsh' })
  lsh: number;

  @Column({ name: 'rzlsh', type: 'int', nullable: true })
  rzlsh: number;

  @Column({ name: 'banben', length: 50, nullable: true })
  banben: string;
}
