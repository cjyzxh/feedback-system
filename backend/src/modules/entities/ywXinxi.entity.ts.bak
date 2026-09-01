import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('yw_xinxi')
export class YwXinxi {

  @PrimaryColumn({ name: 'id' })
  id: number;

  @Column({ name: 'fasongren', length: 50, type: 'varchar' })
  fasongren: string;

  @Column({ name: 'jieshouren', length: 50, type: 'varchar' })
  jieshouren: string;

  @Column({ name: 'nr', length: 500, type: 'varchar' })
  nr: string;

  @Column({ name: 'ydbz', length: 4, type: 'varchar' })
  ydbz: string;

  @Column({ name: 'sj', type: 'datetime' })
  sj: Date;

  @Column({ name: 'shbz', length: 4, type: 'varchar' })
  shbz: string;
}
