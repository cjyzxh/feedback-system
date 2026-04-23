import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn } from 'typeorm';

@Entity('yw_wentitp')
export class FeedbackImage {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: 'lsh', length: 50, nullable: true })
  lsh: string;

  @Column({ name: 'yiyuanmc', length: 200, nullable: true })
  yiyuanmc: string;

  @Column({ name: 'tpnum', nullable: true })
  tpnum: number;

  // 存储图片路径，改为 varchar 类型
  @Column({ name: 'pic1', type: 'varchar', length: 500, nullable: true })
  pic1: string;

  @CreateDateColumn({ name: 'lurusj' })
  lurusj: Date;
}
