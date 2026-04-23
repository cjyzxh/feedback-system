import { Controller, Get, Post, Put, Delete, Body, Param, Query } from '@nestjs/common';
import { RoleService } from './role.service';

@Controller('roles')
export class RoleController {
  constructor(private readonly roleService: RoleService) {}

  @Get()
  async findAll(@Query() query: any) {
    const result = await this.roleService.findAll(query);
    return {
      code: 200,
      message: 'success',
      data: {
        list: result.list,
        total: result.total,
        page: parseInt(query.page) || 1,
        pageSize: parseInt(query.pageSize) || 10
      }
    };
  }

  @Get('list')
  async findAllList() {
    const list = await this.roleService.findAllList();
    return {
      code: 200,
      message: 'success',
      data: list
    };
  }

  @Get(':id')
  async findOne(@Param('id') id: string) {
    const data = await this.roleService.findOne(parseInt(id));
    return {
      code: 200,
      message: 'success',
      data
    };
  }

  @Post()
  async create(@Body() body: any) {
    const data = await this.roleService.create(body);
    return {
      code: 200,
      message: 'success',
      data
    };
  }

  @Put(':id')
  async update(@Param('id') id: string, @Body() body: any) {
    const data = await this.roleService.update(parseInt(id), body);
    return {
      code: 200,
      message: 'success',
      data
    };
  }

  @Delete(':id')
  async remove(@Param('id') id: string) {
    await this.roleService.remove(parseInt(id));
    return {
      code: 200,
      message: 'success'
    };
  }
}