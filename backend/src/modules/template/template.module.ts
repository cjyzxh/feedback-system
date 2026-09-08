import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MoBan } from './template.entity';
import { User } from '../user/user.entity';
import { Role } from '../role/role.entity';
import { TemplateService } from './template.service';
import { TemplateController } from './template.controller';

@Module({
  imports: [TypeOrmModule.forFeature([MoBan, User, Role])],
  controllers: [TemplateController],
  providers: [TemplateService],
})
export class TemplateModule {}
