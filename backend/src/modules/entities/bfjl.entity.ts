import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('Bfjl')
export class Bfjl {

  @PrimaryColumn({ name: 'Bfbm' })
  bfbm: string;

  @Column({ name: 'Khbm', length: 20, nullable: true, type: 'varchar' })
  khbm?: string | null;

  @Column({ name: 'Bfjl', length: 800, nullable: true, type: 'varchar' })
  bfjl?: string | null;

  @Column({ name: 'Bfsj', nullable: true, type: 'datetime' })
  bfsj?: Date | null;

  @Column({ name: 'Xcbfsj', nullable: true, type: 'datetime' })
  xcbfsj?: Date | null;

  @Column({ name: 'Xcbfmb', length: 800, nullable: true, type: 'varchar' })
  xcbfmb?: string | null;

  @Column({ name: 'Bfjg', length: 100, nullable: true, type: 'varchar' })
  bfjg?: string | null;

  @Column({ name: 'Xsry', length: 20, nullable: true, type: 'varchar' })
  xsry?: string | null;

  @Column({ name: 'Jlsj', nullable: true, type: 'datetime' })
  jlsj?: Date | null;

  @Column({ name: 'Jlr', length: 20, nullable: true, type: 'varchar' })
  jlr?: string | null;

  @Column({ name: 'wcbz', length: 4, nullable: true, type: 'varchar' })
  wcbz?: string | null;

  @Column({ name: 'AAAA', nullable: true })
  aaaa?: number | null;
}
