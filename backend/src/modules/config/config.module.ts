import { Module } from '@nestjs/common';
import { DatabaseConfigService } from './config.service';
import { ConfigController } from './config.controller';

@Module({
  providers: [DatabaseConfigService],
  controllers: [ConfigController],
  exports: [DatabaseConfigService],
})
export class ConfigModule {}
