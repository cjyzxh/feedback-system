const https = require('https');
const querystring = require('querystring');
const crypto = require('crypto');

// 分离的配置信息
const config = {
  userId: 'cjy01', // 用户ID，用于签名
  companyId: '250', // 企业ID，用于API请求
  password: 'Cjysoft_2',
  apiUrl: 'https://web.esoftsms.com/v2sms.aspx',
  phone: '13800138000',
  content: '【北京创佳益软件】您的验证码是123456，10分钟内有效，请勿泄露给他人。'
};

// 生成时间戳，格式为年月日时分秒
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

// 构造请求参数
const postData = querystring.stringify({
  action: 'send',
  userid: config.companyId, // API请求中使用企业ID
  timestamp: timestamp,
  sign: sign,
  mobile: config.phone,
  content: config.content,
  sendTime: '',
  extno: ''
});

// 解析API URL
const url = new URL(config.apiUrl);

// 配置请求选项
const options = {
  hostname: url.hostname,
  path: url.pathname,
  method: 'POST',
  headers: {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Content-Length': Buffer.byteLength(postData),
    'User-Agent': 'Node.js/' + process.version
  },
  timeout: 10000
};

console.log('=== 分离ID测试 ===');
console.log('用户ID:', config.userId);
console.log('企业ID:', config.companyId);
console.log('密码:', config.password);
console.log('时间戳:', timestamp);
console.log('签名原始字符串:', signStr);
console.log('生成的签名:', sign);
console.log('');

console.log('=== API请求信息 ===');
console.log('请求URL:', config.apiUrl);
console.log('请求参数:', postData);
console.log('');

// 发送请求
const req = https.request(options, (res) => {
  console.log('=== API响应 ===');
  console.log('状态码:', res.statusCode);
  console.log('响应头:', JSON.stringify(res.headers, null, 2));
  
  let data = '';
  
  res.on('data', (chunk) => {
    data += chunk;
  });
  
  res.on('end', () => {
    console.log('响应内容:', data);
    console.log('');
  });
});

req.on('error', (e) => {
  console.error('请求错误:', e.message);
  console.error('错误堆栈:', e.stack);
});

req.on('timeout', () => {
  console.error('请求超时');
  req.destroy();
});

// 发送请求体
req.write(postData);
req.end();
