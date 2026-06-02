import { Controller, Get, Post, Put, Delete, Body, Param, Query } from '@nestjs/common';
import { StaffService } from './staff.service';

@Controller('staff')
export class StaffController {
  constructor(private readonly staffService: StaffService) {}

  @Get()
  async findAll() {
    const data = await this.staffService.findAll();
    return { code: 200, message: '查询成功', data };
  }
}