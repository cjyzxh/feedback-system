import { Controller, Get, Post, Put, Delete, Body, Param, Query, ParseIntPipe } from '@nestjs/common';
import { HospitalService } from './hospital.service';
import { Hospital } from './hospital.entity';

@Controller('hospital')
export class HospitalController {
  constructor(private readonly hospitalService: HospitalService) {}

  // 获取省份列表
  @Get('provinces')
  getProvinces() {
    return { code: 200, data: this.hospitalService.getProvinces(), message: 'Success' };
  }

  // 获取城市列表
  @Get('cities')
  getCities(@Query('province') province: string) {
    return { code: 200, data: this.hospitalService.getCities(province), message: 'Success' };
  }

  // 分页查询
  @Get()
  findAll(@Query('page') page: number, @Query('pageSize') pageSize: number, @Query('keyword') keyword: string) {
    return this.hospitalService.findAll(page || 1, pageSize || 10, keyword);
  }

  // 根据ID查询
  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.hospitalService.findOne(id);
  }

  // 创建
  @Post()
  create(@Body() createHospitalDto: Partial<Hospital>) {
    return this.hospitalService.create(createHospitalDto);
  }

  // 更新
  @Put(':id')
  update(@Param('id', ParseIntPipe) id: number, @Body() updateHospitalDto: Partial<Hospital>) {
    return this.hospitalService.update(id, updateHospitalDto);
  }

  // 删除
  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.hospitalService.remove(id);
  }
}