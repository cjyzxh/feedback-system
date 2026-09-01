import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity('yw_wentitp')
export class YwWentitp {

  @PrimaryGeneratedColumn({ name: 'ID' })
  id: number;

  @Column({ name: 'lsh', nullable: true })
  lsh?: number | null;

  @Column({ name: 'pic1', length: 500, nullable: true, type: 'varchar' })
  pic1?: string | null;

  @Column({ name: 'yiyuanmc', length: 50, nullable: true, type: 'varchar' })
  yiyuanmc?: string | null;

  @Column({ name: 'lurusj', nullable: true, type: 'datetime' })
  lurusj?: Date | null;

  @Column({ name: 'tpnum', nullable: true })
  tpnum?: number | null;
}
