import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Staff } from './staff.entity';
import { CreateStaffDto, UpdateStaffDto, QueryStaffDto } from './dto/staff.dto';

@Injectable()
export class StaffService {
  constructor(
    @InjectRepository(Staff)
    private staffRepository: Repository<Staff>,
  ) {}

  async create(dto: CreateStaffDto): Promise<Staff> {
    const staff = this.staffRepository.create({...dto, birthDate: dto.birthDate || null });
    return this.staffRepository.save(staff);
  }

  async findAll(query: QueryStaffDto): Promise<{ list: Staff[]; total: number }> {
    const qb = this.staffRepository.createQueryBuilder('staff');
    
    if (query.category) {
      qb.andWhere('staff.category = :category', { category: query.category });
    }
    
    qb.orderBy('staff.id', 'DESC');
    
    const total = await qb.getCount();
    const list = await qb
      .skip(((query.page || 1) - 1) * (query.pageSize || 100))
      .take(query.pageSize || 100)
      .getMany();
    
    return { list, total };
  }

  async findOne(id: number): Promise<Staff> {
    const staff = await this.staffRepository.findOne({ where: { id } });
    if (!staff) {
      throw new NotFoundException(`Staff ID ${id} not found`);
    }
    return staff;
  }

  async update(id: number, dto: UpdateStaffDto): Promise<Staff> {
    const staff = await this.findOne(id);
    Object.assign(staff, dto);
    return this.staffRepository.save(staff);
  }

  async remove(id: number): Promise<void> {
    const staff = await this.findOne(id);
    await this.staffRepository.remove(staff);
  }
}