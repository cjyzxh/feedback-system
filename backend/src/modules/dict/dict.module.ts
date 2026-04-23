import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DictController } from './dict.controller';
import { DictService } from './dict.service';
import { Hospital } from './hospital.entity';
import { Module as AppModule } from './module.entity';
import { Form } from './form.entity';
import { Engineer } from './engineer.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Hospital, AppModule, Form, Engineer])],
  controllers: [DictController],
  providers: [DictService],
  exports: [DictService],
})
export class DictModule {}
