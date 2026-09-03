import { Module } from '@nestjs/common';
import { HttpModule } from '@nestjs/axios';
import { SmsService } from './sms.service';
import { ConfigModule } from '../config/config.module';

@Module({
  imports: [HttpModule, ConfigModule],
  providers: [SmsService],
  exports: [SmsService],
})
export class SmsModule {}
