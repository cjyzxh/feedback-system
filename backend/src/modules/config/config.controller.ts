import { Controller, Get, Post, Body, Query, Logger } from '@nestjs/common';
import { DatabaseConfigService } from './config.service';
import * as path from 'path';
import * as fs from 'fs';

@Controller('config')
export class ConfigController {
  private logger = new Logger(ConfigController.name);

  constructor(private configService: DatabaseConfigService) {}

  // 获取数据库配置
  @Get('database')
  getDatabaseConfig(@Query('type') type?: string) {
    this.logger.log('获取数据库配置, type:', type);
    return this.configService.getDatabaseConfig(type);
  }

  // 获取应用运行状态（正常模式/安全模式）
  @Get('status')
  getAppStatus() {
    const state = (globalThis as any).appState || { isSafeMode: false };
    return {
      isSafeMode: state.isSafeMode,
      startupTime: state.startupTime,
      dbConnectionError: state.dbConnectionError,
      message: state.isSafeMode 
        ? '当前为安全模式，数据库连接失败，仅配置管理功能可用' 
        : '数据库连接正常，所有功能可用',
    };
  }

  // 测试数据库连接
  @Post('database/test')
  async testDatabaseConnection(@Body() config: any) {
    this.logger.log('测试数据库连接:', JSON.stringify(config));
    return await this.configService.testConnection(config);
  }

  // 保存数据库配置
  @Post('database/save')
  saveDatabaseConfig(@Body() config: any) {
    this.logger.log('保存数据库配置:', JSON.stringify(config));
    const success = this.configService.saveDatabaseConfig(config);
    return { success, message: success ? '配置保存成功' : '配置保存失败' };
  }

  // 重启后端服务
  @Post('restart')
  restartService() {
    this.logger.log('重启后端服务...');
    
    try {
      const { spawn } = require('child_process');
      const backendPath = process.cwd();
      // 使用时间戳作为日志文件名，避免文件占用问题
      const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
      const newLogPath = path.join(backendPath, `backend-restart-${timestamp}.log`);
      
      this.logger.log('后端路径:', backendPath);
      this.logger.log('新日志路径:', newLogPath);
      
      // 创建一个启动脚本，负责日志重定向
      const starterScript = `
const { spawn } = require('child_process');
const path = require('path');
const fs = require('fs');

const backendPath = ${JSON.stringify(backendPath)};
const logPath = ${JSON.stringify(newLogPath)};

// 等待当前进程退出
setTimeout(() => {
  const outFd = fs.openSync(logPath, 'a');
  const errFd = fs.openSync(logPath, 'a');
  
  const child = spawn('node', ['dist/src/main.js'], {
    cwd: backendPath,
    detached: true,
    stdio: ['ignore', outFd, errFd],
    windowsHide: true,
    env: { ...process.env, PORT: '3001' },
  });
  
  child.unref();
  console.log('后端已启动, PID:', child.pid);
  process.exit(0);
}, 2000);
`;
      
      const starterPath = path.join(backendPath, 'restart-starter.js');
      fs.writeFileSync(starterPath, starterScript, 'utf8');
      
      // 启动启动脚本（独立进程）
      const child = spawn('node', [starterPath], {
        cwd: backendPath,
        detached: true,
        stdio: 'ignore',
        windowsHide: true,
      });
      
      child.unref();
      
      this.logger.log('启动脚本已启动, PID:', child.pid);
      
      // 延迟后退出当前进程
      setTimeout(() => {
        this.logger.log('当前进程退出');
        process.exit(0);
      }, 1000);
      
      return { success: true, message: '服务正在重启，请稍候...' };
    } catch (error: any) {
      this.logger.error('重启服务失败:', error);
      return { success: false, message: error.message || '重启服务失败' };
    }
  }

  // 检查数据库结构
  @Post('database/check')
  async checkDatabaseStructure(@Body() config: any) {
    this.logger.log('检查数据库结构:', JSON.stringify(config));
    return await this.configService.checkDatabaseStructure(config);
  }

  // 获取图片上传路径
  @Get('upload-path')
  getUploadPath() {
    const uploadPath = this.configService.getUploadPath();
    return { uploadPath };
  }

  // 保存图片上传路径
  @Post('upload-path')
  saveUploadPath(@Body() body: any) {
    const uploadPath = body.uploadPath || './uploads';
    this.logger.log('保存图片上传路径:', uploadPath);
    const success = this.configService.saveUploadPath(uploadPath);
    return { success, message: success ? '图片上传路径保存成功' : '保存失败' };
  }

  // 获取文件上传路径（问题处理页附件，与图片分开）
  @Get('file-upload-path')
  getFileUploadPath() {
    const fileUploadPath = this.configService.getFileUploadPath();
    return { fileUploadPath };
  }

  // 保存文件上传路径
  @Post('file-upload-path')
  saveFileUploadPath(@Body() body: any) {
    const fileUploadPath = body.fileUploadPath || './file-uploads';
    this.logger.log('保存文件上传路径:', fileUploadPath);
    const success = this.configService.saveFileUploadPath(fileUploadPath);
    return { success, message: success ? '文件上传路径保存成功' : '保存失败' };
  }

  // 获取短信服务配置
  @Get('sms')
  getSmsConfig() {
    this.logger.log('获取短信服务配置');
    const config = this.configService.getSmsConfig();
    // 密码不返回明文，返回掩码
    return {
      ...config,
      password: config.password ? '******' : '',
    };
  }

  // 保存短信服务配置
  @Post('sms')
  saveSmsConfig(@Body() body: any) {
    this.logger.log('保存短信服务配置:', JSON.stringify({ ...body, password: body.password ? '******' : '' }));
    // 如果密码是掩码（未修改），从现有配置中读取真实密码
    let password = body.password;
    if (password === '******' || !password) {
      const existing = this.configService.getSmsConfig();
      password = existing.password || '';
    }
    const success = this.configService.saveSmsConfig({
      userId: body.userId,
      companyId: body.companyId,
      password: password,
      apiUrl: body.apiUrl,
    });
    return { success, message: success ? '短信配置保存成功' : '保存失败' };
  }

  // 获取系统默认界面样式（个人未设置时的兜底）
  @Get('system-theme')
  getSystemTheme() {
    this.logger.log('获取系统默认样式');
    const theme = this.configService.getSystemTheme();
    return { theme };
  }

  // 保存系统默认界面样式
  @Post('system-theme')
  saveSystemTheme(@Body() body: any) {
    const theme = body.theme || 'morandi';
    this.logger.log('保存系统默认样式:', theme);
    const success = this.configService.saveSystemTheme(theme);
    return { success, message: success ? '系统默认样式保存成功' : '保存失败' };
  }

  // 获取系统全局字体字号
  @Get('font-size')
  getFontSize() {
    this.logger.log('获取系统字体字号');
    const fontSize = this.configService.getFontSize();
    return { fontSize };
  }

  // 保存系统全局字体字号
  @Post('font-size')
  saveFontSize(@Body() body: any) {
    const fontSize = body.fontSize || 'standard';
    this.logger.log('保存系统字体字号:', fontSize);
    const success = this.configService.saveFontSize(fontSize);
    return { success, message: success ? '系统字体字号保存成功' : '保存失败' };
  }
}
