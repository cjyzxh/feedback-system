import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Like } from 'typeorm';
import { Staff } from './staff.entity';

@Injectable()
export class StaffService {
  constructor(
    @InjectRepository(Staff)
    private staffRepository: Repository<Staff>,
  ) {}

  async findAll(category?: string): Promise<{ list: any[]; total: number }> {
    const where: any = {};
    
    // 按类别过滤：category 可能是 "0"、"1"、"0,1"
    if (category) {
      const cats = category.split(',').filter(c => c);
      if (cats.length > 0) {
        // 使用 Like 模糊匹配，因为 category 字段存的是 "0"、"1"、"0,1"
        where.category = Like(`%${cats[0]}%`);
      }
    }

    const [list, total] = await this.staffRepository.findAndCount({
      where,
      order: { id: 'ASC' }
    });
    
    return { list, total };
  }

  async findOne(id: number): Promise<Staff> {
    const staff = await this.staffRepository.findOne({ where: { id } });
    if (!staff) {
      throw new NotFoundException(`Staff ID ${id} not found`);
    }
    return staff;
  }

  // 清理数据：空字符串转 null，删除 id（自增字段）
  private cleanData(data: Partial<Staff>): Partial<Staff> {
    const cleaned: any = { ...data };
    // 删除 id，自增字段不允许手动指定
    delete cleaned.id;
    // 空字符串转为 null，避免数据库类型转换错误
    Object.keys(cleaned).forEach(key => {
      if (cleaned[key] === '') {
        cleaned[key] = null;
      }
    });
    return cleaned;
  }

  async create(data: Partial<Staff>): Promise<Staff> {
    const cleaned = this.cleanData(data);
    const staff = this.staffRepository.create(cleaned);
    return await this.staffRepository.save(staff);
  }

  async update(id: number, data: Partial<Staff>): Promise<Staff> {
    const staff = await this.findOne(id);
    const cleaned = this.cleanData(data);
    Object.assign(staff, cleaned);
    return await this.staffRepository.save(staff);
  }

  async delete(id: number): Promise<void> {
    const result = await this.staffRepository.delete(id);
    if (result.affected === 0) {
      throw new NotFoundException(`Staff ID ${id} not found`);
    }
  }
}
