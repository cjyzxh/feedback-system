import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('lic_RegisteDetailInfo')
export class LicRegisteDetailInfo {

  @PrimaryColumn({ name: 'Id' })
  id: number;

  @Column({ name: 'HospitalUserID', length: 512, nullable: true, type: 'varchar' })
  hospitalUserID?: string | null;

  @Column({ name: 'FeatureID', length: 50, nullable: true, type: 'nvarchar' })
  featureID?: string | null;

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
