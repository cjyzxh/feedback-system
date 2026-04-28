const https = require('https');
const querystring = require('querystring');
const crypto = require('crypto');

// 配置信息
const config = {
  userid: '250',
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

// 生成签名
const signStr = config.userid + config.password + timestamp;
const sign = crypto.createHash('md5').update(signStr).digest('hex').toLowerCase();

// 构造请求参数
const postData = querystring.stringify({
  action: 'send',
  userid: config.userid,
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

console.log('=== 直接调用短信API测试 ===');
console.log('请求URL:', config.apiUrl);
console.log('请求方法:', options.method);
console.log('请求头:', JSON.stringify(options.headers, null, 2));
console.log('请求参数:', postData);
console.log('签名原始字符串:', signStr);
console.log('生成的签名:', sign);
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
    
    // 尝试解析XML响应
    try {
      const xml2js = require('xml2js');
      xml2js.parseString(data, (err, result) => {
        if (err) {
          console.log('XML解析失败:', err.message);
        } else {
          console.log('解析后的XML:', JSON.stringify(result, null, 2));
        }
      });
    } catch (e) {
      console.log('无法解析XML响应:', e.message);
    }
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
