import { Injectable, Logger } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Like } from 'typeorm';
import { Hospital } from '../hospital/hospital.entity';
import { Module as ModuleEntity } from './module.entity';
import { Form } from './form.entity';
import { User } from '../user/user.entity';
import pinyin from 'pinyin';

@Injectable()
export class DictService {
  private readonly logger = new Logger(DictService.name);

  constructor(
    @InjectRepository(ModuleEntity) private moduleRepository: Repository<ModuleEntity>,
    @InjectRepository(Form) private formRepository: Repository<Form>,
    @InjectRepository(User) private userRepository: Repository<User>,
    @InjectRepository(Hospital) private configRepository: Repository<Hospital>,
  ) {}

  async getModules(banben?: string) {
    try {
      const where: any = { mokuaimc: Like('%') };
      if (banben) {
        where.banben = banben;
      }
      const modules = await this.moduleRepository.find({
        where,
        order: { mokuaimc: 'ASC' },
      });
      
      return modules.map((m) => ({ 
        id: m.id, 
        banben: m.banben, 
        mokuaimc: m.mokuaimc,
        value: m.mokuaimc,
        label: m.mokuaimc
      }));
    } catch (e) {
      console.error('getModules error:', e);
      return [];
    }
  }

  async createModule(moduleData: { banben: string; mokuaimc: string }) {
    const maxIdResult = await this.moduleRepository.query(
      'SELECT COALESCE(MAX(ID), 0) + 1 as nextId FROM zd_mokuai'
    );
    const nextId = maxIdResult[0]?.nextId || 1;
    
    const module = this.moduleRepository.create({
      id: nextId,
      banben: moduleData.banben,
      mokuaimc: moduleData.mokuaimc,
      mokuaidm: 0,
    });
    
    await this.moduleRepository.save(module);
    return { success: true };
  }

  async updateModule(id: number, moduleData: { banben: string; mokuaimc: string }) {
    // 显式构建更新字段，避免前端误传 id 等额外字段导致 TypeORM 报错
    await this.moduleRepository.update(id, {
      banben: moduleData.banben,
      mokuaimc: moduleData.mokuaimc
    });
    return { success: true };
  }

  async deleteModule(id: number) {
    await this.moduleRepository.delete(id);
    return { success: true };
  }

  async getForms(moduleName?: string, banben?: string) {
    this.logger.log('getForms called, moduleName: [' + moduleName + '], banben: [' + banben + ']');
    
    try {
      const where: any = {};
      if (moduleName) {
        where.mokuai = moduleName;
      }
      if (banben) {
        where.banbenh = banben;
      }
      
      const forms = await this.formRepository.find({
        where,
        order: { mokuai: 'ASC', id: 'ASC' },
      });
      
      const result = forms.map((f) => ({ 
        id: f.id, 
        banben: f.banbenh,
        mokuai: f.mokuai, 
        chuangtimc: f.chuangtimc,
        value: f.chuangtimc,
        label: f.chuangtimc
      }));
      
      this.logger.log('Result: ' + JSON.stringify(result).substring(0, 200));
      return result;
    } catch (e) {
      console.error('getForms error:', e);
      return [];
    }
  }

  // ============ 人员下拉：全部从 sys_user 加载 ============
  // 数据源切换：原 zd_jishuyuan 已停用，改由用户管理维护"是否实施/研发"标志
  // 条件统一：status=1（正常）+ userType='内部员工' + 对应标志=1
  // 返回 {value: 姓名, label: 姓名, username: 编码}，前端显示姓名、保存编码

  // 工程师（新增问题时自动绑定）：研发人员
  async getEngineers() {
    return this.getUsersByFlag('isYanfa');
  }

  // 实施人员 = 跟进人员
  async getShishi() {
    return this.getUsersByFlag('isShishi');
  }

  // 研发人员
  async getYanfa() {
    return this.getUsersByFlag('isYanfa');
  }

  private async getUsersByFlag(flag: 'isShishi' | 'isYanfa') {
    try {
      const users = await this.userRepository.find({
        where: { status: 1, userType: '内部员工', [flag]: 1 },
        order: { realName: 'ASC' },
      });
      return users.map((u) => ({
        value: u.realName,
        label: u.realName,
        username: u.username,
      }));
    } catch (e) {
      console.error('getUsersByFlag error:', e);
      return [];
    }
  }

  async getVersions() {
    try {
      const result = await this.moduleRepository.query(
        'SELECT DISTINCT banben FROM zd_mokuai'
      );
      
      return result.map((r) => ({ label: r.banben }));
    } catch (e) {
      console.error('getVersions error:', e);
      return [];
    }
  }

  // 生成拼音码函数
  private generatePinyin(text: string): string {
    if (!text) return '';
    try {
      const pinyinArray = pinyin(text, {
        style: pinyin.STYLE_FIRST_LETTER,
        heteronym: false
      });
      return pinyinArray.map(item => item[0]).join('').toUpperCase();
    } catch (error) {
      return '';
    }
  }

  async getHospitals(keyword?: string) {
    try {
      // 用 QueryBuilder（TypeORM 跨库抽象层）：mssql 下自动生成 @X 参数，MySQL 下生成 ?
      // 不手写裸 SQL，避免各数据库驱动占位符不兼容；命名参数同样防 SQL 注入
      const qb = this.configRepository.manager.createQueryBuilder()
        .from('xt_ConfigServer', 'c')
        .select('DISTINCT c.YHMC', 'name')
        .addSelect('c.SYQ', 'syq')
        .addSelect('c.PYM', 'pinyin')
        .where("c.ZuoFeiBZ = '否'")
        .andWhere("c.QY <> '内部'")
        .orderBy('c.YHMC', 'ASC');
      if (keyword) {
        // 命名参数由 TypeORM 按数据库方言自动转换（SQL Server→@kw1，MySQL→?）
        qb.andWhere('(c.YHMC LIKE :kw1 OR c.PYM LIKE :kw2)', {
          kw1: `%${keyword}%`,
          kw2: `%${keyword.toUpperCase()}%`
        });
      }
      const results = await qb.getRawMany();

      const hospitals = results.map((r) => ({
        label: r.name,
        value: r.name,
        syq: r.syq,
        pinyin: r.pinyin || this.generatePinyin(r.name)
      }));

      // 远程搜索时限制20条，无关键词时返回全部（供前端本地过滤）
      return keyword ? hospitals.slice(0, 20) : hospitals;
    } catch (e) {
      console.error('getHospitals error:', e);
      return [];
    }
  }

  async getTemplates() {
    try {
      const result = await this.moduleRepository.find({
        select: ['id', 'mokuaimc', 'banben'],
        order: { mokuaimc: 'ASC', banben: 'ASC' },
      });
      
      return result.map((r) => ({
        id: r.id,
        module: r.mokuaimc,
        version: r.banben,
        label: r.mokuaimc
      }));
    } catch (e) {
      console.error('getTemplates error:', e);
      return [];
    }
  }

  async createForm(formData: { banben: string; mokuai: string; chuangtimc: string }) {
    // 纯 ORM（实体 create/save）：TypeORM 自动适配各数据库，不再手写裸 SQL（避免占位符兼容问题）
    const saved = await this.formRepository.save(
      this.formRepository.create({
        banbenh: formData.banben || '',
        mokuai: formData.mokuai,
        chuangtidm: 0,
        chuangtimc: formData.chuangtimc,
      })
    );
    return { success: true, id: saved.id };
  }

  async updateForm(id: number, formData: { banben?: string; mokuai: string; chuangtimc: string }) {
    // 显式构建更新字段，banben 需映射到实体列 banbenh（TypeORM 无法识别 banben 属性）
    const updateData: any = {
      mokuai: formData.mokuai,
      chuangtimc: formData.chuangtimc
    };
    if (formData.banben !== undefined && formData.banben !== null) {
      updateData.banbenh = formData.banben;
    }
    await this.formRepository.update(id, updateData);
    return { success: true };
  }

  async deleteForm(id: number) {
    await this.formRepository.delete(id);
    return { success: true };
  }
}
