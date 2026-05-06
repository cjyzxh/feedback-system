import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('yw_KeHuZhuCeXX')
export class YwKeHuZhuCeXX {

  @PrimaryColumn({ name: 'XueLieH' })
  xueLieH: string;

  @Column({ name: 'Pid', length: 30, type: 'varchar' })
  pid: string;

  @Column({ name: 'Pin', length: 30, type: 'varchar' })
  pin: string;

  @Column({ name: 'YiYuanMC', length: 50, nullable: true, type: 'varchar' })
  yiYuanMC?: string | null;

  @Column({ name: 'TingYongBZ', length: 4, nullable: true, type: 'varchar' })
  tingYongBZ?: string | null;

  @Column({ name: 'JiLuSCRQ', nullable: true, type: 'datetime' })
  jiLuSCRQ?: Date | null;

  @Column({ name: 'PidM', length: 30, type: 'varchar' })
  pidM: string;

  @Column({ name: 'PinM', length: 30, type: 'varchar' })
  pinM: string;

  @Column({ name: '注册码2', length: 50, nullable: true, type: 'varchar' })
  注册码2?: string | null;

  @Column({ name: '注册码3', length: 100, nullable: true, type: 'varchar' })
  注册码3?: string | null;

  @Column({ name: '开始时间', nullable: true, type: 'datetime' })
  开始时间?: Date | null;

  @Column({ name: '结束时间', nullable: true, type: 'datetime' })
  结束时间?: Date | null;

  @Column({ name: '注册类别', length: 7, nullable: true, type: 'varchar' })
  注册类别?: string | null;

  @Column({ name: 'BiaoQianM', length: 30, nullable: true, type: 'varchar' })
  biaoQianM?: string | null;
}
