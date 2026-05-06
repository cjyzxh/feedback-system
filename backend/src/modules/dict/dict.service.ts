import { Injectable, Logger } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Like } from 'typeorm';
import { XtConfigServer } from '../entities/xtConfigServer.entity';
import { ZdMokuai } from '../entities/zdMokuai.entity';
import { ZdChuangti } from '../entities/zdChuangti.entity';
import { ZdJishuyuan } from '../entities/zdJishuyuan.entity';
import pinyin from 'pinyin';

@Injectable()
export class DictService {
  private readonly logger = new Logger(DictService.name);

  constructor(
    @InjectRepository(ZdMokuai) private moduleRepository: Repository<ZdMokuai>,
    @InjectRepository(ZdChuangti) private formRepository: Repository<ZdChuangti>,
    @InjectRepository(ZdJishuyuan) private engineerRepository: Repository<ZdJishuyuan>,
    @InjectRepository(XtConfigServer) private configRepository: Repository<XtConfigServer>,
  ) {}

  async getModules() {
    try {
      const modules = await this.moduleRepository.find({
        where: { mokuaimc: Like('%') },
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
      'SELECT ISNULL(MAX(ID), 0) + 1 as nextId FROM zd_mokuai'
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
      const where: any = {};
      if (moduleName) {
        where.mokuai = moduleName;
      }
      
      const forms = await this.formRepository.find({
        where,
        order: { mokuai: 'ASC', id: 'ASC' },
      });
      
      const result = forms.map((f) => ({ 
        id: f.id, 
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

  async getEngineers() {
    try {
      const engineers = await this.engineerRepository.find({
        where: { zhuangtai: '1' },
        order: { xingming: 'ASC' },
      });
      
      const uniqueNames = [...new Set(engineers.map((e) => e.xingming))];
      return uniqueNames.map((name) => ({ value: name, label: name }));
    } catch (e) {
      console.error('getEngineers error:', e);
      return [];
    }
  }

  async getShishi() {
    return this.getEngineers();
  }

  async getYanfa() {
    return this.getEngineers();
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
      const results = await this.configRepository.query(
        "SELECT DISTINCT YHMC as name, SYQ as syq FROM xt_ConfigServer WHERE ZuoFeiBZ = '否' AND QY <> '内部' ORDER BY YHMC"
      );
      
      let hospitals = results.map((r) => ({
        label: r.name,
        value: r.name,
        syq: r.syq,
        pinyin: this.generatePinyin(r.name)
      }));
      
      if (keyword) {
        const lowerKeyword = keyword.toLowerCase();
        hospitals = hospitals.filter(h => 
          h.label.toLowerCase().includes(lowerKeyword) || 
          h.pinyin.toLowerCase().includes(lowerKeyword)
        );
      }
      
      return keyword ? hospitals.slice(0, 20) : hospitals.slice(0, 50);
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

  async createForm(formData: { mokuai: string; chuangtimc: string }) {
    const maxIdResult = await this.formRepository.query(
      'SELECT ISNULL(MAX(ID), 0) + 1 as nextId FROM zd_chuangti'
    );
    const nextId = maxIdResult[0]?.nextId || 1;
    
    const form = this.formRepository.create({
      id: nextId,
      banbenh: '',
      mokuai: formData.mokuai,
      chuangtidm: 0,
      chuangtimc: formData.chuangtimc,
    });
    
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
