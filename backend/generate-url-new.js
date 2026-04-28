// 使用正确的14位时间戳生成URL
const crypto = require('crypto');
const url = require('url');

// 用户提供的参数
const params = {
  userId: 'cjy01',
  password: 'Cjysoft_2',
  timestamp: '20260428144612', // 正确的14位时间戳
  companyId: '872',
  mobile: '18611583377',
  content: '【北京创佳益软件】您的验证码是123456，10分钟内有效，请勿泄露给他人。'
};

// 生成签名原始字符串：用户ID + 密码 + 时间戳
const signStr = params.userId + params.password + params.timestamp;

// 计算MD5签名（32位小写）
const sign = crypto.createHash('md5').update(signStr).digest('hex').toLowerCase();

// 构造URL参数
const urlParams = new URLSearchParams();
urlParams.append('action', 'send');
urlParams.append('userid', params.companyId);
urlParams.append('timestamp', params.timestamp);
urlParams.append('sign', sign);
urlParams.append('mobile', params.mobile);
urlParams.append('content', params.content);
urlParams.append('sendTime', '');
urlParams.append('extno', '');

// 生成完整URL
const fullUrl = `https://web.esoftsms.com/v2sms.aspx?${urlParams.toString()}`;

// 输出结果
console.log('=== 完整URL（包含API地址） ===');
console.log(fullUrl);
console.log('');
console.log('=== 签名计算明细 ===');
console.log(`签名原始字符串: ${signStr}`);
console.log(`MD5签名结果: ${sign}`);
console.log('');
console.log('=== 参数明细 ===');
console.log(`userid: ${params.companyId}`);
console.log(`timestamp: ${params.timestamp}`);
console.log(`sign: ${sign}`);
console.log(`mobile: ${params.mobile}`);
console.log(`content: ${params.content}`);
console.log('action: send');
console.log('sendTime: (空)');
console.log('extno: (空)');
