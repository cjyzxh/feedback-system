import { Injectable, Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { HttpService } from '@nestjs/axios';
import { firstValueFrom } from 'rxjs';
import * as crypto from 'crypto';

@Injectable()
export class SmsService {
  private readonly logger = new Logger(SmsService.name);
  private readonly smsUserid: string;
  private readonly smsPassword: string;
  private readonly smsApiUrl: string;

  constructor(
    private configService: ConfigService,
    private httpService: HttpService,
  ) {
    this.smsUserid = this.configService.get<string>('SMS_USERID', 'cjy01');
    this.smsPassword = this.configService.get<string>('SMS_PASSWORD', 'Cjysoft#02');
    this.smsApiUrl = this.configService.get<string>('SMS_API_URL', 'https://web.esoftsms.com/v2sms.aspx');
  }

  /**
   * 发送短信验证码
   * @param phone 手机号
   * @param code 验证码
   * @returns 是否发送成功
   */
  async sendVerificationCode(phone: string, code: string): Promise<boolean> {
    try {
      const content = `【北京创佳益软件】您的验证码是${code}，10分钟内有效，请勿泄露给他人。`;
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

      // 生成时间戳，格式为年月日时分秒
      const now = new Date();
      const timestamp = now.getFullYear().toString() +
        (now.getMonth() + 1).toString().padStart(2, '0') +
        now.getDate().toString().padStart(2, '0') +
        now.getHours().toString().padStart(2, '0') +
        now.getMinutes().toString().padStart(2, '0') +
        now.getSeconds().toString().padStart(2, '0');

      // 生成签名：账号+密码+时间戳，MD5加密，32位小写
      const signStr = this.smsUserid + this.smsPassword + timestamp;
      this.logger.log(`签名原始字符串: ${signStr}`);
      const sign = crypto.createHash('md5').update(signStr).digest('hex').toLowerCase();
      this.logger.log(`生成的签名: ${sign}`);

      // 构造表单参数
      const params = new URLSearchParams();
      params.append('action', 'send');
      params.append('userid', this.smsUserid);
      params.append('timestamp', timestamp);
      params.append('sign', sign);
      params.append('mobile', phone);
      params.append('content', content);

      this.logger.log(`请求参数: action=send, userid=${this.smsUserid}, timestamp=${timestamp}, sign=${sign}, mobile=${phone}`);

      // 发送 HTTP 请求
      const response = await firstValueFrom(
        this.httpService.post(this.smsApiUrl, params, {
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          timeout: 10000,
        }),
      );

      this.logger.log(`短信发送响应: ${response.data}`);

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
   * @param response 接口响应数据（XML格式）
   * @returns 是否成功
   */
  private isSuccess(response: string): boolean {
    // 简单判断XML中是否包含 Success
    if (response.includes('returnstatus>Success</returnstatus>')) {
      return true;
    }
    return false;
  }
}
