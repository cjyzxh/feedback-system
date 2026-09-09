import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Like, Between } from 'typeorm';
import * as fs from 'fs';
import * as path from 'path';
import { Feedback } from './feedback.entity';
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
    private configService: DatabaseConfigService,  // 读上传目录配置等
  ) {}

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
      return saved;
    } catch (error) {
      console.error('创建失败:', error);
      throw error;
    }
  }

  // 分页查询问题列表
  async findAll(query: QueryFeedbackDto): Promise<{ list: Feedback[]; total: number }> {
    try {
      const { page = 1, pageSize = 10, keyword, hospital, yiyuanmc, module, mokuai, shishiry, xggcs, engineer, shishiryBM, xggcsBM, gongchengsbz, shouhoubz, taolunbz, zhuangtai, startDate, endDate, id, dateField } = query;
      
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
      qb.addOrderBy("CASE WHEN feedback.jingjicd = '紧急' THEN 0 WHEN feedback.jingjicd = '急' THEN 1 ELSE 2 END", 'ASC');
      qb.addOrderBy('feedback.lvrusj', 'DESC');
      qb.addOrderBy('feedback.id', 'DESC');
      qb.skip((page - 1) * pageSize).take(pageSize);
      const [list, total] = await qb.getManyAndCount();
      
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
      if (dto.taolunbz !== undefined) feedback.taolunbz = dto.taolunbz;
      if (dto.szcsgcs !== undefined) feedback.szcsgcs = dto.szcsgcs;
      if (dto.szcsgcsBM !== undefined) feedback.szcsgcsBM = dto.szcsgcsBM;
      if (dto.shcsgcs !== undefined) feedback.shcsgcs = dto.shcsgcs;
      if (dto.shcsgcsBM !== undefined) feedback.shcsgcsBM = dto.shcsgcsBM;
      if (dto.cssj !== undefined) feedback.cssj = dto.cssj;
      
      feedback.xgsj = new Date();  // 每次更新自动刷新"修改时间"
      
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

  // 获取问题附件列表（图片/视频/文档等：按 {id}-{序号}.{扩展名} 命名，在 uploads 目录下直接查找）
  async getImagesById(id: number): Promise<string[]> {
    const uploadPath = this.configService.getUploadPath();
    const uploadDir = path.isAbsolute(uploadPath) ? uploadPath : path.join(process.cwd(), uploadPath);
    if (!fs.existsSync(uploadDir)) {
      return [];
    }
    return fs.readdirSync(uploadDir).filter(f => f.startsWith(`${id}-`));
  }

  // 删除问题图片目录
  async deleteImagesById(id: number): Promise<void> {
    const uploadPath = this.configService.getUploadPath();
    const uploadDir = path.isAbsolute(uploadPath) ? uploadPath : path.join(process.cwd(), uploadPath);
    if (fs.existsSync(uploadDir)) {
      const files = fs.readdirSync(uploadDir).filter(f => f.startsWith(`${id}-`));
      for (const file of files) {
        fs.unlinkSync(path.join(uploadDir, file));
      }
    }
  }

  // 获取待处理/待测试/测试返回问题数量（前端每10秒轮询一次，右下角弹提醒用）
  // 三种提醒：
  //   待处理(pending)   : 分给当前工程师处理的问题
  //   待测试(test)      : 分给当前操作员测试的问题
  //   测试返回(returned): 测试不过退回工程师的问题（红色特别提醒）
  async getReminderCount(currentUser: string): Promise<{ pendingCount: number; testCount: number; returnedCount: number; pendingList: any[]; testList: any[]; returnedList: any[] }> {
    try {
      // 待处理问题：gongchengsbz='N' 且 xggcs=当前登录者（我的待办）
      const pendingList = await this.feedbackRepository.find({
        where: { gongchengsbz: 'N', xggcsBM: currentUser },
        order: { lvrusj: 'DESC' },
        take: 10
      });

      // 待测试问题：gongchengsbz='Y' 且 shouhoubz='N' 且 shishiry=当前登录者
      const testList = await this.feedbackRepository.find({
        where: { gongchengsbz: 'Y', shouhoubz: 'N', shishiryBM: currentUser },
        order: { xgsj: 'DESC' },
        take: 10
      });

      // 测试后返回的问题：从待处理里再筛出"被测试打回过"的
      // 判断依据：有测试结果(shouhoucs) 或 有测试时间(cssj) 或 有测试人(shcsgcs)
      // 这类问题需要红色特别提醒
      const returnedList = pendingList.filter((item: any) => {
        return (item.shouhoucs && item.shouhoucs.trim() !== '') || 
               (item.cssj && item.cssj !== null) ||
               (item.shcsgcs && item.shcsgcs.trim() !== '');
      }).slice(0, 5);

      return {
        pendingCount: pendingList.length,
        testCount: testList.length,
        returnedCount: returnedList.length,
        pendingList,
        testList,
        returnedList
      };
    } catch (error) {
      console.error('获取提醒数量失败:', error);
      return { pendingCount: 0, testCount: 0, returnedCount: 0, pendingList: [], testList: [], returnedList: [] };
    }
  }
}
