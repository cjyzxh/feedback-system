import { Controller, Get, Post, Put, Delete, Body, Param, Query, ParseIntPipe, UseInterceptors, UploadedFile, Res } from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';
import { extname, join } from 'path';
import * as fs from 'fs';
import { FeedbackService } from './feedback.service';
import { CreateFeedbackDto, UpdateFeedbackDto, QueryFeedbackDto } from './dto/feedback.dto';
import { DatabaseConfigService } from '../config/config.service';

// 全局上传路径变量，应用启动时初始化
let globalUploadPath = './uploads';

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
    
    return { url: `/feedback/uploads/${filename}`, filename: filename };
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
  @Delete('image/:filename')
  async deleteImage(@Param('filename') filename: string) {
    try {
      const uploadPath = this.configService.getUploadPath();
      const filePath = join(uploadPath, filename);
      if (fs.existsSync(filePath)) {
        fs.unlinkSync(filePath);
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
  // 同时支持可选传 gongcscs（处理意见）：分配修改人时若上方意见框已填写则一并保存
  @Put(':id/assign-dev')
  async assignDev(@Param('id', ParseIntPipe) id: number, @Body() body: { xggcs: string; gongcscs?: string }) {
    const patch: any = { xggcs: body.xggcs };
    if (body.gongcscs !== undefined) patch.gongcscs = body.gongcscs;
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

  // 获取待处理和待测试问题数量（用于消息提醒）
  // GET /api/feedback/reminder/count?currentUser=xxx
  @Get('reminder/count')
  async getReminderCount(@Query('currentUser') currentUser: string) {
    const data = await this.feedbackService.getReminderCount(currentUser);
    return { code: 200, message: '查询成功', data };
  }
}
