import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('yw_KeHuZhuCe')
export class YwKeHuZhuCe {

  @PrimaryColumn({ name: 'id' })
  id: number;

  @Column({ name: 'YiYuanMC', length: 100, type: 'varchar' })
  yiYuanMC: string;

  @Column({ name: 'MoKuaiMC', length: 30, type: 'varchar' })
  moKuaiMC: string;

  @Column({ name: 'ShuLiang', length: 20, nullable: true, type: 'varchar' })
  shuLiang?: string | null;

  @Column({ name: 'LeiXing', length: 2, nullable: true, type: 'varchar' })
  leiXing?: string | null;
}
