import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Like } from 'typeorm';
import * as fs from 'fs';
import * as path from 'path';
import { YwWentilb } from '../entities/ywWentilb.entity';
import { Ok } from '../entities/ok.entity';
import { CreateFeedbackDto, UpdateFeedbackDto, QueryFeedbackDto } from './dto/feedback.dto';

@Injectable()
export class FeedbackService {
  constructor(
    @InjectRepository(YwWentilb)
    private feedbackRepository: Repository<YwWentilb>,
    @InjectRepository(Ok)
    private okRepository: Repository<Ok>,
  ) {}

  // 获取下一个流水号 - 从ok表获取
  async getNextLsh(): Promise<{ lsh: string; now: string }> {
    try {
      let okRecord = await this.okRepository.findOne({
        where: {}
      });

      let nextLsh = 1;

      if (okRecord) {
        nextLsh = (okRecord.lsh || 0) + 1;
        // 立即更新 ok 表，避免并发重复
        okRecord.lsh = nextLsh;
        await this.okRepository.save(okRecord);
      } else {
        okRecord = this.okRepository.create({
          lsh: 1
        });
        await this.okRepository.save(okRecord);
      }

      return {
        lsh: String(nextLsh),
        now: new Date().toISOString().replace('T', ' ').substring(0, 19)
      };
    } catch (error) {
      console.error('获取流水号失败:', error);
      // 失败时取最大 lsh + 1，避免重复
      try {
        const result: any = await this.feedbackRepository.manager.query(
          'SELECT ISNULL(MAX(lsh), 0) + 1 as nextLsh FROM yw_wentilb'
        );
        const next = result[0]?.nextLsh || 1;
        return {
          lsh: String(next),
          now: new Date().toISOString().replace('T', ' ').substring(0, 19)
        };
      } catch (e2) {
        return {
          lsh: Date.now().toString(),
          now: new Date().toISOString().replace('T', ' ').substring(0, 19)
        };
      }
    }
  }

  // 更新ok表的lsh字段
  private async updateOkLsh(lsh: number): Promise<void> {
    try {
      let okRecord = await this.okRepository.findOne({
        where: {}
      });
      
      if (okRecord) {
        okRecord.lsh = lsh;
        await this.okRepository.save(okRecord);
      } else {
        okRecord = this.okRepository.create({
          lsh: lsh
        });
        await this.okRepository.save(okRecord);
      }
    } catch (error) {
      console.error('更新ok表lsh失败:', error);
    }
  }

  // 创建反馈
  async create(dto: CreateFeedbackDto): Promise<YwWentilb> {
    try {
      // 总是从 ok 表原子地获取新的 lsh，避免重复
      const nextLshData = await this.getNextLsh();
      const lsh = parseInt(nextLshData.lsh) || 1;
      console.log('创建反馈，原子获取的lsh:', lsh);
      
      const feedback = this.feedbackRepository.create({
        lsh: lsh,
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
      });
      console.log('创建feedback对象:', feedback);
      
      const savedFeedback = await this.feedbackRepository.save(feedback);
      console.log('保存成功:', savedFeedback);
      
      return savedFeedback;
    } catch (error) {
      console.error('创建反馈失败:', error);
      throw error;
    }
  }

  // 根据lsh获取图片列表 - 从目录检索
  async getImagesByLsh(lsh: number): Promise<string[]> {
    try {
      const uploadsDir = './uploads';
      
      // 检查目录是否存在
      if (!fs.existsSync(uploadsDir)) {
        return [];
      }
      
      // 读取目录中的所有文件
      const files = fs.readdirSync(uploadsDir);
      
      // 过滤出以 lsh- 开头的图片文件
      const imageFiles = files.filter(file => {
        const prefix = `${lsh}-`;
        const ext = path.extname(file).toLowerCase();
        const isImage = ['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.webp'].includes(ext);
        return file.startsWith(prefix) && isImage;
      });
      
      // 按文件名排序
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

  // 删除某个lsh的所有图片
  async deleteImagesByLsh(lsh: number): Promise<void> {
    try {
      const uploadsDir = './uploads';
      
      // 检查目录是否存在
      if (!fs.existsSync(uploadsDir)) {
        return;
      }
      
      // 读取目录中的所有文件
      const files = fs.readdirSync(uploadsDir);
      
      // 删除以 lsh- 开头的所有文件
      for (const file of files) {
        if (file.startsWith(`${lsh}-`)) {
          const filePath = path.join(uploadsDir, file);
          fs.unlinkSync(filePath);
          console.log('已删除图片:', file);
        }
      }
    } catch (error) {
      console.error('删除图片失败:', error);
    }
  }

  // 分页查询反馈列表
  async findAll(query: QueryFeedbackDto): Promise<{ list: YwWentilb[]; total: number }> {
    try {
      const { page = 1, pageSize = 10, keyword, hospital, yiyuanmc, module, mokuai, shishiry, xggcs, engineer, gongchengsbz, taolunbz, lsh } = query;
      
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
      
      if (lsh) {
        where.lsh = lsh;
      }
      
      const [list, total] = await this.feedbackRepository.findAndCount({
        where,
        order: { id: 'DESC' },
        skip: (page - 1) * pageSize,
        take: pageSize,
      });
      
      return { list, total };
    } catch (error) {
      console.error('查询反馈列表失败:', error);
      return { list: [], total: 0 };
    }
  }

  // 根据 ID 查询反馈（含图片）
  async findById(id: number): Promise<any> {
    const feedback = await this.feedbackRepository.findOne({
      where: { id },
    });
    
    if (!feedback) {
      throw new NotFoundException(`反馈 ID ${id} 不存在`);
    }
    
    // 从目录获取图片列表
    const images = await this.getImagesByLsh(feedback.lsh);
    
    return {
      ...feedback,
      images: images.map(filename => ({
        filename,
        url: `/feedback/uploads/${filename}`
      }))
    };
  }

  // 更新反馈
  async update(id: number, dto: UpdateFeedbackDto): Promise<YwWentilb> {
    const feedback = await this.feedbackRepository.findOne({
      where: { id },
    });
    
    if (!feedback) {
      throw new NotFoundException(`反馈 ID ${id} 不存在`);
    }
    
    const updateData: any = {
      xgsj: new Date(),
    };
    
    if (dto.banben !== undefined) updateData.banben = dto.banben;
    if (dto.yiyuanmc || dto.hospital) updateData.yiyuanmc = dto.yiyuanmc || dto.hospital;
    if (dto.shishiry !== undefined) updateData.shishiry = dto.shishiry;
    if (dto.mokuai || dto.module) updateData.mokuai = dto.mokuai || dto.module;
    if (dto.chuangtimc || dto.form) updateData.chuangtimc = dto.chuangtimc || dto.form;
    if (dto.wentilx !== undefined) updateData.wentilx = dto.wentilx;
    if (dto.wentism !== undefined) updateData.wentism = dto.wentism;
    if (dto.shouzhongcs !== undefined) updateData.shouzhongcs = dto.shouzhongcs;
    if (dto.gongcscs !== undefined) updateData.gongcscs = dto.gongcscs;
    if (dto.shouhoucs !== undefined) updateData.shouhoucs = dto.shouhoucs;
    if (dto.shouzhongbz !== undefined) updateData.shouzhongbz = dto.shouzhongbz;
    if (dto.gongchengsbz !== undefined) updateData.gongchengsbz = dto.gongchengsbz;
    if (dto.shouhoubz !== undefined) updateData.shouhoubz = dto.shouhoubz;
    if (dto.xggcs || dto.engineer) updateData.xggcs = dto.xggcs || dto.engineer;
    if (dto.csgcs !== undefined) updateData.csgcs = dto.csgcs;
    if (dto.jingjicd !== undefined) updateData.jingjicd = dto.jingjicd;
    if (dto.taolunbz !== undefined) updateData.taolunbz = dto.taolunbz;
    
    await this.feedbackRepository.update(id, updateData);
    
    return this.feedbackRepository.findOne({ where: { id } });
  }

  async remove(id: number): Promise<void> {
    const feedback = await this.feedbackRepository.findOne({ where: { id } });
    if (feedback) {
      // 删除对应的图片
      await this.deleteImagesByLsh(feedback.lsh);
      await this.feedbackRepository.delete(id);
    }
  }

  async batchRemove(ids: number[]): Promise<void> {
    for (const id of ids) {
      await this.remove(id);
    }
  }
}
