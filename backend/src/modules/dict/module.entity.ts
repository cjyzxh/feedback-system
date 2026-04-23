import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('zd_mokuai')
export class Module {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: 'banben', length: 50, nullable: true })
  banben: string;

  @Column({ name: 'mokuaimc', length: 100, nullable: true })
  mokuaimc: string;
}
