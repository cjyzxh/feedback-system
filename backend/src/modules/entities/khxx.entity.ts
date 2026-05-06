import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('Khxx')
export class Khxx {

  @PrimaryColumn({ name: 'Khbm' })
  khbm: string;

  @Column({ name: 'Khmc', length: 100, nullable: true, type: 'varchar' })
  khmc?: string | null;

  @Column({ name: 'pym', length: 100, nullable: true, type: 'varchar' })
  pym?: string | null;

  @Column({ name: 'Fzr', length: 50, nullable: true, type: 'varchar' })
  fzr?: string | null;

  @Column({ name: 'Gddh', length: 100, nullable: true, type: 'varchar' })
  gddh?: string | null;

  @Column({ name: 'Sj', length: 50, nullable: true, type: 'varchar' })
  sj?: string | null;

  @Column({ name: 'Cz', length: 50, nullable: true, type: 'varchar' })
  cz?: string | null;

  @Column({ name: 'Qtsj', nullable: true, type: 'datetime' })
  qtsj?: Date | null;

  @Column({ name: 'Rjmc', length: 30, nullable: true, type: 'varchar' })
  rjmc?: string | null;

  @Column({ name: 'Yyqk', length: 1000, nullable: true, type: 'varchar' })
  yyqk?: string | null;

  @Column({ name: 'Sxmk', length: 800, nullable: true, type: 'varchar' })
  sxmk?: string | null;

  @Column({ name: 'Bj', length: 20, nullable: true, type: 'varchar' })
  bj?: string | null;

  @Column({ name: 'Khdz', length: 200, nullable: true, type: 'varchar' })
  khdz?: string | null;

  @Column({ name: 'Sfhs', length: 40, nullable: true, type: 'varchar' })
  sfhs?: string | null;

  @Column({ name: 'Swje', length: 20, nullable: true, type: 'varchar' })
  swje?: string | null;

  @Column({ name: 'Xsry', length: 20, nullable: true, type: 'varchar' })
  xsry?: string | null;

  @Column({ name: 'Khxz', length: 20, nullable: true, type: 'varchar' })
  khxz?: string | null;

  @Column({ name: 'Khyx', length: 20, nullable: true, type: 'varchar' })
  khyx?: string | null;

  @Column({ name: 'Qtjd', length: 20, nullable: true, type: 'varchar' })
  qtjd?: string | null;

  @Column({ name: 'Qy', length: 20, nullable: true, type: 'varchar' })
  qy?: string | null;

  @Column({ name: 'Zjbz', length: 4, nullable: true, type: 'varchar' })
  zjbz?: string | null;

  @Column({ name: 'Zjjsr', length: 20, nullable: true, type: 'varchar' })
  zjjsr?: string | null;

  @Column({ name: 'Qdsj', nullable: true, type: 'datetime' })
  qdsj?: Date | null;

  @Column({ name: 'Qdr', length: 20, nullable: true, type: 'varchar' })
  qdr?: string | null;

  @Column({ name: 'Jlsj', nullable: true, type: 'datetime' })
  jlsj?: Date | null;

  @Column({ name: 'Jlr', length: 20, nullable: true, type: 'varchar' })
  jlr?: string | null;
}
