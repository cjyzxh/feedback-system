import { Injectable, Logger, BadRequestException, ForbiddenException, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { MoBan } from './template.entity';
import { User } from '../user/user.entity';
import { Role } from '../role/role.entity';

@Injectable()
export class TemplateService {
  private readonly logger = new Logger(TemplateService.name);

  constructor(
    @InjectRepository(MoBan) private moBanRepository: Repository<MoBan>,
    @InjectRepository(User) private userRepository: Repository<User>,
    @InjectRepository(Role) private roleRepository: Repository<Role>,
  ) {}

  // 判断当前用户编码是否是管理员（内置超管 admin / 角色 isAdmin=1）
  async isAdminUser(code: string): Promise<boolean> {
    if (!code) return false;
    if (code === 'admin') return true; // 内置超管
    try {
      const u = await this.userRepository.findOne({ where: { username: code } });
      if (!u) return false;
      const role = await this.roleRepository.findOne({ where: { name: u.role } });
      return role ? role.isAdmin === 1 : false;
    } catch (e) {
      this.logger.warn('查询管理员状态失败:' + e.message);
      return false;
    }
  }

  // 维护页列表：按类型 + 范围过滤
  // fw=个人 → 只显示 CreateUser=currentUser 的；fw=公用 → 只显示 MoBanFW='公用' 的
  async getList(lx: string, fw: string, currentUser: string) {
    const where: any = {};
    if (lx) where.moBanLX = lx;
    if (fw === '个人') {
      where.moBanFW = '个人';
      where.createUser = currentUser;
    } else if (fw === '公用') {
      where.moBanFW = '公用';
    }
    return this.moBanRepository.find({
      where,
      order: { id: 'DESC' },
    });
  }

  // 弹窗加载：所有公用模板 + 自己创建的个人模板
  async getOptions(lx: string, currentUser: string) {
    if (!lx) return [];
    return this.moBanRepository
      .createQueryBuilder('m')
      .where('m.moBanLX = :lx', { lx })
      .andWhere('(m.moBanFW = :fw OR (m.moBanFW = :fw2 AND m.createUser = :user))', {
        fw: '公用',
        fw2: '个人',
        user: currentUser,
      })
      .orderBy('m.id', 'DESC')
      .getMany();
  }

  // 保存模板
  async create(data: { lx: string; fw: string; nr: string; currentUser: string; currentUserName?: string }) {
    if (!data.lx || !data.nr || !data.currentUser) {
      throw new BadRequestException('模板类型、内容、用户不能为空');
    }
    // 姓名：前端传入优先，否则按编码查 sys_user
    let userName = data.currentUserName || '';
    if (!userName) {
      try {
        const u = await this.userRepository.findOne({ where: { username: data.currentUser } });
        if (u) userName = u.realName;
      } catch (e) {
        this.logger.warn('查询用户姓名失败:' + e.message);
      }
      if (!userName) userName = data.currentUser;
    }
    const mb = this.moBanRepository.create({
      moBanLX: data.lx,
      moBanFW: data.fw === '公用' ? '公用' : '个人',
      moBanNR: data.nr.trim(),
      createUser: data.currentUser,
      createUserName: userName,
      createTime: new Date(),
    });
    return this.moBanRepository.save(mb);
  }

  // 更新模板（仅创建人或管理员）
  async update(id: number, data: { nr: string; currentUser: string }) {
    const mb = await this.moBanRepository.findOne({ where: { id } });
    if (!mb) throw new NotFoundException('模板不存在');
    if (!data.nr) throw new BadRequestException('模板内容不能为空');
    const isAdmin = await this.isAdminUser(data.currentUser);
    if (mb.createUser !== data.currentUser && !isAdmin) {
      throw new ForbiddenException('只能编辑自己创建的模板');
    }
    mb.moBanNR = data.nr.trim();
    return this.moBanRepository.save(mb);
  }

  // 删除模板（创建人或管理员可删）
  async remove(id: number, currentUser: string) {
    const mb = await this.moBanRepository.findOne({ where: { id } });
    if (!mb) throw new NotFoundException('模板不存在');
    const isAdmin = await this.isAdminUser(currentUser);
    if (mb.createUser !== currentUser && !isAdmin) {
      throw new ForbiddenException('只能删除自己创建的模板');
    }
    await this.moBanRepository.remove(mb);
    return { success: true };
  }
}
