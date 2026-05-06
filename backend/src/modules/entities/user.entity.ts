import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('user')
export class User {

  @PrimaryColumn({ name: 'ID' })
  id: number;

  @Column({ name: 'daima' })
  daima: number;

  @Column({ name: 'usename', length: 16, type: 'varchar' })
  usename: string;

  @Column({ name: 'pym', length: 8, nullable: true, type: 'varchar' })
  pym?: string | null;

  @Column({ name: 'xingbie', length: 2, type: 'varchar' })
  xingbie: string;

  @Column({ name: 'nianling' })
  nianling: number;

  @Column({ name: 'quxian', length: 8, type: 'varchar' })
  quxian: string;

  @Column({ name: 'quxian2', length: 20, nullable: true })
  quxian2?: Buffer | null;

  @Column({ name: 'pwd', length: 8, type: 'varchar' })
  pwd: string;

  @Column({ name: 'zhuangtai', length: 50, nullable: true, type: 'varchar' })
  zhuangtai?: string | null;
}
