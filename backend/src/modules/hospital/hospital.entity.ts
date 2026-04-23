import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, UpdateDateColumn } from 'typeorm';

@Entity('xt_ConfigServer')
export class Hospital {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: 'YHMC', length: 200, nullable: true })
  name: string;

  @Column({ name: 'PYM', length: 100, nullable: true })
  pym: string;

  @Column({ name: 'province', length: 100, nullable: true })
  province: string;

  @Column({ name: 'city', length: 100, nullable: true })
  city: string;

  @Column({ name: 'leader', length: 100, nullable: true })
  leader: string;

  @Column({ name: 'contact', length: 100, nullable: true })
  contact: string;

  @Column({ name: 'level', length: 20, nullable: true })
  level: string;

  @Column({ name: 'nature', length: 20, nullable: true })
  nature: string;

  @Column({ name: 'MK', length: 100, nullable: true })
  mk: string;

  @Column({ name: 'BeiZhu', length: 500, nullable: true })
  remark: string;

  @Column({ name: 'ZuoFeiBZ', length: 10, nullable: true })
  disabled: string;

  @CreateDateColumn({ name: 'SYQ' })
  validDate: Date;
}