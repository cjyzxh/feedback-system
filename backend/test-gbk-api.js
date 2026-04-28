const https = require('https');
const querystring = require('querystring');
const crypto = require('crypto');

// 配置信息
const config = {
  companyId: '250',
  password: 'Cjysoft_2',
  apiUrl: 'https://web.esoftsms.com/v2smsGBK.aspx', // 使用GBK编码的接口
  phone: '18611583377',
  content: '【北京创佳益软件】您的验证码是123456，10分钟内有效，请勿泄露给他人。'
};

// 生成当前时间的14位时间戳
const now = new Date();
const timestamp = now.getFullYear().toString() +
  (now.getMonth() + 1).toString().padStart(2, '0') +
  now.getDate().toString().padStart(2, '0') +
  now.getHours().toString().padStart(2, '0') +
  now.getMinutes().toString().padStart(2, '0') +
  now.getSeconds().toString().padStart(2, '0');

// 尝试不同的签名组合
const signCombinations = [
  { name: '企业ID+密码+时间戳', value: config.companyId + config.password + timestamp },
  { name: '用户ID(cjy01)+密码+时间戳', value: 'cjy01' + config.password + timestamp },
  { name: '密码+企业ID+时间戳', value: config.password + config.companyId + timestamp },
  { name: '时间戳+企业ID+密码', value: timestamp + config.companyId + config.password }
];

// 测试每个签名组合
async function testSignCombinations() {
  for (const combination of signCombinations) {
    console.log(`\n=== 测试签名组合: ${combination.name} ===`);
    console.log(`签名原始字符串: ${combination.value}`);
    
    // 生成MD5签名
    const sign = crypto.createHash('md5').update(combination.value).digest('hex').toLowerCase();
    console.log(`生成的MD5签名: ${sign}`);
    
    // 构造请求参数
    const postData = querystring.stringify({
      action: 'send',
      userid: config.companyId,
      timestamp: timestamp,
      sign: sign,
      mobile: config.phone,
      content: config.content,
      sendTime: '',
      extno: ''
    });
    
    // 发送POST请求
    await sendPostRequest(config.apiUrl, postData);
  }
}

// 发送POST请求
function sendPostRequest(url, postData) {
  return new Promise((resolve, reject) => {
    const parsedUrl = new URL(url);
    
    const options = {
      hostname: parsedUrl.hostname,
      path: parsedUrl.pathname,
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Content-Length': Buffer.byteLength(postData),
        'User-Agent': 'Node.js/' + process.version
      },
      timeout: 10000
    };
    
    const req = https.request(options, (res) => {
      let data = '';
      
      res.on('data', (chunk) => {
        data += chunk;
      });
      
      res.on('end', () => {
        console.log(`API响应: ${data}`);
        resolve();
      });
    });
    
    req.on('error', (e) => {
      console.error(`请求错误: ${e.message}`);
      resolve();
    });
    
    req.on('timeout', () => {
      console.error('请求超时');
      req.destroy();
      resolve();
    });
    
    req.write(postData);
    req.end();
  });
}

// 执行测试
testSignCombinations().then(() => {
  console.log('\n=== 所有测试完成 ===');
});
