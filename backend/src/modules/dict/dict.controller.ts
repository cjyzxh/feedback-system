import { Controller, Get, Post, Put, Delete, Body, Query, Param, NotFoundException, Logger } from '@nestjs/common';
import { DictService } from './dict.service';

@Controller("dict")
export class DictController {
  private readonly logger = new Logger(DictController.name);

  constructor(private readonly dictService: DictService) {}

  @Get("hospitals")
  getHospitals(@Query('keyword') keyword: string) {
    return this.wrapResponse(this.dictService.getHospitals(keyword));
  }

  @Get("modules")
  getModules() {
    return this.wrapResponse(this.dictService.getModules());
  }

  @Post("modules")
  createModule(@Body() moduleData: { banben: string; mokuaimc: string }) {
    return this.wrapResponse(this.dictService.createModule(moduleData));
  }

  @Put("modules/:id")
  updateModule(@Param('id') id: number, @Body() moduleData: { banben: string; mokuaimc: string }) {
    return this.wrapResponse(this.dictService.updateModule(id, moduleData));
  }

  @Delete("modules/:id")
  deleteModule(@Param('id') id: number) {
    return this.wrapResponse(this.dictService.deleteModule(id));
  }

  @Get("forms")
  getForms(@Query('module') module: string) {
    this.logger.log('getForms called with module: ' + module);
    return this.wrapResponse(this.dictService.getForms(module));
  }

  @Post("forms")
  createForm(@Body() formData: { mokuai: string; chuangtimc: string }) {
    return this.wrapResponse(this.dictService.createForm(formData));
  }

  @Put("forms/:id")
  updateForm(@Param('id') id: number, @Body() formData: { mokuai: string; chuangtimc: string }) {
    return this.wrapResponse(this.dictService.updateForm(id, formData));
  }

  @Delete("forms/:id")
  deleteForm(@Param('id') id: number) {
    return this.wrapResponse(this.dictService.deleteForm(id));
  }

  @Get("engineers")
  getEngineers() {
    return this.wrapResponse(this.dictService.getEngineers());
  }

  @Get("shishi")
  getShishi() {
    return this.wrapResponse(this.dictService.getShishi());
  }

  @Get("yanfa")
  getYanfa() {
    return this.wrapResponse(this.dictService.getYanfa());
  }

  @Get("versions")
  getVersions() {
    return this.wrapResponse(this.dictService.getVersions());
  }

  @Get("templates")
  getTemplates() {
    return this.wrapResponse(this.dictService.getTemplates());
  }

  private async wrapResponse<T>(dataPromise: Promise<T>): Promise<{ code: number; data: T; message?: string }> {
    try {
      const data = await dataPromise;
      return { code: 200, data, message: "Success" };
    } catch (error) {
      throw new NotFoundException("数据获取失败");
    }
  }
}