import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Like, FindOptionsWhere } from 'typeorm';
import * as bcrypt from 'bcrypt';
import { User } from './user.entity';
import { CreateUserDto, UpdateUserDto, QueryUserDto } from './dto/user.dto';

@Injectable()
export class UserService {
  constructor(
    @InjectRepository(User)
    private userRepository: Repository<User>,
  ) {}

  // 创建用户
  async create(createUserDto: CreateUserDto): Promise<User> {
    const { password, ...rest } = createUserDto;
    
    // 加密密码
    const hashedPassword = await bcrypt.hash(password, 10);
    
    const user = this.userRepository.create({
      ...rest,
      password: hashedPassword,
    });
    
    return this.userRepository.save(user);
  }

  // 分页查询用户列表
  async findAll(query: QueryUserDto): Promise<{ list: User[]; total: number }> {
    const { page = 1, pageSize = 10, keyword, status } = query;
    
    const where: FindOptionsWhere<User> = {};
    
    if (keyword) {
      where.username = Like(`%${keyword}%`);
    }
    
    if (status !== undefined) {
      where.status = status;
    }
    
    const [list, total] = await this.userRepository.findAndCount({
      where,
      order: { id: 'DESC' },
      skip: (page - 1) * pageSize,
      take: pageSize,
      // 密码不返回给前端
      select: ['id', 'username', 'realName', 'email', 'phone', 'role', 'status', 'createTime', 'updateTime'],
    });
    
    return { list, total };
  }

  // 根据 ID 查询用户
  async findById(id: number): Promise<User> {
    const user = await this.userRepository.findOne({
      where: { id },
      select: ['id', 'username', 'realName', 'email', 'phone', 'role', 'status', 'createTime', 'updateTime'],
    });
    
    if (!user) {
      throw new NotFoundException(`用户 ID ${id} 不存在`);
    }
    
    return user;
  }

  // 更新用户
  async update(id: number, updateUserDto: UpdateUserDto): Promise<User> {
    const user = await this.findById(id);
    
    Object.assign(user, updateUserDto);
    
    return this.userRepository.save(user);
  }

  // 删除用户
  async remove(id: number): Promise<void> {
    const user = await this.findById(id);
    await this.userRepository.remove(user);
  }

  // 批量删除
  async batchRemove(ids: number[]): Promise<void> {
    await this.userRepository.delete(ids);
  }

  // 根据用户名查询用户（用于登录）
  async findByUsername(username: string): Promise<User | null> {
    return this.userRepository.findOne({
      where: { username },
    });
  }

  // 验证密码
  async validatePassword(user: User, password: string): Promise<boolean> {
    return bcrypt.compare(password, user.password);
  }
}
