import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('Jczd')
export class Jczd {

  @PrimaryColumn({ name: 'ID' })
  id: number;

  @Column({ name: 'LeiBie', length: 50, type: 'varchar' })
  leiBie: string;

  @Column({ name: 'MingCheng', length: 100, nullable: true, type: 'varchar' })
  mingCheng?: string | null;
}
