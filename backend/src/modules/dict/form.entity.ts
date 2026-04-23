import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('zd_chuangti')
export class Form {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: 'mokuai', length: 100, nullable: true })
  mokuai: string;

  @Column({ name: 'chuangtimc', length: 100, nullable: true })
  chuangtimc: string;
}
