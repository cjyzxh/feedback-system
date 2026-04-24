import { Injectable, Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { HttpService } from '@nestjs/axios';
import { firstValueFrom } from 'rxjs';

@Injectable()
export class SmsService {
  private readonly logger = new Logger(SmsService.name);
  private readonly smsUsername: string;
  private readonly smsPassword: string;
  private readonly smsApiUrl: string;

  constructor(
    private configService: ConfigService,
    private httpService: HttpService,
  ) {
    this.smsUsername = this.configService.get<string>('SMS_USERNAME', 'cjy01');
    this.smsPassword = this.configService.get<string>('SMS_PASSWORD', 'Cjysoft#02');
    this.smsApiUrl = this.configService.get<string>('SMS_API_URL', 'https://api.cjysoft.com/sms/send');
  }

  /**
   * 发送短信验证码
   * @param phone 手机号
   * @param code 验证码
   * @returns 是否发送成功
   */
  async sendVerificationCode(phone: string, code: string): Promise<boolean> {
    try {
      const content = `您的验证码是${code}，10分钟内有效，请勿泄露给他人。`;
      return await this.sendSms(phone, content);
    } catch (error) {
      this.logger.error(`发送短信失败: ${phone}`, error.stack);
      throw error;
    }
  }

  /**
   * 通用短信发送方法
   * @param phone 手机号
   * @param content 短信内容
   * @returns 是否发送成功
   */
  async sendSms(phone: string, content: string): Promise<boolean> {
    try {
      this.logger.log(`准备发送短信: 手机号=${phone}, 内容=${content}`);

      // 企业融合通讯平台接口（根据实际文档调整参数）
      const requestBody = {
        username: this.smsUsername,
        password: this.smsPassword,
        mobile: phone,
        content: content,
        timestamp: new Date().getTime().toString(),
      };

      // 发送 HTTP 请求
      const response = await firstValueFrom(
        this.httpService.post(this.smsApiUrl, requestBody, {
          headers: {
            'Content-Type': 'application/json',
          },
          timeout: 10000,
        }),
      );

      this.logger.log(`短信发送响应: ${JSON.stringify(response.data)}`);

      // 根据接口返回状态判断是否成功
      return this.isSuccess(response.data);
    } catch (error) {
      this.logger.error(`短信发送异常: ${error.message}`, error.stack);
      
      // 开发环境下，即使真实发送失败，也返回成功（便于测试）
      if (process.env.NODE_ENV === 'development' || !process.env.NODE_ENV) {
        this.logger.warn(`开发模式：短信发送失败，但模拟成功`);
        return true;
      }
      
      throw error;
    }
  }

  /**
   * 判断接口返回是否成功
   * @param response 接口响应数据
   * @returns 是否成功
   */
  private isSuccess(response: any): boolean {
    // 根据实际接口文档调整判断逻辑
    if (response.code === 200 || response.status === 'success' || response.result === 0) {
      return true;
    }
    return false;
  }
}
