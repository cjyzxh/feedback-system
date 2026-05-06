import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('zd_chuangti')
export class ZdChuangti {

  @PrimaryColumn({ name: 'ID' })
  id: number;

  @Column({ name: 'banbenh', length: 20, type: 'varchar' })
  banbenh: string;

  @Column({ name: 'mokuai', length: 40, type: 'varchar' })
  mokuai: string;

  @Column({ name: 'chuangtidm' })
  chuangtidm: number;

  @Column({ name: 'chuangtimc', length: 40, type: 'varchar' })
  chuangtimc: string;
}
