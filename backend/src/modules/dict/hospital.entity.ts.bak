import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('xt_ConfigServer')
export class Hospital {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: 'YHMC', length: 200, nullable: true })
  name: string;

  @Column({ name: 'QY', length: 100, nullable: true })
  qy: string;

  @Column({ name: 'SYQ', length: 100, nullable: true })
  syq: string;

  @Column({ name: 'BeiZhu', length: 500, nullable: true })
  remark: string;

  @Column({ name: 'ZuoFeiBZ', length: 10, nullable: true })
  disabled: string;
}
