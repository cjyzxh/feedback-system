import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('yw_kehuxinxiMingxi_bak')
export class YwKehuxinxiMingxiBak {

  @Column({ name: 'AutoID', nullable: true })
  autoID?: number | null;

  @Column({ name: 'ID', nullable: true })
  id?: number | null;

  @Column({ name: 'banben', length: 50, nullable: true, type: 'varchar' })
  banben?: string | null;

  @Column({ name: 'rjklb', length: 50, nullable: true, type: 'varchar' })
  rjklb?: string | null;

  @Column({ name: 'yanshiry', length: 50, nullable: true, type: 'varchar' })
  yanshiry?: string | null;

  @PrimaryColumn({ name: 'yiyuanmokuai' })
  yiyuanmokuai: string;

  @Column({ name: 'xiaoshoury', length: 12, type: 'varchar' })
  xiaoshoury: string;

  @Column({ name: 'qtsm', length: 500, type: 'varchar' })
  qtsm: string;

  @Column({ name: 'xiadansj', nullable: true, type: 'smalldatetime' })
  xiadansj?: Date | null;

  @Column({ name: 'jilusj', nullable: true, type: 'smalldatetime' })
  jilusj?: Date | null;

  @Column({ name: 'glysj', length: 50, nullable: true, type: 'varchar' })
  glysj?: string | null;

  @Column({ name: 'ruanjianzj', nullable: true })
  ruanjianzj?: number | null;

  @Column({ name: 'fukuanfs', length: 500, nullable: true, type: 'varchar' })
  fukuanfs?: string | null;

  @Column({ name: 'ruanjianyk', nullable: true })
  ruanjianyk?: number | null;

  @Column({ name: 'hetong', length: 50, nullable: true, type: 'varchar' })
  hetong?: string | null;

  @Column({ name: 'piaoju', length: 50, nullable: true, type: 'varchar' })
  piaoju?: string | null;

  @Column({ name: 'bShanchu', nullable: true })
  bShanchu?: boolean | null;
}
