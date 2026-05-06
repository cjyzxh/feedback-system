import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('lic_FeatureList')
export class LicFeatureList {

  @PrimaryColumn({ name: 'FeatureID' })
  featureID: string;

  @Column({ name: 'FeatureExpID', length: 10, nullable: true, type: 'nvarchar' })
  featureExpID?: string | null;

  @Column({ name: 'FeatureName', length: 30, type: 'nvarchar' })
  featureName: string;

  @Column({ name: 'Spelling', length: 20, nullable: true, type: 'nvarchar' })
  spelling?: string | null;

  @Column({ name: 'UrlAddress', length: 200, nullable: true, type: 'nvarchar' })
  urlAddress?: string | null;

  @Column({ name: 'ImageAddress', length: 50, nullable: true, type: 'nvarchar' })
  imageAddress?: string | null;

  @Column({ name: 'FeatureType', length: 2, nullable: true, type: 'nvarchar' })
  featureType?: string | null;

  @Column({ name: 'ParentMenuID', length: 50, nullable: true, type: 'nvarchar' })
  parentMenuID?: string | null;

  @Column({ name: 'Enabled', length: 2, nullable: true, type: 'nvarchar' })
  enabled?: string | null;

  @Column({ name: 'GroupName', length: 20, nullable: true, type: 'nvarchar' })
  groupName?: string | null;

  @Column({ name: 'CustomizeGroup', length: 5, nullable: true, type: 'nvarchar' })
  customizeGroup?: string | null;

  @Column({ name: 'SortRegular', length: 5, nullable: true, type: 'nvarchar' })
  sortRegular?: string | null;

  @Column({ name: 'DisplayWay', length: 50, nullable: true, type: 'nvarchar' })
  displayWay?: string | null;

  @Column({ name: 'Description', length: 100, nullable: true, type: 'nvarchar' })
  description?: string | null;

  @Column({ name: 'ReMark', length: 50, nullable: true, type: 'nvarchar' })
  reMark?: string | null;

  @Column({ name: 'HospitalID', length: 10, nullable: true, type: 'nvarchar' })
  hospitalID?: string | null;

  @Column({ name: 'HospitalLevel', length: 10, nullable: true, type: 'nvarchar' })
  hospitalLevel?: string | null;

  @Column({ name: 'RecorderID', length: 6, nullable: true, type: 'nvarchar' })
  recorderID?: string | null;

  @Column({ name: 'Recorder', length: 20, nullable: true, type: 'nvarchar' })
  recorder?: string | null;

  @Column({ name: 'RecordDate', nullable: true, type: 'datetime' })
  recordDate?: Date | null;
}
