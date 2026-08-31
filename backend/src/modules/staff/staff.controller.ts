import { Controller, Get, Post, Put, Delete, Body, Param, Query } from '@nestjs/common';
import { StaffService } from './staff.service';
import { Staff } from './staff.entity';

@Controller('staff')
export class StaffController {
  constructor(private readonly staffService: StaffService) {}

  @Get()
  async findAll(@Query('category') category?: string) {
    const data = await this.staffService.findAll(category);
    return { code: 200, message: '查询成功', data };
  }

  @Get(':id')
  async findOne(@Param('id') id: string) {
    const data = await this.staffService.findOne(Number(id));
    return { code: 200, message: '查询成功', data };
  }

  @Post()
  async create(@Body() body: Partial<Staff>) {
    const data = await this.staffService.create(body);
    return { code: 200, message: '创建成功', data };
  }

  @Put(':id')
  async update(@Param('id') id: string, @Body() body: Partial<Staff>) {
    const data = await this.staffService.update(Number(id), body);
    return { code: 200, message: '更新成功', data };
  }

  @Delete(':id')
  async delete(@Param('id') id: string) {
    await this.staffService.delete(Number(id));
    return { code: 200, message: '删除成功' };
  }
}
