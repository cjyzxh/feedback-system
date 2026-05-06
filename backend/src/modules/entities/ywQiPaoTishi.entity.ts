import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('yw_QiPaoTishi')
export class YwQiPaoTishi {

  @PrimaryColumn({ name: 'Wtlsh' })
  wtlsh: string;

  @Column({ name: 'WentiJSRMC', length: 20, type: 'varchar' })
  wentiJSRMC: string;

  @Column({ name: 'YiYuanMC', length: 100, nullable: true, type: 'varchar' })
  yiYuanMC?: string | null;

  @Column({ name: 'YeWuLB', length: 20, type: 'varchar' })
  yeWuLB: string;

  @Column({ name: 'YeWuGJRMC', length: 20, type: 'varchar' })
  yeWuGJRMC: string;

  @Column({ name: 'RQ', nullable: true, type: 'datetime' })
  rq?: Date | null;

  @Column({ name: 'BeiZhu', length: 20, nullable: true, type: 'varchar' })
  beiZhu?: string | null;

  @Column({ name: 'cjyTS' })
  cjyTS: Date;
}
