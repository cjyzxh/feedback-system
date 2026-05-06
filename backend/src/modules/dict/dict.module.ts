import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DictController } from './dict.controller';
import { DictService } from './dict.service';
import { XtConfigServer } from '../entities/xtConfigServer.entity';
import { ZdMokuai } from '../entities/zdMokuai.entity';
import { ZdChuangti } from '../entities/zdChuangti.entity';
import { ZdJishuyuan } from '../entities/zdJishuyuan.entity';

@Module({
  imports: [TypeOrmModule.forFeature([XtConfigServer, ZdMokuai, ZdChuangti, ZdJishuyuan])],
  controllers: [DictController],
  providers: [DictService],
  exports: [DictService],
})
export class DictModule {}
