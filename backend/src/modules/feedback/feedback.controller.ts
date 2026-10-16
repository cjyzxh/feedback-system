import { Controller, Get, Post, Put, Delete, Body, Param, Query, ParseIntPipe, UseInterceptors, UploadedFile, Res, Sse } from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';
import { extname, join } from 'path';
import * as fs from 'fs';
import { FeedbackService } from './feedback.service';
import { CreateFeedbackDto, UpdateFeedbackDto, QueryFeedbackDto } from './dto/feedback.dto';
import { DatabaseConfigService } from '../config/config.service';
import { isVideoFile, probeVideoCodec, transcodeToH264 } from '../../common/ffmpeg.util';

// 全局上传路径变量，应用启动时初始化
let globalUploadPath = './uploads';
let globalFileUploadPath = './file-uploads';

// 修复 multer 中文文件名乱码：busboy 默认按 latin1 解码 filename，
// 中文名（UTF-8 字节）会被显示成 è¯¥ 这类乱码，需还原回 UTF-8。
// 若文件名本身已是正常 UTF-8（含非 latin1 字符），则原样返回。
function fixOriginalName(name: string): string {
  let hasHigh = false;
  for (let i = 0; i < name.length; i++) {
    if (name.charCodeAt(i) > 255) { hasHigh = true; break; }
  }
  if (hasHigh) return name;
  try {
    const fixed = Buffer.from(name, 'latin1').toString('utf8');
    // 还原后出现替换符（U+FFFD）说明并非 latin1 误读，保持原名
    if (fixed.includes('\uFFFD')) return name;
    return fixed;
  } catch {
    return name;
  }
}

// 控制器（类比 VB6 的窗体事件过程：前端请求 -> 这里接 -> 调 Service 处理）
// @Controller('feedback') = 本控制器所有路由都以 /api/feedback 开头
// 注意路由声明顺序有讲究：具体路径（upload/images/reminder）要放在
// ':id' 通配路径前面，否则 ':id' 会把 upload 当成 id 吞掉
@Controller('feedback')
export class FeedbackController {
  constructor(
    private readonly feedbackService: FeedbackService,
    private configService: DatabaseConfigService,
  ) {
    // 构造函数中初始化上传路径
    globalUploadPath = this.configService.getUploadPath();
    globalFileUploadPath = this.configService.getFileUploadPath();
  }

  // 上传图片（POST /api/feedback/upload）
  // FileInterceptor = multer 中间件，自动接收 multipart/form-data 里的 file 文件
  // 先存到临时文件，下面再改名成 {id}-{序号}.{扩展名} 的正式命名
  @Post('upload')
  @UseInterceptors(FileInterceptor('file', {
    storage: diskStorage({
      destination: (req, file, cb) => {
        // 确保目录存在（上传目录可在系统设置里自定义）
        if (!fs.existsSync(globalUploadPath)) {
          fs.mkdirSync(globalUploadPath, { recursive: true });
        }
        cb(null, globalUploadPath);
      },
      filename: (req, file, cb) => {
        cb(null, file.originalname);  // 先按原名落盘，下面再改名
      },
    }),
  }))
  async upload(@UploadedFile() file: any, @Body() body: any) {
    // 每次上传时重新读取配置，确保路径是最新的
    globalUploadPath = this.configService.getUploadPath();
    
    const id = parseInt(body?.id) || parseInt(body?.feedbackId) || 0;
    const tpnum = parseInt(body?.tpnum) || 1;
    
    const ext = extname(file.originalname);
    const filename = `${id}-${tpnum}${ext}`;
    const oldPath = file.path;
    const newPath = join(globalUploadPath, filename);
    
    if (fs.existsSync(oldPath)) {
      fs.renameSync(oldPath, newPath);
    }
    
    // ============ 视频自动转码：非 H.264 编码统一转成 H.264+AAC 的 mp4 ============
    // 浏览器只支持 H.264/VP9/AV1 等编码的画面，MPEG-4/H.265 等会出现"只有声音没有图像"
    let finalName = filename;
    if (isVideoFile(file.originalname)) {
      let tmpOut = '';
      try {
        const codec = await probeVideoCodec(newPath);
        if (codec && codec !== 'h264') {
          tmpOut = `${newPath}.tmp.mp4`;
          await transcodeToH264(newPath, tmpOut);
          if (fs.existsSync(tmpOut)) {
            fs.unlinkSync(newPath);  // 删除原编码文件
            finalName = `${id}-${tpnum}.mp4`;
            fs.renameSync(tmpOut, join(globalUploadPath, finalName));
            console.log(`视频自动转码完成: ${filename} (${codec}) -> ${finalName} (h264)`);
          }
        } else if (!codec) {
          console.log('视频编码探测失败，跳过转码:', filename);
        }
      } catch (e) {
        // 转码失败不阻断上传：保留原文件，前端会提示"视频编码不支持"
        console.error('视频转码失败:', filename, e?.message || e);
        if (tmpOut && fs.existsSync(tmpOut)) {
          try { fs.unlinkSync(tmpOut); } catch { /* 忽略清理失败 */ }
        }
      }
    }
    
    // 写入附件信息表（图片也统一入库，lx='image'；查询/删除走数据库，增删改同步）
    if (id > 0) {
      const uploadUser = body?.uploadUser || '';
      const uploadName = body?.uploadName || '';
      try {
        await this.feedbackService.saveFileRecord(id, finalName, file.originalname, tpnum, uploadUser, uploadName, 'image');
      } catch (err) {
        // 图片已落盘，写库失败仅记录日志（不破坏图片上传返回契约）
        console.error('写入图片附件记录失败:', err);
      }
    }

    return { url: `/feedback/uploads/${finalName}`, filename: finalName };
  }

  // ============ 问题处理页文件附件（与图片分开存储） ============
  // 文件名规则：{id}-{序号}#{原文件名}（# 后保留原文件名，便于列表展示；序号从 # 前解析）

  // 上传文件附件（POST /api/feedback/upload-file）
  @Post('upload-file')
  @UseInterceptors(FileInterceptor('file', {
    storage: diskStorage({
      destination: (req, file, cb) => {
        if (!fs.existsSync(globalFileUploadPath)) {
          fs.mkdirSync(globalFileUploadPath, { recursive: true });
        }
        cb(null, globalFileUploadPath);
      },
      filename: (req, file, cb) => {
        cb(null, file.originalname);  // 先按原名落盘，下面再改名
      },
    }),
  }))
  async uploadFile(@UploadedFile() file: any, @Body() body: any) {
    // 每次上传时重新读取配置，确保路径是最新的
    globalFileUploadPath = this.configService.getFileUploadPath();
    const id = parseInt(body?.id) || parseInt(body?.feedbackId) || 0;
    const tpnum = parseInt(body?.tpnum) || 1;
    if (!id) return { success: false, error: '缺少问题ID' };

    // 清洗原文件名：只取文件名（去路径），修复中文乱码，替换 # ? * < > | " : \ / 等非法字符，限制长度
    let baseName = file.originalname.replace(/^.*[\\/]/, '');
    baseName = fixOriginalName(baseName);
    baseName = baseName.replace(/[#?*<>|":\\/]/g, '_');
    if (baseName.length > 80) {
      const dotIdx = baseName.lastIndexOf('.');
      if (dotIdx > 0) baseName = baseName.substring(0, 60) + baseName.substring(dotIdx);
      else baseName = baseName.substring(0, 80);
    }

    const filename = `${id}-${tpnum}#${baseName}`;
    const oldPath = file.path;
    const newPath = join(globalFileUploadPath, filename);
    if (fs.existsSync(oldPath)) {
      fs.renameSync(oldPath, newPath);
    }

    // 写入附件信息表（记录上传者编码/姓名，前端从登录态带过来）
    const uploadUser = body?.uploadUser || '';
    const uploadName = body?.uploadName || '';
    try {
      await this.feedbackService.saveFileRecord(id, filename, baseName, tpnum, uploadUser, uploadName);
    } catch (err) {
      console.error('写入附件记录失败:', err);
      return { success: false, error: '附件信息写入失败，请重试' };
    }

    return { success: true, url: `/feedback/file-uploads/${encodeURIComponent(filename)}`, filename, name: baseName };
  }

  // 获取问题文件附件列表（GET /api/feedback/files/:id）
  @Get('files/:id')
  async getFiles(@Param('id') id: string) {
    return this.feedbackService.getFilesById(parseInt(id));
  }

  // 删除单个文件附件（DELETE /api/feedback/file/:filename）
  // 权限：仅上传者本人可删（管理员也不例外的）；老数据无上传者 → 拒绝删除
  @Delete('file/:filename')
  async deleteFile(@Param('filename') filename: string, @Body() body: any) {
    try {
      const fileUploadPath = this.configService.getFileUploadPath();
      const filePath = join(fileUploadPath, filename);

      // 权限校验：查 zd_fjxx 记录，比对当前用户编码
      const currentUser = body?.currentUser || '';
      const record = await this.feedbackService.findFileRecord(filename);
      if (record) {
        if (!record.uploadUser) {
          return { success: false, error: '该附件无上传者信息，不允许删除' };
        }
        if (record.uploadUser !== currentUser) {
          return { success: false, error: '仅上传者本人可删除该附件' };
        }
      } else {
        // 表里没有记录（未初始化）→ 视为老附件，无上传者信息，不允许删除
        return { success: false, error: '该附件无上传者信息，不允许删除' };
      }

      if (fs.existsSync(filePath)) {
        fs.unlinkSync(filePath);
        await this.feedbackService.deleteFileRecord(filename);
        return { success: true };
      }
      return { success: false, error: 'file not found' };
    } catch (err) {
      return { success: false, error: err };
    }
  }

  // 访问/下载文件附件（GET /api/feedback/file-uploads/:filename）
  @Get('file-uploads/:filename')
  getFileAttachment(@Param('filename') filename: string, @Res() res: any) {
    const fileUploadPath = this.configService.getFileUploadPath();
    const filePath = join(fileUploadPath, filename);
    if (fs.existsSync(filePath)) {
      return res.sendFile(filename, { root: fileUploadPath });
    }
    return res.status(404).send('File not found');
  }

  // 获取问题的所有图片 - 从目录中检索
  // GET /api/feedback/images/:id
  @Get('images/:id')
  async getImages(@Param('id') id: string) {
    const images = await this.feedbackService.getImagesById(parseInt(id));
    return images;
  }

  // 删除问题的所有图片
  // DELETE /api/feedback/images/:id
  @Delete('images/:id')
  async deleteImages(@Param('id') id: string) {
    await this.feedbackService.deleteImagesById(parseInt(id));
    return { success: true };
  }

  // 删除单张图片
  // DELETE /api/feedback/image/:filename
  // 权限：仅上传者本人可删（与文件附件一致）；老数据无上传者 → 拒绝删除
  @Delete('image/:filename')
  async deleteImage(@Param('filename') filename: string, @Body() body: any) {
    try {
      // 权限校验：查 zd_fjxx 记录，比对当前用户编码
      const currentUser = body?.currentUser || '';
      const record = await this.feedbackService.findFileRecord(filename);
      if (record) {
        if (!record.uploadUser) {
          return { success: false, error: '该图片无上传者信息，不允许删除' };
        }
        if (record.uploadUser !== currentUser) {
          return { success: false, error: '仅上传者本人可删除该图片' };
        }
      } else {
        // 表里没有记录 → 视为老图片，无上传者信息，不允许删除
        return { success: false, error: '该图片无上传者信息，不允许删除' };
      }

      const uploadPath = this.configService.getUploadPath();
      const filePath = join(uploadPath, filename);
      if (fs.existsSync(filePath)) {
        fs.unlinkSync(filePath);
        await this.feedbackService.deleteFileRecord(filename);  // 同步删除 zd_fjxx 记录
        return { success: true };
      }
      return { success: false, error: 'file not found' };
    } catch (err) {
      return { success: false, error: err };
    }
  }

  // 访问上传的图片文件
  // GET /api/feedback/uploads/:filename
  @Get('uploads/:filename')
  getFile(@Param('filename') filename: string, @Res() res: any) {
    const uploadPath = this.configService.getUploadPath();
    const filePath = join(uploadPath, filename);
    if (fs.existsSync(filePath)) {
      return res.sendFile(filename, { root: uploadPath });
    }
    return res.status(404).send('File not found');
  }

  // 分配开发人员
  // PUT /api/feedback/:id/assign-dev
  // 支持可选传 gongcscs（处理意见）和 shouzhongcs（追加到测试说明）：分配修改人时若意见框已填写则一并保存
  @Put(':id/assign-dev')
  async assignDev(@Param('id', ParseIntPipe) id: number, @Body() body: { xggcs: string; xggcsBM?: string; gongcscs?: string; shouzhongcs?: string }) {
    const patch: any = { xggcs: body.xggcs };
    if (body.xggcsBM !== undefined) patch.xggcsBM = body.xggcsBM;
    if (body.gongcscs !== undefined) patch.gongcscs = body.gongcscs;
    if (body.shouzhongcs !== undefined) patch.shouzhongcs = body.shouzhongcs;
    const data = await this.feedbackService.update(id, patch);
    return { code: 200, message: '分配成功', data };
  }

  // ========== CRUD 基础接口 ==========

  // 创建问题反馈
  // POST /api/feedback
  @Post()
  async create(@Body() createFeedbackDto: CreateFeedbackDto) {
    const data = await this.feedbackService.create(createFeedbackDto);
    return { code: 200, message: '创建成功', data };
  }

  // 查询问题反馈列表（支持分页、搜索）
  // GET /api/feedback
  @Get()
  async findAll(@Query() query: QueryFeedbackDto) {
    const data = await this.feedbackService.findAll(query);
    return { code: 200, message: '查询成功', data };
  }

  // 查询单个问题反馈详情
  // GET /api/feedback/:id
  @Get('status-count')
  async getStatusCount(@Query('currentUser') currentUser: string) {
    return { data: await this.feedbackService.getStatusCount(currentUser) };
  }

  // SSE 推送：主业务表增删改时，前端 EventSource 收到变更信号即刷新处理状态统计
  @Sse('status-stream')
  streamStatus() {
    return this.feedbackService.statusSubject.asObservable();
  }

  @Get(':id')
  async findOne(@Param('id', ParseIntPipe) id: number) {
    const data = await this.feedbackService.findById(id);
    return { code: 200, message: '查询成功', data };
  }

  // 更新问题反馈
  // PUT /api/feedback/:id
  @Put(':id')
  async update(@Param('id', ParseIntPipe) id: number, @Body() updateFeedbackDto: UpdateFeedbackDto) {
    const data = await this.feedbackService.update(id, updateFeedbackDto);
    return { code: 200, message: '更新成功', data };
  }

  // 删除单个问题反馈
  // DELETE /api/feedback/:id
  @Delete(':id')
  async remove(@Param('id', ParseIntPipe) id: number) {
    await this.feedbackService.remove(id);
    return { code: 200, message: '删除成功', data: null };
  }

  // 批量删除问题反馈
  // POST /api/feedback/batch-delete
  @Post('batch-delete')
  async batchRemove(@Body() body: { ids: number[] }) {
    await this.feedbackService.batchRemove(body.ids);
    return { code: 200, message: '删除成功', data: null };
  }

  // 登录提醒：返回与本人有关的四类存量（待处理/已返回/待测试/待讨论），弹一次即止
  // GET /api/feedback/reminder/login?userCode=用户编码
  @Get('reminder/login')
  async getLoginReminders(@Query('userCode') userCode: string) {
    const data = await this.feedbackService.getLoginReminders(userCode);
    return { code: 200, message: '查询成功', data };
  }
}
