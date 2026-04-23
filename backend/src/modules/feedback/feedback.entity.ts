import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity('yw_wentilb')
export class Feedback {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: 'lsh', type: 'int', nullable: true })
  lsh: number;

  @Column({ name: 'banben', nullable: true, length: 50 })
  banben: string;

  @Column({ name: 'yiyuanmc', nullable: true, length: 50 })
  hospital: string;

  @Column({ name: 'shishiry', nullable: true, length: 50 })
  shishiry: string;

  @Column({ name: 'mokuai', nullable: true, length: 50 })
  module: string;

  @Column({ name: 'form', nullable: true, length: 50 })
  form: string;

  @Column({ name: 'wentilx', nullable: true, length: 50 })
  wentilx: string;

  @Column({ name: 'wentism', type: 'text', nullable: true })
  wentism: string;

  @Column({ name: 'shouzhongcs', type: 'text', nullable: true })
  shouzhongcs: string;

  @Column({ name: 'gongcscs', type: 'text', nullable: true })
  gongcscs: string;

  @Column({ name: 'shouhoucs', type: 'text', nullable: true })
  shouhoucs: string;

  @Column({ name: 'shouzhongbz', nullable: true, length: 4 })
  shouzhongbz: string;

  @Column({ name: 'gongchengsbz', nullable: true, length: 4 })
  gongchengsbz: string;

  @Column({ name: 'shouhoubz', nullable: true, length: 4 })
  shouhoubz: string;

  @Column({ name: 'xggcs', nullable: true, length: 50 })
  engineer: string;

  @Column({ name: 'csgcs', nullable: true, length: 50 })
  csgcs: string;

  @Column({ name: 'jingjicd', nullable: true, length: 10 })
  jingjicd: string;

  @Column({ name: 'lvrusj', nullable: true })
  lvrusj: Date;

  @Column({ name: 'taolunbz', nullable: true, length: 4 })
  taolunbz: string;

  @Column({ name: 'lurusr', nullable: true, length: 50 })
  lurusr: string;

  @Column({ name: 'lurumid', type: 'int', nullable: true })
  lurumid: number;

  @Column({ name: 'szcsgcs', nullable: true, length: 50 })
  szcsgcs: string;

  @Column({ name: 'shcsgcs', nullable: true, length: 50 })
  shcsgcs: string;
}
