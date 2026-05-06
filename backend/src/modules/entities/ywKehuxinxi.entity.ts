import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('yw_kehuxinxi')
export class YwKehuxinxi {

  @PrimaryColumn({ name: 'ID' })
  id: number;

  @Column({ name: 'yiyuanmc', length: 50, nullable: true, type: 'varchar' })
  yiyuanmc?: string | null;

  @Column({ name: 'shishiry', length: 10, nullable: true, type: 'varchar' })
  shishiry?: string | null;

  @Column({ name: 'shoujihao', length: 50, nullable: true, type: 'varchar' })
  shoujihao?: string | null;

  @Column({ name: 'gudingdh', length: 40, nullable: true, type: 'varchar' })
  gudingdh?: string | null;

  @Column({ name: 'sskaishisj', nullable: true, type: 'datetime' })
  sskaishisj?: Date | null;

  @Column({ name: 'yiyuanmokuai', length: 800, nullable: true, type: 'varchar' })
  yiyuanmokuai?: string | null;

  @Column({ name: 'xiaoshoury', length: 12, nullable: true, type: 'varchar' })
  xiaoshoury?: string | null;

  @Column({ name: 'xitonggly', length: 12, nullable: true, type: 'varchar' })
  xitonggly?: string | null;

  @Column({ name: 'ssjieshusj', nullable: true, type: 'datetime' })
  ssjieshusj?: Date | null;

  @Column({ name: 'cclx', length: 400, nullable: true, type: 'varchar' })
  cclx?: string | null;

  @Column({ name: 'yiyuanfuzher', length: 50, nullable: true, type: 'varchar' })
  yiyuanfuzher?: string | null;

  @Column({ name: 'glydh', length: 50, nullable: true, type: 'varchar' })
  glydh?: string | null;

  @Column({ name: 'weihujssj', nullable: true, type: 'datetime' })
  weihujssj?: Date | null;

  @Column({ name: 'qtsm', length: 500, nullable: true, type: 'varchar' })
  qtsm?: string | null;

  @Column({ name: 'zhuangtai', length: 50, nullable: true, type: 'varchar' })
  zhuangtai?: string | null;

  @Column({ name: 'xiadansj', nullable: true, type: 'datetime' })
  xiadansj?: Date | null;

  @Column({ name: 'dizhi', length: 500, nullable: true, type: 'varchar' })
  dizhi?: string | null;

  @Column({ name: 'banben', length: 50, nullable: true, type: 'varchar' })
  banben?: string | null;

  @Column({ name: 'glysj', length: 50, nullable: true, type: 'varchar' })
  glysj?: string | null;

  @Column({ name: 'ruanjianzj', length: 15, nullable: true, type: 'varchar' })
  ruanjianzj?: string | null;

  @Column({ name: 'fukuanfs', length: 500, nullable: true, type: 'varchar' })
  fukuanfs?: string | null;

  @Column({ name: 'ruanjianyk', length: 15, nullable: true, type: 'varchar' })
  ruanjianyk?: string | null;

  @Column({ name: 'qy', length: 20, nullable: true, type: 'varchar' })
  qy?: string | null;

  @Column({ name: 'enddime', nullable: true, type: 'datetime' })
  enddime?: Date | null;

  @Column({ name: 'rjklb', length: 50, nullable: true, type: 'varchar' })
  rjklb?: string | null;

  @Column({ name: 'hetong', length: 50, nullable: true, type: 'varchar' })
  hetong?: string | null;

  @Column({ name: 'piaoju', length: 50, nullable: true, type: 'varchar' })
  piaoju?: string | null;

  @Column({ name: 'WanGongenddime', nullable: true, type: 'smalldatetime' })
  wanGongenddime?: Date | null;

  @Column({ name: 'weihufei', length: 20, nullable: true, type: 'varchar' })
  weihufei?: string | null;

  @Column({ name: 'weihuStarttime', nullable: true, type: 'smalldatetime' })
  weihuStarttime?: Date | null;

  @Column({ name: 'weihuEndtime', nullable: true, type: 'smalldatetime' })
  weihuEndtime?: Date | null;

  @Column({ name: 'pym', length: 50, nullable: true, type: 'varchar' })
  pym?: string | null;
}
