import { Controller, Get, Post, Put, Delete, Body, Param, Query, ParseIntPipe, UseInterceptors, UploadedFile, Res } from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';
import { extname } from 'path';
import * as fs from 'fs';
import { FeedbackService } from './feedback.service';
import { CreateFeedbackDto, UpdateFeedbackDto, QueryFeedbackDto } from './dto/feedback.dto';

// 问题反馈控制器
// 访问路径前缀：/api/feedback
@Controller('feedback')
export class FeedbackController {
  constructor(private readonly feedbackService: FeedbackService) {}

  // 获取下一个流水号
  // GET /api/feedback/getLsh
  @Get('getLsh')
  getLsh() {
    return this.feedbackService.getNextLsh();
  }

  // 上传图片
  // POST /api/feedback/upload
  // @UseInterceptors(FileInterceptor) - 文件上传拦截器，类似于 VB6 的 FileUpload 控件
  @Post('upload')
  @UseInterceptors(FileInterceptor('file', {
    storage: diskStorage({
      destination: './uploads',  // 上传文件保存目录
      filename: (req, file, cb) => {
        cb(null, file.originalname);  // 使用原文件名
      },
    }),
  }))
  upload(@UploadedFile() file: any, @Body() body: any) {
    const feedbackId = body?.feedbackId || 'temp';
    const ext = extname(file.originalname);
    const newFilename = `${feedbackId}${ext}`;
    const oldPath = file.path;
    const newPath = `./uploads/${newFilename}`;
    if (fs.existsSync(oldPath)) {
      fs.renameSync(oldPath, newPath);
    }
    return { url: `/feedback/uploads/${newFilename}`, filename: newFilename };
  }

  // 获取问题反馈的所有图片
  // GET /api/feedback/images/:feedbackId
  @Get('images/:feedbackId')
  getImages(@Param('feedbackId') feedbackId: string) {
    const images: string[] = [];
    const files = fs.readdirSync('./uploads');
    for (const file of files) {
      if (file.startsWith(feedbackId + '-')) {
        images.push(file);
      }
    }
    return images.sort();
  }

  // 删除问题反馈的所有图片
  // DELETE /api/feedback/images/:feedbackId
  @Delete('images/:feedbackId')
  deleteImages(@Param('feedbackId') feedbackId: string) {
    try {
      const files = fs.readdirSync('./uploads');
      for (const file of files) {
        if (file.startsWith(feedbackId + '-')) {
          fs.unlinkSync('./uploads/' + file);
        }
      }
      return { success: true };
    } catch (err) {
      return { success: false, error: err };
    }
  }

  // 删除单张图片
  // DELETE /api/feedback/image/:filename
  @Delete('image/:filename')
  deleteImage(@Param('filename') filename: string) {
    try {
      const filePath = './uploads/' + filename;
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
    const filePath = `./uploads/${filename}`;
    if (fs.existsSync(filePath)) {
      return res.sendFile(filename, { root: './uploads' });
    }
    return res.status(404).send('File not found');
  }

  // 分配开发人员（待实现）
  // PUT /api/feedback/:id/assign-dev
  @Put(':id/assign-dev')
  assignDev(@Param('id', ParseIntPipe) id: number, @Body() body: { developer: string }) {
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
}