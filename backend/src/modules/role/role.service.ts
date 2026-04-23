import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Role } from './role.entity';

@Injectable()
export class RoleService {
  constructor(
    @InjectRepository(Role)
    private roleRepository: Repository<Role>,
  ) {}

  async findAll(query: any) {
    const page = parseInt(query.page) || 1;
    const pageSize = parseInt(query.pageSize) || 10;
    const qb = this.roleRepository.createQueryBuilder('role');
    
    if (query.keyword) {
      qb.where('role.name LIKE :keyword', { keyword: `%${query.keyword}%` });
    }
    
    const total = await qb.getCount();
    const list = await qb
      .skip((page - 1) * pageSize)
      .take(pageSize)
      .getMany();

    return { list, total };
  }

  async findAllList() {
    return this.roleRepository.find({ where: { status: 1 } });
  }

  async findOne(id: number) {
    return this.roleRepository.findOne({ where: { id } });
  }

  async create(data: Partial<Role>) {
    const role = this.roleRepository.create(data);
    return this.roleRepository.save(role);
  }

  async update(id: number, data: Partial<Role>) {
    await this.roleRepository.update(id, data);
    return this.findOne(id);
  }

  async remove(id: number) {
    return this.roleRepository.delete(id);
  }
}