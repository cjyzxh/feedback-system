import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Feedback } from './feedback.entity';
import { FeedbackImage } from './feedback-image.entity';
import { CreateFeedbackDto, UpdateFeedbackDto, QueryFeedbackDto } from './dto/feedback.dto';

@Injectable()
export class FeedbackService {
  constructor(
    @InjectRepository(Feedback)
    private feedbackRepository: Repository<Feedback>,
    @InjectRepository(FeedbackImage)
    private imageRepository: Repository<FeedbackImage>,
  ) {}

  // 获取下一个流水号
  async getNextLsh(): Promise<{ lsh: number; now: string }> {
    const queryRunner = this.feedbackRepository.manager.connection.createQueryRunner();
    await queryRunner.connect();
    
    try {
      // MSSQL 语法：创建 ok 表（如果不存在）
      await queryRunner.query(`
        IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ok]') AND type in (N'U'))
        BEGIN
          CREATE TABLE ok (id INT PRIMARY KEY, lsh INT DEFAULT 0);
          INSERT INTO ok (id, lsh) VALUES (1, 0);
        END
      `);
      
      const result = await queryRunner.query('SELECT lsh FROM ok WHERE id = 1');
      let currentLsh = 0;
      
      if (result && result.length > 0 && result[0].lsh !== undefined) {
        currentLsh = parseInt(result[0].lsh) || 0;
      }
      
      const nextLsh = currentLsh + 1;
      
      // 如果 nextLsh 超出 INT 范围，重置为 1
      if (nextLsh > 2147483647) {
        await queryRunner.query('UPDATE ok SET lsh = 0 WHERE id = 1');
        return { lsh: 1, now: new Date().toISOString().replace('T', ' ').substring(0, 19) };
      }
      
      await queryRunner.query('UPDATE ok SET lsh = @0 WHERE id = 1', [nextLsh]);
      
      return {
        lsh: nextLsh,
        now: new Date().toISOString().replace('T', ' ').substring(0, 19)
      };
    } catch (error) {
      console.error('获取流水号失败:', error);
      // 如果出错，返回一个基于时间戳的临时流水号
      return {
        lsh: Date.now(),
        now: new Date().toISOString().replace('T', ' ').substring(0, 19)
      };
    } finally {
      await queryRunner.release();
    }
  }

  // 创建反馈 - 强制使用系统生成的流水号，忽略前端传来的
  async create(dto: CreateFeedbackDto): Promise<Feedback> {
    // 始终从系统获取流水号，防止前端传来超大值（如 Date.now()）
    const lshInfo = await this.getNextLsh();
    const lsh = lshInfo.lsh;
    
    const feedback = new Feedback();
    feedback.lsh = lsh;
    feedback.banben = dto.banben;
    feedback.hospital = dto.yiyuanmc || dto.hospital;
    feedback.shishiry = dto.shishiry;
    feedback.module = dto.mokuai || dto.module;
    feedback.form = dto.chuangtimc || dto.form;
    feedback.wentilx = dto.wentilx;
    feedback.wentism = dto.wentism;
    feedback.shouzhongcs = dto.shouzhongcs;
    feedback.gongcscs = dto.gongcscs;
    feedback.shouhoucs = dto.shouhoucs;
    feedback.shouzhongbz = dto.shouzhongbz || 'N';
    feedback.gongchengsbz = dto.gongchengsbz || 'N';
    feedback.shouhoubz = dto.shouhoubz || 'N';
    feedback.engineer = dto.xggcs || dto.engineer;
    feedback.csgcs = dto.csgcs;
    feedback.jingjicd = dto.jingjicd;
    feedback.lvrusj = new Date();
    feedback.taolunbz = dto.taolunbz || 'N';
    feedback.lurusr = dto.lurusr || null;
    feedback.lurumid = dto.lurumid || null;
    
    return this.feedbackRepository.save(feedback);
  }

  // 分页查询反馈列表
  async findAll(query: QueryFeedbackDto): Promise<{ list: Feedback[]; total: number }> {
    try {
      const { page = 1, pageSize = 10, keyword, hospital, yiyuanmc, module, mokuai, lsh, shishiry, xggcs, engineer, gongchengsbz, lurumid, lurusr } = query;
      
      const params: any[] = [];
      const whereClauses: string[] = [];
      
      if (keyword) {
        whereClauses.push('(wentism LIKE @0 OR shouzhongcs LIKE @0)');
        params.push(`%${keyword}%`);
      }
      
      const h = yiyuanmc || hospital;
      if (h) {
        whereClauses.push(`yiyuanmc LIKE @${params.length}`);
        params.push(`%${h}%`);
      }
      
      const m = mokuai || module;
      if (m) {
        whereClauses.push(`mokuai LIKE @${params.length}`);
        params.push(`%${m}%`);
      }
      
      if (shishiry) {
        whereClauses.push(`shishiry = @${params.length}`);
        params.push(shishiry);
      }
      
      const eng = xggcs || engineer;
      if (eng) {
        whereClauses.push(`xggcs = @${params.length}`);
        params.push(eng);
      }
      
      const whereClause = whereClauses.length > 0 ? 'WHERE ' + whereClauses.join(' AND ') : '';
      
      // 查询总数
      const countResult = await this.feedbackRepository.manager.query(
        `SELECT COUNT(*) as total FROM yw_wentilb ${whereClause}`,
        params
      );
      const total = countResult[0].total || 0;
      
      // 查询数据 - 使用简单的 TOP
      const offset = (page - 1) * pageSize;
      let listResult;
      
      if (offset === 0) {
        listResult = await this.feedbackRepository.manager.query(
          `SELECT TOP ${pageSize} * FROM yw_wentilb ${whereClause} ORDER BY id DESC`,
          params
        );
      } else {
        listResult = await this.feedbackRepository.manager.query(
          `SELECT TOP ${pageSize} * FROM (
            SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as RowNum FROM yw_wentilb ${whereClause}
          ) as t WHERE RowNum > ${offset}`,
          params
        );
      }
      
      // 映射字段
      const mappedList = listResult.map((item: any) => ({
        ...item,
        yiyuanmc: item.yiyuanmc,
        mokuai: item.mokuai,
        xggcs: item.xggcs,
        chuangtimc: item.chuangtimc,
      }));
      
      return { list: mappedList, total };
    } catch (error) {
      console.error('查询反馈列表失败:', error);
      return { list: [], total: 0 };
    }
  }

  // 根据 ID 查询反馈（含图片）
  async findById(id: number): Promise<any> {
    try {
      const results = await this.feedbackRepository.manager.query(
        'SELECT * FROM yw_wentilb WHERE id = @0',
        [id]
      );
      
      if (!results || results.length === 0) {
        throw new NotFoundException(`反馈 ID ${id} 不存在`);
      }
      
      const feedback = results[0];
      
      let images: any[] = [];
      try {
        const imageResults = await this.feedbackRepository.manager.query(
          'SELECT * FROM yw_wentitp WHERE lsh = @0',
          [String(feedback.lsh)]
        );
        images = (imageResults || []).map((img: any) => ({
          id: img.id,
          url: `/feedback/uploads/${img.tpnum || img.id}.jpg`,
          filename: `${img.tpnum || img.id}.jpg`
        }));
      } catch (e) {
        console.log('查询图片失败:', e);
      }
      
      return {
        ...feedback,
        yiyuanmc: feedback.yiyuanmc,
        mokuai: feedback.mokuai,
        xggcs: feedback.xggcs,
        chuangtimc: feedback.chuangtimc,
        images
      };
    } catch (error) {
      console.error('查询反馈详情失败:', error);
      throw error;
    }
  }

  // 保存图片
  async saveImages(feedbackId: number, images: { url: string; filename: string }[]): Promise<void> {
    const feedback = await this.findById(feedbackId);
    await this.imageRepository.delete({ lsh: String(feedback.lsh) });
    
    for (let i = 0; i < images.length; i++) {
      const img = images[i];
      await this.imageRepository.save({
        lsh: String(feedback.lsh),
        yiyuanmc: feedback.hospital,
        tpnum: i + 1,
        pic1: img.filename || '',
        lurusj: new Date()
      });
    }
  }

  // 更新反馈
  async update(id: number, dto: UpdateFeedbackDto): Promise<Feedback> {
    const feedback = await this.feedbackRepository.findOne({ where: { id } });
    if (!feedback) {
      throw new NotFoundException(`反馈 ID ${id} 不存在`);
    }
    
    feedback.banben = dto.banben ?? feedback.banben;
    feedback.hospital = dto.yiyuanmc || dto.hospital || feedback.hospital;
    feedback.shishiry = dto.shishiry ?? feedback.shishiry;
    feedback.module = dto.mokuai || dto.module || feedback.module;
    feedback.form = dto.chuangtimc || dto.form || feedback.form;
    feedback.wentilx = dto.wentilx ?? feedback.wentilx;
    feedback.wentism = dto.wentism ?? feedback.wentism;
    feedback.shouzhongcs = dto.shouzhongcs ?? feedback.shouzhongcs;
    feedback.gongcscs = dto.gongcscs ?? feedback.gongcscs;
    feedback.shouhoucs = dto.shouhoucs ?? feedback.shouhoucs;
    feedback.shouzhongbz = dto.shouzhongbz ?? feedback.shouzhongbz;
    feedback.gongchengsbz = dto.gongchengsbz ?? feedback.gongchengsbz;
    feedback.shouhoubz = dto.shouhoubz ?? feedback.shouhoubz;
    feedback.engineer = dto.xggcs || dto.engineer || feedback.engineer;
    feedback.csgcs = dto.csgcs ?? feedback.csgcs;
    feedback.jingjicd = dto.jingjicd ?? feedback.jingjicd;
    feedback.taolunbz = dto.taolunbz ?? feedback.taolunbz;
    feedback.lurusr = dto.lurusr ?? feedback.lurusr;
    feedback.lurumid = dto.lurumid ?? feedback.lurumid;
    
    return this.feedbackRepository.save(feedback);
  }

  async remove(id: number): Promise<void> {
    await this.feedbackRepository.delete(id);
  }

  async batchRemove(ids: number[]): Promise<void> {
    await this.feedbackRepository.delete(ids);
  }
}
