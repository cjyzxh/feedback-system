import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('zd_XiTongMoKuai')
export class ZdXiTongMoKuai {

  @PrimaryColumn({ name: 'MoKuaiDM' })
  moKuaiDM: number;

  @Column({ name: 'FuMoKDM' })
  fuMoKDM: number;

  @Column({ name: 'MoKuaiMC', length: 50, type: 'varchar' })
  moKuaiMC: string;

  @Column({ name: 'MoKuaiMS', length: 50, type: 'varchar' })
  moKuaiMS: string;

  @Column({ name: 'ChuangTiM', length: 50, nullable: true, type: 'varchar' })
  chuangTiM?: string | null;

  @Column({ name: 'SuoShuGC', length: 20, type: 'varchar' })
  suoShuGC: string;

  @Column({ name: 'TingYongBZ', length: 2, type: 'varchar' })
  tingYongBZ: string;

  @Column({ name: 'JiLuSCR', length: 6, type: 'varchar' })
  jiLuSCR: string;

  @Column({ name: 'JiLuSCRMC', length: 20, type: 'varchar' })
  jiLuSCRMC: string;

  @Column({ name: 'JiLuSCRQ', type: 'datetime' })
  jiLuSCRQ: Date;

  @Column({ name: 'ZuiHouXGR', length: 6, type: 'varchar' })
  zuiHouXGR: string;

  @Column({ name: 'ZuiHouXGRMC', length: 20, type: 'varchar' })
  zuiHouXGRMC: string;

  @Column({ name: 'ZuiHouXGRQ', type: 'datetime' })
  zuiHouXGRQ: Date;
}
