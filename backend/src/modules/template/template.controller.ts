import { Controller, Get, Post, Put, Delete, Body, Query, Param, NotFoundException } from '@nestjs/common';
import { TemplateService } from './template.service';

@Controller('template')
export class TemplateController {
  constructor(private readonly templateService: TemplateService) {}

  // 维护页列表：/api/template?lx=处理意见&fw=个人&currentUser=xxx
  @Get()
  getList(@Query('lx') lx: string, @Query('fw') fw: string, @Query('currentUser') currentUser: string) {
    return this.wrap(this.templateService.getList(lx, fw, currentUser));
  }

  // 弹窗加载：/api/template/options?lx=处理意见&currentUser=xxx
  @Get('options')
  getOptions(@Query('lx') lx: string, @Query('currentUser') currentUser: string) {
    return this.wrap(this.templateService.getOptions(lx, currentUser));
  }

  // 保存：POST /api/template  body: { lx, fw, nr, currentUser, currentUserName }
  @Post()
  create(@Body() body: { lx: string; fw: string; nr: string; currentUser: string; currentUserName?: string }) {
    return this.wrap(this.templateService.create(body));
  }

  // 更新：PUT /api/template/:id  body: { nr, currentUser }
  @Put(':id')
  update(@Param('id') id: number, @Body() body: { nr: string; currentUser: string }) {
    return this.wrap(this.templateService.update(Number(id), body));
  }

  // 删除：DELETE /api/template/:id?currentUser=xxx
  @Delete(':id')
  remove(@Param('id') id: number, @Query('currentUser') currentUser: string) {
    return this.wrap(this.templateService.remove(Number(id), currentUser));
  }

  private async wrap<T>(dataPromise: Promise<T>): Promise<{ code: number; data: T; message?: string }> {
    try {
      const data = await dataPromise;
      return { code: 200, data, message: 'Success' };
    } catch (error) {
      if (error instanceof Error) {
        throw new NotFoundException(error.message);
      }
      throw new NotFoundException('操作失败');
    }
  }
}
