import { Injectable, NotFoundException } from '@nestjs/common';
import { Subject } from 'rxjs';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Like, Between, In } from 'typeorm';
import * as fs from 'fs';
import * as path from 'path';
import { Feedback } from './feedback.entity';
import { Tzxx } from './tzxx.entity';
import { Fjxx } from './fjxx.entity';
import { CreateFeedbackDto, UpdateFeedbackDto, QueryFeedbackDto } from './dto/feedback.dto';
import { DatabaseConfigService } from '../config/config.service';

// 业务服务层（类比 VB6 的业务类 .cls：Controller 负责接请求，Service 负责干实事）
@Injectable()
export class FeedbackService {
  constructor(
    // @InjectRepository 注入操作 yw_wentilb 表的"仓库对象"
    // Repository = TypeORM 的数据访问层，类比 VB6 里封装好的 ADODB.Recordset 操作类
    @InjectRepository(Feedback)
    private feedbackRepository: Repository<Feedback>,
    @InjectRepository(Tzxx)
    private tzxxRepository: Repository<Tzxx>,
    @InjectRepository(Fjxx)
    private fjxxRepository: Repository<Fjxx>,
    private configService: DatabaseConfigService,  // 读上传目录配置等
  ) {}

  // 主业务表（yw_wentilb）变更广播：增删改后推送信号，前端收到后刷新"我的处理状态"
  // 无变化时前端零轮询（SSE 事件驱动，类比 VB6 的 RaiseEvent）
  public statusSubject = new Subject<{ type: string; data: { time: number } }>();
  notifyStatusChanged(): void {
    // NestJS @Sse 会把 {type, data} 序列化为标准 SSE：event: changed + data: {...}
    // 必须带 data 字段，否则部分浏览器（Chrome）收不到该自定义事件
    this.statusSubject.next({ type: 'changed', data: { time: Date.now() } });
  }

  // 写入一条通知：接收人 = 本人时不写；空编码不写
  // 防重：同一问题 + 同一类型 + 同一接收人且未读（ydsj 为空）已存在时不再重复写，
  // 避免"确认处理/返回"等动作被重复提交（如双击/重复请求）时给用户弹两条一样的内容
  private async addTzxx(wentiid: number, lx: string, jsrbm: string, nr: string, excludeBm?: string) {
    try {
      if (!jsrbm || (excludeBm && jsrbm === excludeBm)) return;
      const exists = await this.tzxxRepository.findOne({
        where: { wentiid, lx, jsrbm, ydsj: null }
      });
      if (exists) return;
      await this.tzxxRepository.save(this.tzxxRepository.create({
        wentiid, lx, jsrbm, nr, lrsj: new Date(),
      }));
    } catch (error) {
      console.error('写入通知失败:', error);
    }
  }

  // 创建问题反馈（POST /api/feedback）
  // create() = 在内存里组装一条新记录，save() = 真正写库
  // 注意：lvrusj（录入时间）在这里统一用 new Date() 后端生成，不让前端传
  async create(dto: CreateFeedbackDto): Promise<Feedback> {
    try {
      const feedback = this.feedbackRepository.create({
        banben: dto.banben,
        yiyuanmc: dto.yiyuanmc || dto.hospital,
        shishiry: dto.shishiry,
        shishiryBM: dto.shishiryBM,
        mokuai: dto.mokuai || dto.module,
        chuangtimc: dto.chuangtimc || dto.form,
        wentism: dto.wentism,
        shouzhongcs: dto.shouzhongcs,
        gongcscs: dto.gongcscs,
        shouhoucs: dto.shouhoucs,
        shouzhongbz: dto.shouzhongbz || 'N',
        gongchengsbz: dto.gongchengsbz || 'N',
        shouhoubz: dto.shouhoubz || 'N',
        xggcs: dto.xggcs || dto.engineer,
        jingjicd: dto.jingjicd,
        wentilx: dto.wentilx || '其它问题',
        lvrusj: new Date(),
        taolunbz: dto.taolunbz || 'N',
        szcsgcs: dto.szcsgcs,
        szcsgcsBM: dto.szcsgcsBM,
        FanKuiQD: dto.FanKuiQD,
        shcsgcs: dto.shcsgcs,
        shcsgcsBM: dto.shcsgcsBM,
        cssj: dto.cssj,
        xggcsBM: dto.xggcsBM,
        LSH: dto.LSH,
      });
      
      const saved = await this.feedbackRepository.save(feedback);
      console.log('创建成功 ID:', saved.id);

      // ===== 事件通知：新增问题 → 提醒工程师 + 跟进人（录入人本人不提示） =====
      const tzTitle = `【新问题#${saved.id}】${saved.yiyuanmc || ''} ${saved.mokuai || ''}${saved.chuangtimc ? '-' + saved.chuangtimc : ''}：${(saved.wentism || '').slice(0, 50)}`;
      if (saved.xggcsBM) await this.addTzxx(saved.id, '新增', saved.xggcsBM, tzTitle, saved.szcsgcsBM);
      if (saved.shishiryBM) await this.addTzxx(saved.id, '新增', saved.shishiryBM, tzTitle, saved.szcsgcsBM);

      this.notifyStatusChanged();
      return saved;
    } catch (error) {
      console.error('创建失败:', error);
      throw error;
    }
  }

  // 分页查询问题列表
  async findAll(query: QueryFeedbackDto): Promise<{ list: Feedback[]; total: number }> {
    try {
      const { page = 1, pageSize = 10, keyword, hospital, yiyuanmc, module, mokuai, shishiry, xggcs, engineer, shishiryBM, xggcsBM, relatedBM, hasReturn, gongchengsbz, shouhoubz, taolunbz, zhuangtai, startDate, endDate, id, dateField } = query;
      
      const where: any = {};
      
      // 按ID精确查询
      if (id) {
        where.id = id;
      }
      
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
      
      // 人员查询统一用编码（shishiryBM），兼容旧前端传姓名 shishiry
      const sPerson = shishiryBM || shishiry;
      if (sPerson) {
        where.shishiryBM = sPerson;
      }
      
      // 工程师查询统一用编码（xggcsBM），兼容旧前端传姓名 xggcs/engineer
      const eng = xggcsBM || xggcs || engineer;
      if (eng) {
        where.xggcsBM = eng;
      }
      
      // ===== 按"状态"筛选（选了状态下拉时，这里优先，单字段条件全部跳过） =====
      // 状态的本质是三个标志位的组合：
      //   未完成: 未测试(shouhoubz='N') + 非讨论(taolunbz='N')
      //   已完成: 测试完成(shouhoubz='Y') + 非讨论(taolunbz='N')
      //   待讨论: taolunbz='Y'（只看这一个标志）
      if (zhuangtai) {
        switch (zhuangtai) {
          case 'weiwan':
            where.shouhoubz = 'N';
            where.taolunbz = 'N';
            break;
          case 'yiwan':
            where.shouhoubz = 'Y';
            where.taolunbz = 'N';
            break;
          case 'daitaolun':
            where.taolunbz = 'Y';
            break;
        }
      } else {
        // 没有选择状态时，才按单个字段筛选
        if (gongchengsbz !== undefined) {
          where.gongchengsbz = gongchengsbz;
        }

        if (shouhoubz !== undefined) {
          where.shouhoubz = shouhoubz;
        }

        if (taolunbz !== undefined) {
          where.taolunbz = taolunbz;
        }
      }

      // ===== 时间范围查询 =====
      // dateField 决定按哪个时间字段过滤：
      //   问题列表/问题处理页 -> lvrusj（录入时间）
      //   问题测试页           -> xgsj（处理时间）
      // Between(a, b) = SQL 的 BETWEEN 范围查询
      const queryDateField = dateField || 'lvrusj';
      if (startDate && endDate) {
        const start = new Date(startDate);
        start.setHours(0, 0, 0, 0);        // 起：当天 0 点
        const end = new Date(endDate);
        end.setHours(23, 59, 59, 999);     // 止：当天 23:59:59.999（含全天）
        where[queryDateField] = Between(start, end);
      } else if (startDate) {
        const start = new Date(startDate);
        start.setHours(0, 0, 0, 0);
        where[queryDateField] = Between(start, new Date());  // 只有开始日期：到今天
      } else if (endDate) {
        const end = new Date(endDate);
        end.setHours(23, 59, 59, 999);
        where[queryDateField] = Between(new Date('1900-01-01'), end);  // 只有结束日期：从最早到今天
      }
      
      // 排序：紧急程度优先（紧急>急>一般），同级按录入时间倒序，再按ID倒序
      // 用 queryBuilder 支持自定义排序权重（findAndCount 的 order 不支持 CASE）
      const qb = this.feedbackRepository.createQueryBuilder('feedback');
      if (Object.keys(where).length) {
        qb.where(where);
      }
      // 相关人编码：不勾"查看所有问题"时，当前用户编码与跟进/工程师/反馈人/测试人任一相等即显示
      // 用 andWhere 字符串条件实现 OR 组合（对象式 where 无法表达多字段 OR）
      if (relatedBM) {
        qb.andWhere(
          '(feedback.shishiryBM = :relatedBM OR feedback.xggcsBM = :relatedBM OR feedback.szcsgcsBM = :relatedBM OR feedback.shcsgcsBM = :relatedBM)',
          { relatedBM }
        );
      }
      // 测试返回时间过滤：hasReturn='1' 只查有测试返回时间（测试返回状态）；'0' 查无返回时间（新增未处理）
      if (hasReturn === '1') {
        qb.andWhere('feedback.fanhuisj IS NOT NULL');
      } else if (hasReturn === '0') {
        qb.andWhere('feedback.fanhuisj IS NULL');
      }
      qb.addOrderBy("CASE WHEN feedback.jingjicd = '紧急' THEN 0 WHEN feedback.jingjicd = '急' THEN 1 ELSE 2 END", 'ASC');
      qb.addOrderBy('feedback.lvrusj', 'DESC');
      qb.addOrderBy('feedback.id', 'DESC');
      qb.skip((page - 1) * pageSize).take(pageSize);
      const [list, total] = await qb.getManyAndCount();
      
      const listWithCounts = await this.decorateAttachmentCounts(list);
      return { list: listWithCounts, total };
    } catch (error) {
      console.error('查询列表失败:', error);
      return { list: [], total: 0 };
    }
  }

  // 批量给列表行补充附件计数 imageCount/fileCount：只查 zd_fjxx 表（按 wentiId/lx 分组），不再扫描目录
  private async decorateAttachmentCounts(list: Feedback[]): Promise<Feedback[]> {
    try {
      if (!list || list.length === 0) return list;
      const ids = list.map(f => f.id);
      const imgByWt = new Map<number, number>();
      const fileByWt = new Map<number, number>();
      const records = await this.fjxxRepository.find({
        where: { wentiId: In(ids) },
        select: ['wentiId', 'lx'],
      });
      for (const r of records) {
        if (r.lx === 'image') {
          imgByWt.set(r.wentiId, (imgByWt.get(r.wentiId) || 0) + 1);
        } else {
          fileByWt.set(r.wentiId, (fileByWt.get(r.wentiId) || 0) + 1);
        }
      }
      return list.map((f) => {
        const obj = f as any;
        obj.imageCount = imgByWt.get(f.id) || 0;
        obj.fileCount = fileByWt.get(f.id) || 0;
        return obj;
      });
    } catch (err) {
      console.error('统计附件数失败:', err);
      return list;
    }
  }

  // 当前操作员"我的处理状态"四类计数：待处理/待测试/测试返回/已完成（均排除待讨论）
  // 与我有关：当前用户编码 = 跟进/工程师/反馈人/测试人 任一
  async getStatusCount(currentUser: string): Promise<{ daichuli: number; daiceshi: number; ceshifanhui: number; yiwancheng: number }> {
    const zero = { daichuli: 0, daiceshi: 0, ceshifanhui: 0, yiwancheng: 0 };
    if (!currentUser) return zero;
    try {
      // 单条 SQL 一次统计四类（避免每次轮询 4 次 COUNT 查询）
      const sql = `
        SELECT
          SUM(CASE WHEN (gongchengsbz = 'N' AND shouhoubz = 'N' AND fanhuisj IS NULL) THEN 1 ELSE 0 END) AS daichuli,
          SUM(CASE WHEN (gongchengsbz = 'Y' AND shouhoubz = 'N') THEN 1 ELSE 0 END) AS daiceshi,
          SUM(CASE WHEN (gongchengsbz = 'N' AND shouhoubz = 'N' AND fanhuisj IS NOT NULL) THEN 1 ELSE 0 END) AS ceshifanhui,
          SUM(CASE WHEN (gongchengsbz = 'Y' AND shouhoubz = 'Y') THEN 1 ELSE 0 END) AS yiwancheng
        FROM yw_wentilb
        WHERE (taolunbz IS NULL OR taolunbz = 'N')
          AND (shishiryBM = @0 OR xggcsBM = @0 OR szcsgcsBM = @0 OR shcsgcsBM = @0)`;
      const rows = await this.feedbackRepository.query(sql, [currentUser]);
      const r = rows && rows[0] ? rows[0] : zero;
      return {
        daichuli: Number(r.daichuli) || 0,
        daiceshi: Number(r.daiceshi) || 0,
        ceshifanhui: Number(r.ceshifanhui) || 0,
        yiwancheng: Number(r.yiwancheng) || 0
      };
    } catch (error) {
      console.error('统计处理状态失败:', error);
      return zero;
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

      // 记录状态旧值，用于保存后判断"发生了什么操作"（决定给谁发通知）
      const oldGongchengsbz = feedback.gongchengsbz;
      const oldShouhoubz = feedback.shouhoubz;
      const oldTaolunbz = feedback.taolunbz;
      
      // 直接合并字段并保存（dto 里传了哪个字段就改哪个，没传的不动）
      // 这样处理页只传 {gongchengsbz:'Y'} 就能只改状态位，不影响其它字段
      if (dto.banben !== undefined) feedback.banben = dto.banben;
      if (dto.yiyuanmc || dto.hospital) feedback.yiyuanmc = dto.yiyuanmc || dto.hospital;
      if (dto.shishiry !== undefined) feedback.shishiry = dto.shishiry;
      if (dto.shishiryBM !== undefined) feedback.shishiryBM = dto.shishiryBM;
      if (dto.mokuai || dto.module) feedback.mokuai = dto.mokuai || dto.module;
      if (dto.chuangtimc || dto.form) feedback.chuangtimc = dto.chuangtimc || dto.form;
      if (dto.wentism !== undefined) feedback.wentism = dto.wentism;
      if (dto.shouzhongcs !== undefined) feedback.shouzhongcs = dto.shouzhongcs;
      if (dto.gongcscs !== undefined) feedback.gongcscs = dto.gongcscs;
      if (dto.shouhoucs !== undefined) feedback.shouhoucs = dto.shouhoucs;
      if (dto.shouzhongbz !== undefined) feedback.shouzhongbz = dto.shouzhongbz;
      if (dto.gongchengsbz !== undefined) feedback.gongchengsbz = dto.gongchengsbz;
      if (dto.shouhoubz !== undefined) feedback.shouhoubz = dto.shouhoubz;
      if (dto.xggcs || dto.engineer) feedback.xggcs = dto.xggcs || dto.engineer;
      if (dto.xggcsBM !== undefined) feedback.xggcsBM = dto.xggcsBM;
      if (dto.jingjicd !== undefined) feedback.jingjicd = dto.jingjicd;
      if (dto.wentilx !== undefined) feedback.wentilx = dto.wentilx;
      if (dto.taolunbz !== undefined) feedback.taolunbz = dto.taolunbz;
      if (dto.szcsgcs !== undefined) feedback.szcsgcs = dto.szcsgcs;
      if (dto.szcsgcsBM !== undefined) feedback.szcsgcsBM = dto.szcsgcsBM;
      if (dto.shcsgcs !== undefined) feedback.shcsgcs = dto.shcsgcs;
      if (dto.shcsgcsBM !== undefined) feedback.shcsgcsBM = dto.shcsgcsBM;
      if (dto.cssj !== undefined) feedback.cssj = dto.cssj;
      // 问题返回时间：仅"返回测试"动作显式传 fanhuisj 时才写入/覆盖，避免其它操作误触发
      if (dto.fanhuisj !== undefined) feedback.fanhuisj = dto.fanhuisj;
      
      // 修改时间：仅在"工程师确认处理"(gongchengsbz -> Y) 或"待讨论"(taolunbz -> Y)
      // 这两个状态动作时写入，其它任何更新都不刷新 xgsj
      const isHandleAction = dto.gongchengsbz === 'Y' && oldGongchengsbz !== 'Y';
      const isTaolunAction = dto.taolunbz === 'Y' && oldTaolunbz !== 'Y';
      if (isHandleAction || isTaolunAction) feedback.xgsj = new Date();
      
      const saved = await this.feedbackRepository.save(feedback);
      console.log('更新成功 ID:', saved.id);

      // ===== 事件通知：根据状态变化判断"发生了什么"，通知对应的人（接收人是操作人本人不提示） =====
      try {
        // 场景1：处理确认（工程师处理完成 gongchengsbz: N -> Y）→ 通知跟进人 + 反馈人
        if (dto.gongchengsbz === 'Y' && oldGongchengsbz === 'N') {
          const nr = `【已处理#${saved.id}】${saved.yiyuanmc || ''} ${saved.mokuai || ''}：${(saved.gongcscs || saved.wentism || '').slice(0, 50)}`;
          if (saved.shishiryBM) await this.addTzxx(saved.id, '处理', saved.shishiryBM, nr, saved.xggcsBM);
          if (saved.szcsgcsBM) await this.addTzxx(saved.id, '处理', saved.szcsgcsBM, nr, saved.xggcsBM);
        }
        // 场景2：测试确认（测试通过 shouhoubz: -> Y）→ 通知反馈人 + 工程师 + 跟进人
        else if (dto.shouhoubz === 'Y' && oldShouhoubz !== 'Y') {
          const nr = `【测试通过#${saved.id}】${saved.yiyuanmc || ''} ${saved.mokuai || ''}：${(saved.shouhoucs || '').slice(0, 50)}`;
          if (saved.szcsgcsBM) await this.addTzxx(saved.id, '测试', saved.szcsgcsBM, nr, saved.shcsgcsBM);
          if (saved.xggcsBM) await this.addTzxx(saved.id, '测试', saved.xggcsBM, nr, saved.shcsgcsBM);
          if (saved.shishiryBM) await this.addTzxx(saved.id, '测试', saved.shishiryBM, nr, saved.shcsgcsBM);
        }
        // 场景3：返回测试（测试不过退回工程师 gongchengsbz: Y -> N）→ 通知工程师 + 反馈人
        else if (dto.gongchengsbz === 'N' && oldGongchengsbz === 'Y') {
          const nr = `【测试返回#${saved.id}】${saved.yiyuanmc || ''} ${saved.mokuai || ''}：${(saved.shouhoucs || '').slice(0, 50)}`;
          if (saved.xggcsBM) await this.addTzxx(saved.id, '返回', saved.xggcsBM, nr, saved.shcsgcsBM);
          if (saved.szcsgcsBM) await this.addTzxx(saved.id, '返回', saved.szcsgcsBM, nr, saved.shcsgcsBM);
        }
      } catch (error) {
        console.error('写通知失败:', error);
      }

      this.notifyStatusChanged();
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
      this.notifyStatusChanged();
    }
  }

  // 批量删除
  async batchRemove(ids: number[]): Promise<void> {
    for (const id of ids) {
      await this.remove(id);
    }
  }

  // 获取问题附件列表（图片/视频/文档等：按 {id}-{序号}.{扩展名} 命名，在 uploads 目录下直接查找）
    // 获取问题附件列表（图片/视频/文档等）——只查 zd_fjxx（lx='image'），不再扫描目录
  async getImagesById(id: number): Promise<{ filename: string; name: string; seq: number; uploadUser: string; uploadName: string; lrsj: Date }[]> {
    try {
      const records = await this.fjxxRepository.find({
        where: { wentiId: id, lx: 'image' },
        order: { seq: 'ASC' },
      });
      return records.map(r => ({
        filename: r.filename,
        name: r.baseName || r.filename,
        seq: r.seq || 0,
        uploadUser: r.uploadUser || '',
        uploadName: r.uploadName || '',
        lrsj: r.lrsj,
      }));
    } catch (err) {
      console.error('查询图片表失败:', err);
      return [];
    }
  }

  // 删除问题图片目录
    // 删除问题图片目录 + zd_fjxx 图片记录（增删改同步表）
  async deleteImagesById(id: number): Promise<void> {
    const uploadPath = this.configService.getUploadPath();
    const uploadDir = path.isAbsolute(uploadPath) ? uploadPath : path.join(process.cwd(), uploadPath);
    if (fs.existsSync(uploadDir)) {
      const files = fs.readdirSync(uploadDir).filter(f => f.startsWith(`${id}-`));
      for (const file of files) {
        fs.unlinkSync(path.join(uploadDir, file));
      }
    }
    try {
      await this.fjxxRepository.delete({ wentiId: id, lx: 'image' });
    } catch (err) {
      console.error('删除图片记录失败:', err);
    }
  }

  // 获取问题文件附件列表（问题处理页上传：{id}-{序号}#{原文件名}）
  // 优先查 zd_fjxx 表（含上传者信息）；表里没有该问题时回退扫描目录（兼容未初始化场景）
  // 返回 [{ filename, name, seq, uploadUser, uploadName, lrsj }]
    // 获取问题文件附件列表（问题处理页上传）——只查 zd_fjxx（lx!=='image'），不再扫描目录
  // 返回 [{ filename, name, seq, uploadUser, uploadName, lrsj }]
  async getFilesById(id: number): Promise<{ filename: string; name: string; seq: number; uploadUser: string; uploadName: string; lrsj: Date }[]> {
    try {
      const records = await this.fjxxRepository.find({
        where: { wentiId: id },
        order: { seq: 'ASC' },
      });
      return records
        .filter(r => r.lx !== 'image')  // 文件附件：lx='file' 或老数据 NULL
        .map(r => ({
          filename: r.filename,
          name: r.baseName || r.filename,
          seq: r.seq || 0,
          uploadUser: r.uploadUser || '',
          uploadName: r.uploadName || '',
          lrsj: r.lrsj,
        }));
    } catch (err) {
      console.error('查询附件表失败:', err);
      return [];
    }
  }

  // 上传附件成功后写入 zd_fjxx 记录（含上传者编码/姓名）
  async saveFileRecord(wentiId: number, filename: string, baseName: string, seq: number, uploadUser: string, uploadName: string, lx: string = 'file'): Promise<void> {
    try {
      await this.fjxxRepository.save(this.fjxxRepository.create({
        wentiId, filename, baseName, seq,
        uploadUser: uploadUser || null,
        uploadName: uploadName || null,
        lrsj: new Date(),
        lx: lx || 'file',
      }));
    } catch (err) {
      console.error('写入附件记录失败:', err);
    }
  }

  // 按磁盘文件名查附件记录（删除时校验上传者）
  async findFileRecord(filename: string): Promise<Fjxx | null> {
    try {
      return await this.fjxxRepository.findOne({ where: { filename } });
    } catch (err) {
      console.error('查询附件记录失败:', err);
      return null;
    }
  }

  // 删除附件记录（删文件成功后调用）
  async deleteFileRecord(filename: string): Promise<void> {
    try {
      await this.fjxxRepository.delete({ filename });
    } catch (err) {
      console.error('删除附件记录失败:', err);
    }
  }

  // ===== 事件通知查询 =====
  // 前端每10秒轮询"我的未读通知"：新增/处理/测试/返回 四类事件写入 xt_tzxx，接收人=本人且未读的返回
  // 注意：全部按用户编码（jsrbm）过滤，与姓名无关
  async getReminderCount(currentUser: string): Promise<{ list: Tzxx[]; count: number }> {
    try {
      if (!currentUser) return { list: [], count: 0 };
      const list = await this.tzxxRepository.find({
        where: { jsrbm: currentUser, ydsj: null },
        order: { lrsj: 'DESC' },
        take: 50
      });
      return { list, count: list.length };
    } catch (error) {
      console.error('获取提醒失败:', error);
      return { list: [], count: 0 };
    }
  }

  // 标记单条通知已读
  async markTzxxRead(id: number): Promise<void> {
    const t = await this.tzxxRepository.findOne({ where: { id } });
    if (t) {
      t.ydsj = new Date();
      await this.tzxxRepository.save(t);
    }
  }

  // 标记当前用户全部通知已读
  async markAllRead(currentUser: string): Promise<void> {
    if (!currentUser) return;
    await this.tzxxRepository.update({ jsrbm: currentUser, ydsj: null }, { ydsj: new Date() });
  }
}
