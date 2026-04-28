// 测试短信发送集成功能
const crypto = require('crypto');
const https = require('https');
const querystring = require('querystring');

// 使用与实际系统相同的配置
const config = {
  userId: 'cjy01',
  companyId: '872',
  password: 'Cjysoft_2',
  apiUrl: 'https://web.esoftsms.com/v2sms.aspx'
};

// 生成14位时间戳
const now = new Date();
const timestamp = now.getFullYear().toString() +
  (now.getMonth() + 1).toString().padStart(2, '0') +
  now.getDate().toString().padStart(2, '0') +
  now.getHours().toString().padStart(2, '0') +
  now.getMinutes().toString().padStart(2, '0') +
  now.getSeconds().toString().padStart(2, '0');

// 生成签名：用户ID+密码+时间戳
const signStr = config.userId + config.password + timestamp;
const sign = crypto.createHash('md5').update(signStr).digest('hex').toLowerCase();

// 准备请求参数
const postData = querystring.stringify({
  action: 'send',
  userid: config.companyId,
  timestamp: timestamp,
  sign: sign,
  mobile: '18611583377',
  content: '【北京创佳益软件】测试短信发送集成，您的验证码是999999，10分钟内有效，请勿泄露给他人。'
});

// 解析API URL
const apiUrl = new URL(config.apiUrl);

// 配置HTTP请求选项
const options = {
  hostname: apiUrl.hostname,
  path: apiUrl.pathname,
  method: 'POST',
  headers: {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Content-Length': Buffer.byteLength(postData)
  },
  timeout: 10000
};

// 输出测试信息
console.log('=== 短信集成测试 ===');
console.log('配置信息：');
console.log(`- 用户ID: ${config.userId}`);
console.log(`- 企业ID: ${config.companyId}`);
console.log(`- API地址: ${config.apiUrl}`);
console.log('');
console.log('请求参数：');
console.log(`- 时间戳: ${timestamp}`);
console.log(`- 签名原始字符串: ${signStr}`);
console.log(`- MD5签名: ${sign}`);
console.log(`- 手机号: 18611583377`);
console.log(`- 内容: 测试短信发送集成，您的验证码是999999`);
console.log('');
console.log('正在发送请求...');

// 发送HTTP请求
const req = https.request(options, (res) => {
  console.log(`\n响应状态码: ${res.statusCode}`);
  console.log('响应头:', res.headers);
  
  let data = '';
  
  res.on('data', (chunk) => {
    data += chunk;
  });
  
  res.on('end', () => {
    console.log('响应内容:', data);
    
    // 检查是否发送成功
    if (data.includes('returnstatus>Success</returnstatus>')) {
      console.log('\n✅ 测试成功！短信发送功能已正确集成。');
    } else {
      console.log('\n❌ 测试失败！请检查配置或API响应。');
    }
  });
});

req.on('error', (e) => {
  console.log('\n❌ 请求错误:', e.message);
});

req.on('timeout', () => {
  console.log('\n❌ 请求超时！');
  req.destroy();
});

req.write(postData);
req.end();
