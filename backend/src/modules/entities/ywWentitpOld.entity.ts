import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('yw_wentitp_old')
export class YwWentitpOld {

  @PrimaryColumn({ name: 'ID' })
  id: number;

  @Column({ name: 'lsh', nullable: true })
  lsh?: number | null;

  @Column({ name: 'pic1', nullable: true, type: 'binary' })
  pic1?: Buffer | null;

  @Column({ name: 'yiyuanmc', length: 50, nullable: true, type: 'varchar' })
  yiyuanmc?: string | null;

  @Column({ name: 'lurusj', nullable: true, type: 'datetime' })
  lurusj?: Date | null;

  @Column({ name: 'tpnum', nullable: true })
  tpnum?: number | null;
}
