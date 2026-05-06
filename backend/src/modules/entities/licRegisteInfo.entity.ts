import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('lic_RegisteInfo')
export class LicRegisteInfo {

  @PrimaryColumn({ name: 'Id' })
  id: number;

  @Column({ name: 'HospitalUserID', length: 512, nullable: true, type: 'varchar' })
  hospitalUserID?: string | null;

  @Column({ name: 'HospitalName', length: 50, nullable: true, type: 'nvarchar' })
  hospitalName?: string | null;

  @Column({ name: 'SerialNumber', length: 512, nullable: true, type: 'varchar' })
  serialNumber?: string | null;

  @Column({ name: 'PublicKey', length: 512, nullable: true, type: 'varchar' })
  publicKey?: string | null;

  @Column({ name: 'PrivateKey', length: 2048, nullable: true, type: 'varchar' })
  privateKey?: string | null;

  @Column({ name: 'HardType', length: 50, nullable: true, type: 'nvarchar' })
  hardType?: string | null;

  @Column({ name: 'RegisteType', length: 50, nullable: true, type: 'nvarchar' })
  registeType?: string | null;

  @Column({ name: 'HospitalCount', length: 50, nullable: true, type: 'nvarchar' })
  hospitalCount?: string | null;

  @Column({ name: 'ClientCount', length: 50, nullable: true, type: 'nvarchar' })
  clientCount?: string | null;

  @Column({ name: 'RegisteDate', nullable: true, type: 'datetime' })
  registeDate?: Date | null;

  @Column({ name: 'DueDate', nullable: true, type: 'datetime' })
  dueDate?: Date | null;

  @Column({ name: 'Remarks', length: 256, nullable: true, type: 'nvarchar' })
  remarks?: string | null;

  @Column({ name: 'Disabled', length: 50, nullable: true, type: 'nvarchar' })
  disabled?: string | null;

  @Column({ name: 'CreateUserId', nullable: true })
  createUserId?: number | null;

  @Column({ name: 'CreateTime', nullable: true, type: 'datetime' })
  createTime?: Date | null;

  @Column({ name: 'LastWriteUserId', nullable: true })
  lastWriteUserId?: number | null;

  @Column({ name: 'LastWriteTime', nullable: true, type: 'datetime' })
  lastWriteTime?: Date | null;
}
