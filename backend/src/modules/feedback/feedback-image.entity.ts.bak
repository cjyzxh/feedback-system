import { Entity, PrimaryColumn, Column, CreateDateColumn } from 'typeorm';

@Entity('yw_wentitp')
export class FeedbackImage {
  @PrimaryColumn({ name: 'ID' })
  id: number;

  @Column({ name: 'lsh', type: 'int', nullable: true })
  lsh: number;

  @Column({ name: 'yiyuanmc', length: 50, nullable: true })
  yiyuanmc: string;

  @Column({ name: 'tpnum', nullable: true })
  tpnum: number;

  // pic1 是 image 类型，但我们存文件名路径，还是用 varchar
  @Column({ name: 'pic1', type: 'varchar', length: 500, nullable: true })
  pic1: string;

  @CreateDateColumn({ name: 'lurusj' })
  lurusj: Date;
}
