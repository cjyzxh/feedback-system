import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('zd_chuangti')
export class Form {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: 'banbenh', length: 20, nullable: true })
  banbenh: string;

  @Column({ name: 'mokuai', length: 100, nullable: true })
  mokuai: string;

  @Column({ name: 'chuangtidm', type: 'int', nullable: true })
  chuangtidm: number;

  @Column({ name: 'chuangtimc', length: 100, nullable: true })
  chuangtimc: string;
}
