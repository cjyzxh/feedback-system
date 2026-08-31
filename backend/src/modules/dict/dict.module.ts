import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DictController } from './dict.controller';
import { DictService } from './dict.service';
import { Hospital } from '../hospital/hospital.entity';
import { Module as ModuleEntity } from './module.entity';
import { Form } from './form.entity';
import { Staff } from '../staff/staff.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Hospital, ModuleEntity, Form, Staff])],
  controllers: [DictController],
  providers: [DictService],
  exports: [DictService],
})
export class DictModule {}
