import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Role } from './role.entity';
import { CreateRoleDto, UpdateRoleDto } from './dto/role.dto';

@Injectable()
export class RoleService {
  constructor(
    @InjectRepository(Role)
    private roleRepository: Repository<Role>,
  ) {}

  async create(dto: CreateRoleDto): Promise<Role> {
    let perms = dto.permissions || [];
    if (typeof perms === 'string') {
      perms = JSON.parse(perms || '[]');
    }
    const role = this.roleRepository.create({
      ...dto,
      permissions: JSON.stringify(perms),
      viewOthers: dto.viewOthers || 0,
      isAdmin: dto.isAdmin || 0,
    });
    return this.roleRepository.save(role);
  }

  async findAll(query: any = {}): Promise<{ list: Role[]; total: number }> {
    const qb = this.roleRepository.createQueryBuilder('role');
    
    if (query.name) {
      qb.andWhere('role.name LIKE :name', { name: `%${query.name}%` });
    }
    if (query.status !== undefined) {
      qb.andWhere('role.status = :status', { status: query.status });
    }

    qb.orderBy('role.id', 'ASC');
    
    const total = await qb.getCount();
    const list = await qb
      .skip(((query.page || 1) - 1) * (query.pageSize || 10))
      .take(query.pageSize || 10)
      .getMany();

    return {
      total,
      list: list.map(r => ({
        ...r,
        isAdmin: r.isAdmin || 0,
        permissions: JSON.parse(r.permissions || '[]'),
      })),
    };
  }

  async findOne(id: number): Promise<Role> {
    const role = await this.roleRepository.findOne({ where: { id } });
    if (!role) {
      throw new NotFoundException(`Role ID ${id} not found`);
    }
    return {
      ...role,
      permissions: JSON.parse(role.permissions || '[]'),
    };
  }

  async update(id: number, dto: UpdateRoleDto): Promise<Role> {
    const role = await this.findOne(id);
    if (dto.permissions !== undefined) {
      if (typeof dto.permissions === 'string') {
        role.permissions = dto.permissions;
      } else {
        role.permissions = JSON.stringify(dto.permissions);
      }
    }
    if (dto.name) role.name = dto.name;
    if (dto.description !== undefined) role.description = dto.description;
    if (dto.viewOthers !== undefined) role.viewOthers = dto.viewOthers;
    if (dto.status !== undefined) role.status = dto.status;
    if (dto.isAdmin !== undefined) role.isAdmin = dto.isAdmin;
    return this.roleRepository.save(role);
  }

  async remove(id: number): Promise<void> {
    const role = await this.findOne(id);
    await this.roleRepository.remove(role);
  }

  async findAllSimple(): Promise<Role[]> {
    const roles = await this.roleRepository.find({ where: { status: 1 } });
    return roles.map(r => ({
      ...r,
      permissions: JSON.parse(r.permissions || '[]'),
    }));
  }
}
