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
    this.smsUserid = this.configService.get<string>('SMS_USERID', 'cjy01').replace(/^"|"$/g, '');
    // 硬编码密码以测试签名问题
    this.smsPassword = 'Cjysoft_2';
    this.smsApiUrl = this.configService.get<string>('SMS_API_URL', 'https://web.esoftsms.com/v2sms.aspx').replace(/^"|"$/g, '');
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
      this.logger.log(`=== 开始发送短信 ===`);
      this.logger.log(`手机号: ${phone}`);
      this.logger.log(`内容: ${content}`);
      this.logger.log(`当前环境: ${process.env.NODE_ENV}`);
      
      // 输出配置信息（隐藏密码的部分内容）
      const maskedPassword = this.smsPassword.substring(0, 3) + '****' + this.smsPassword.substring(this.smsPassword.length - 2);
      this.logger.log(`配置信息: userid=${this.smsUserid}, password=${maskedPassword}, apiUrl=${this.smsApiUrl}`);

      // 生成时间戳，格式为年月日时分秒
      const now = new Date();
      const timestamp = now.getFullYear().toString() +
        (now.getMonth() + 1).toString().padStart(2, '0') +
        now.getDate().toString().padStart(2, '0') +
        now.getHours().toString().padStart(2, '0') +
        now.getMinutes().toString().padStart(2, '0') +
        now.getSeconds().toString().padStart(2, '0');
      this.logger.log(`生成的时间戳: ${timestamp}`);

      // 生成签名：账号+密码+时间戳，MD5加密，32位小写（根据文档要求）
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

      this.logger.log(`完整请求参数: ${params.toString()}`);

      // 发送 HTTP 请求
      this.logger.log(`发送请求到: ${this.smsApiUrl}`);
      
      // 使用简单的 HTTP 请求替代，以便更好地捕获错误
      const https = require('https');
      const querystring = require('querystring');
      
      const postData = querystring.stringify({
        action: 'send',
        userid: this.smsUserid,
        timestamp: timestamp,
        sign: sign,
        mobile: phone,
        content: content
      });
      
      const options = {
        hostname: new URL(this.smsApiUrl).hostname,
        path: new URL(this.smsApiUrl).pathname,
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Content-Length': Buffer.byteLength(postData)
        },
        timeout: 10000
      };
      
      this.logger.log(`HTTP 请求选项: ${JSON.stringify(options)}`);
      
      // 使用 Promise 包装 HTTP 请求
      const responseData = await new Promise((resolve, reject) => {
        const req = https.request(options, (res) => {
          this.logger.log(`响应状态码: ${res.statusCode}`);
          this.logger.log(`响应头: ${JSON.stringify(res.headers)}`);
          
          let data = '';
          
          res.on('data', (chunk) => {
            data += chunk;
          });
          
          res.on('end', () => {
            this.logger.log(`响应内容: ${data}`);
            resolve(data);
          });
        });
        
        req.on('error', (e) => {
          this.logger.error(`请求错误: ${e.message}`);
          reject(e);
        });
        
        req.on('timeout', () => {
          this.logger.error('请求超时');
          req.destroy();
          reject(new Error('请求超时'));
        });
        
        req.write(postData);
        req.end();
      });

      // 根据接口返回状态判断是否成功
      const success = this.isSuccess(responseData as string);
      this.logger.log(`短信发送结果: ${success ? '成功' : '失败'}`);
      this.logger.log(`=== 短信发送结束 ===`);
      
      return success;
    } catch (error) {
      this.logger.error(`=== 短信发送异常 ===`);
      this.logger.error(`错误类型: ${error.constructor.name}`);
      this.logger.error(`错误信息: ${error.message}`);
      this.logger.error(`错误堆栈: ${error.stack}`);
      
      // 开发环境下，即使真实发送失败，也返回成功（便于测试）
      const nodeEnv = process.env.NODE_ENV;
      
      if (nodeEnv === 'development' || !nodeEnv) {
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