import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('lic_User')
export class LicUser {

  @PrimaryColumn({ name: 'Id' })
  id: number;

  @Column({ name: 'Name', length: 32, type: 'nvarchar' })
  name: string;

  @Column({ name: 'Password', length: 32 })
  password: string;
}
