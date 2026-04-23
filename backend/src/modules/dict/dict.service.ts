import { Injectable, Logger } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Hospital } from './hospital.entity';
import { Module as AppModule } from './module.entity';
import { Form } from './form.entity';
import { Engineer } from './engineer.entity';

@Injectable()
export class DictService {
  private readonly logger = new Logger(DictService.name);

  constructor(
    @InjectRepository(Hospital) private hospitalRepository: Repository<Hospital>,
    @InjectRepository(AppModule) private moduleRepository: Repository<AppModule>,
    @InjectRepository(Form) private formRepository: Repository<Form>,
    @InjectRepository(Engineer) private engineerRepository: Repository<Engineer>,
  ) {}

  async getModules() {
    try {
      const modules = await this.moduleRepository
        .createQueryBuilder('m')
        .select(['m.id', 'm.banben', 'm.mokuaimc'])
        .where('m.mokuaimc IS NOT NULL')
        .orderBy('m.mokuaimc', 'ASC')
        .getMany();
      
      return modules.map(m => ({ 
        id: m.id, 
        banben: m.banben, 
        mokuaimc: m.mokuaimc,
        value: m.mokuaimc,
        label: m.mokuaimc
      }));
    } catch (e) {
      return [];
    }
  }

  async createModule(moduleData: { banben: string; mokuaimc: string }) {
    const module = this.moduleRepository.create(moduleData);
    await this.moduleRepository.save(module);
    return { success: true };
  }

  async updateModule(id: number, moduleData: { banben: string; mokuaimc: string }) {
    await this.moduleRepository.update(id, moduleData);
    return { success: true };
  }

  async deleteModule(id: number) {
    await this.moduleRepository.delete(id);
    return { success: true };
  }

  async getForms(moduleName?: string) {
    this.logger.log('getForms called, moduleName: [' + moduleName + ']');
    
    try {
      const qb = this.formRepository.createQueryBuilder('f')
        .select(['f.id', 'f.mokuai', 'f.chuangtimc']);
      
      if (moduleName) {
        qb.where('f.mokuai = :moduleName', { moduleName });
      }
      
      const forms = await qb.orderBy('f.mokuai', 'ASC').addOrderBy('f.id', 'ASC').getMany();
      
      const result = forms.map(f => ({ 
        id: f.id, 
        mokuai: f.mokuai, 
        chuangtimc: f.chuangtimc,
        value: f.chuangtimc,
        label: f.chuangtimc
      }));
      
      this.logger.log('Result: ' + JSON.stringify(result).substring(0, 200));
      return result;
    } catch (e) {
      return [];
    }
  }

  async getEngineers() {
    try {
      const engineers = await this.engineerRepository
        .createQueryBuilder('e')
        .select(['e.xingming'])
        .where('e.zhuangtai = 1')
        .orderBy('e.xingming', 'ASC')
        .take(20)
        .getMany();
      
      return engineers.map(e => ({ value: e.xingming, label: e.xingming }));
    } catch (e) {
      return [];
    }
  }

  async getShishi() {
    try {
      const engineers = await this.engineerRepository
        .createQueryBuilder('e')
        .select(['e.xingming'])
        .where('e.zhuangtai = 1')
        .orderBy('e.xingming', 'ASC')
        .take(20)
        .getMany();
      
      return engineers.map(e => ({ value: e.xingming, label: e.xingming }));
    } catch (e) {
      return [];
    }
  }

  async getYanfa() {
    try {
      const engineers = await this.engineerRepository
        .createQueryBuilder('e')
        .select(['e.xingming'])
        .where('e.zhuangtai = 1')
        .orderBy('e.xingming', 'ASC')
        .take(20)
        .getMany();
      
      return engineers.map(e => ({ value: e.xingming, label: e.xingming }));
    } catch (e) {
      return [];
    }
  }

  async getVersions() {
    try {
      const result = await this.hospitalRepository
        .createQueryBuilder('h')
        .select('h.banben')
        .distinct(true)
        .getRawMany();
      
      return result.map(r => ({ label: r.h_banben }));
    } catch (e) {
      return [];
    }
  }

  async getHospitals(keyword?: string) {
    try {
      const qb = this.hospitalRepository
        .createQueryBuilder('h')
        .select(['h.YHMC as label', 'h.YHMC as value', 'h.PYM as pinyin'])
        .distinct(true);
      
      if (keyword) {
        qb.where('h.YHMC LIKE :keyword', { keyword: `%${keyword}%` })
          .orWhere('h.PYM LIKE :keyword', { keyword: `%${keyword}%` });
      }
      
      const result = await qb.orderBy('h.YHMC', 'ASC').take(keyword ? 20 : 50).getRawMany();
      return result.map(r => ({ label: r.label, value: r.value, pinyin: r.pinyin }));
    } catch (e) {
      return [];
    }
  }

  async getTemplates() {
    try {
      const result = await this.hospitalRepository
        .createQueryBuilder('h')
        .select(['h.id', 'h.mokuai as module', 'h.banben as version', 'h.mokuai as label'])
        .orderBy('h.mokuai', 'ASC')
        .addOrderBy('h.banben', 'ASC')
        .getRawMany();
      
      return result;
    } catch (e) {
      return [];
    }
  }

  async createForm(formData: { mokuai: string; chuangtimc: string }) {
    const form = this.formRepository.create(formData);
    await this.formRepository.save(form);
    return { success: true };
  }

  async updateForm(id: number, formData: { mokuai: string; chuangtimc: string }) {
    await this.formRepository.update(id, formData);
    return { success: true };
  }

  async deleteForm(id: number) {
    await this.formRepository.delete(id);
    return { success: true };
  }
}