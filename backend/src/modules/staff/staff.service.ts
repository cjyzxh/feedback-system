import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Staff } from './staff.entity';

@Injectable()
export class StaffService {
  constructor(
    @InjectRepository(Staff)
    private staffRepository: Repository<Staff>,
  ) {}

  async findAll(): Promise<{ list: any[]; total: number }> {
    const [list, total] = await this.staffRepository.findAndCount({
      order: { id: 'ASC' }
    });
    
    // 转换数据格式，让前端更容易使用 - 直接返回 xingming 作为 name
    const transformedList = list.map(staff => ({
      id: staff.id,
      name: staff.xingming,
      xingming: staff.xingming,
      gonghao: staff.gonghao,
      zhiwu: staff.zhiwu,
      zhuangtai: staff.zhuangtai
    }));
    
    return { list: transformedList, total };
  }

  async findOne(id: number): Promise<Staff> {
    const staff = await this.staffRepository.findOne({ where: { id } });
    if (!staff) {
      throw new NotFoundException(`Staff ID ${id} not found`);
    }
    return staff;
  }
}