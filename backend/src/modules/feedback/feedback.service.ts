import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Like } from 'typeorm';
import * as fs from 'fs';
import * as path from 'path';
import { Feedback } from './feedback.entity';
import { CreateFeedbackDto, UpdateFeedbackDto, QueryFeedbackDto } from './dto/feedback.dto';

@Injectable()
export class FeedbackService {
  constructor(
    @InjectRepository(Feedback)
    private feedbackRepository: Repository<Feedback>,
  ) {}

  // 创建问题反馈 - ID自增，以ID为准
  async create(dto: CreateFeedbackDto): Promise<Feedback> {
    try {
      const feedback = this.feedbackRepository.create({
        banben: dto.banben,
        yiyuanmc: dto.yiyuanmc || dto.hospital,
        shishiry: dto.shishiry,
        mokuai: dto.mokuai || dto.module,
        chuangtimc: dto.chuangtimc || dto.form,
        wentilx: dto.wentilx,
        wentism: dto.wentism,
        shouzhongcs: dto.shouzhongcs,
        gongcscs: dto.gongcscs,
        shouhoucs: dto.shouhoucs,
        shouzhongbz: dto.shouzhongbz || 'N',
        gongchengsbz: dto.gongchengsbz || 'N',
        shouhoubz: dto.shouhoubz || 'N',
        xggcs: dto.xggcs || dto.engineer,
        csgcs: dto.csgcs,
        jingjicd: dto.jingjicd,
        lvrusj: new Date(),
        taolunbz: dto.taolunbz || 'N',
        szcsgcs: dto.szcsgcs,
      });
      
      const saved = await this.feedbackRepository.save(feedback);
      console.log('创建成功 ID:', saved.id);
      return saved;
    } catch (error) {
      console.error('创建失败:', error);
      throw error;
    }
  }

  // 分页查询问题列表
  async findAll(query: QueryFeedbackDto): Promise<{ list: Feedback[]; total: number }> {
    try {
      const { page = 1, pageSize = 10, keyword, hospital, yiyuanmc, module, mokuai, shishiry, xggcs, engineer, gongchengsbz, csrbz, taolunbz } = query;
      
      const where: any = {};
      
      if (keyword) {
        where.wentism = Like(`%${keyword}%`);
      }
      
      const h = yiyuanmc || hospital;
      if (h) {
        where.yiyuanmc = Like(`%${h}%`);
      }
      
      const m = mokuai || module;
      if (m) {
        where.mokuai = Like(`%${m}%`);
      }
      
      if (shishiry) {
        where.shishiry = shishiry;
      }
      
      const eng = xggcs || engineer;
      if (eng) {
        where.xggcs = eng;
      }
      
      if (gongchengsbz !== undefined) {
        where.gongchengsbz = gongchengsbz;
      }

      if (csrbz !== undefined) {
        where.csrbz = csrbz;
      }

      if (taolunbz !== undefined) {
        where.taolunbz = taolunbz;
      }
      
      const [list, total] = await this.feedbackRepository.findAndCount({
        where,
        order: { id: 'DESC' },
        skip: (page - 1) * pageSize,
        take: pageSize,
      });
      
      return { list, total };
    } catch (error) {
      console.error('查询列表失败:', error);
      return { list: [], total: 0 };
    }
  }

  // 根据ID查询问题详情（含图片）
  async findById(id: number): Promise<any> {
    const feedback = await this.feedbackRepository.findOne({
      where: { id },
    });
    
    if (!feedback) {
      throw new NotFoundException(`问题 ID ${id} 不存在`);
    }
    
    // 从目录获取图片列表（按ID命名）
    const images = await this.getImagesById(id);
    
    return {
      ...feedback,
      images: images.map(filename => ({
        filename,
        url: `/feedback/uploads/${filename}`
      }))
    };
  }

  // 更新问题反馈 - 以ID为条件
  async update(id: number, dto: UpdateFeedbackDto): Promise<Feedback> {
    try {
      console.log('更新问题 ID:', id);
      
      const feedback = await this.feedbackRepository.findOne({
        where: { id },
      });
      
      if (!feedback) {
        throw new NotFoundException(`问题 ID ${id} 不存在`);
      }
      
      // 直接合并字段并保存，避免update方法的类型问题
      if (dto.banben !== undefined) feedback.banben = dto.banben;
      if (dto.yiyuanmc || dto.hospital) feedback.yiyuanmc = dto.yiyuanmc || dto.hospital;
      if (dto.shishiry !== undefined) feedback.shishiry = dto.shishiry;
      if (dto.mokuai || dto.module) feedback.mokuai = dto.mokuai || dto.module;
      if (dto.chuangtimc || dto.form) feedback.chuangtimc = dto.chuangtimc || dto.form;
      if (dto.wentilx !== undefined) feedback.wentilx = dto.wentilx;
      if (dto.wentism !== undefined) feedback.wentism = dto.wentism;
      if (dto.shouzhongcs !== undefined) feedback.shouzhongcs = dto.shouzhongcs;
      if (dto.gongcscs !== undefined) feedback.gongcscs = dto.gongcscs;
      if (dto.shouhoucs !== undefined) feedback.shouhoucs = dto.shouhoucs;
      if (dto.shouzhongbz !== undefined) feedback.shouzhongbz = dto.shouzhongbz;
      if (dto.gongchengsbz !== undefined) feedback.gongchengsbz = dto.gongchengsbz;
      if (dto.shouhoubz !== undefined) feedback.shouhoubz = dto.shouhoubz;
      if (dto.xggcs || dto.engineer) feedback.xggcs = dto.xggcs || dto.engineer;
      if (dto.csgcs !== undefined) feedback.csgcs = dto.csgcs;
      if (dto.jingjicd !== undefined) feedback.jingjicd = dto.jingjicd;
      if (dto.taolunbz !== undefined) feedback.taolunbz = dto.taolunbz;
      
      feedback.xgsj = new Date();
      
      const saved = await this.feedbackRepository.save(feedback);
      console.log('更新成功 ID:', saved.id);
      return saved;
    } catch (error) {
      console.error('更新失败:', error);
      throw error;
    }
  }

  // 删除问题反馈
  async remove(id: number): Promise<void> {
    const feedback = await this.feedbackRepository.findOne({ where: { id } });
    if (feedback) {
      // 删除对应的图片
      await this.deleteImagesById(id);
      await this.feedbackRepository.delete(id);
    }
  }

  // 批量删除
  async batchRemove(ids: number[]): Promise<void> {
    for (const id of ids) {
      await this.remove(id);
    }
  }

  // 根据ID获取图片列表 - 图片命名格式: {id}-{序号}.{扩展名}
  async getImagesById(id: number): Promise<string[]> {
    try {
      const uploadsDir = './uploads';
      
      if (!fs.existsSync(uploadsDir)) {
        return [];
      }
      
      const files = fs.readdirSync(uploadsDir);
      
      // 过滤出以 id- 开头的图片文件
      const imageFiles = files.filter(file => {
        const prefix = `${id}-`;
        const ext = path.extname(file).toLowerCase();
        const isImage = ['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.webp'].includes(ext);
        return file.startsWith(prefix) && isImage;
      });
      
      // 按序号排序
      imageFiles.sort((a, b) => {
        const aNum = parseInt(a.split('-')[1]?.split('.')[0] || '0');
        const bNum = parseInt(b.split('-')[1]?.split('.')[0] || '0');
        return aNum - bNum;
      });
      
      return imageFiles;
    } catch (error) {
      console.error('获取图片列表失败:', error);
      return [];
    }
  }

  // 根据ID删除所有图片
  async deleteImagesById(id: number): Promise<void> {
    try {
      const uploadsDir = './uploads';
      
      if (!fs.existsSync(uploadsDir)) {
        return;
      }
      
      const files = fs.readdirSync(uploadsDir);
      
      for (const file of files) {
        if (file.startsWith(`${id}-`)) {
          const filePath = path.join(uploadsDir, file);
          fs.unlinkSync(filePath);
          console.log('已删除图片:', file);
        }
      }
    } catch (error) {
      console.error('删除图片失败:', error);
    }
  }
}
