import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { FeedbackController } from './feedback.controller';
import { FeedbackService } from './feedback.service';
import { YwWentilb } from '../entities/ywWentilb.entity';
import { Ok } from '../entities/ok.entity';

@Module({
  imports: [TypeOrmModule.forFeature([YwWentilb, Ok])],
  controllers: [FeedbackController],
  providers: [FeedbackService],
  exports: [FeedbackService],
})
export class FeedbackModule {}
