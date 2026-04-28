const crypto = require('crypto');

// 测试官方示例
// 账号：test
// 密码：mima
// 时间戳：20120701231212
// 期望签名：5cc68982f55ac74348e3d819f868fbe1

const officialTest = () => {
  const userid = 'test';
  const password = 'mima';
  const timestamp = '20120701231212';
  const expectedSign = '5cc68982f55ac74348e3d819f868fbe1';
  
  const signStr = userid + password + timestamp;
  const sign = crypto.createHash('md5').update(signStr).digest('hex').toLowerCase();
  
  console.log('=== 官方示例测试 ===');
  console.log('账号:', userid);
  console.log('密码:', password);
  console.log('时间戳:', timestamp);
  console.log('原始字符串:', signStr);
  console.log('生成的签名:', sign);
  console.log('期望的签名:', expectedSign);
  console.log('测试结果:', sign === expectedSign ? '通过' : '失败');
  console.log('');
};

// 测试我们的配置
const ourTest = () => {
  const userid = '250';
  const password = 'Cjysoft_2';
  const timestamp = '20260428140815'; // 使用之前的时间戳进行测试
  const ourSign = '4377294c347be3fe3f1f51b64ae719cc';
  
  const signStr = userid + password + timestamp;
  const sign = crypto.createHash('md5').update(signStr).digest('hex').toLowerCase();
  
  console.log('=== 我们的配置测试 ===');
  console.log('账号:', userid);
  console.log('密码:', password);
  console.log('时间戳:', timestamp);
  console.log('原始字符串:', signStr);
  console.log('生成的签名:', sign);
  console.log('我们之前使用的签名:', ourSign);
  console.log('测试结果:', sign === ourSign ? '通过' : '失败');
  console.log('');
};

// 测试不同的时间戳格式
const timestampTest = () => {
  const userid = '250';
  const password = 'Cjysoft_2';
  
  // 不同的时间戳格式
  const timestamps = [
    // 当前时间的各种格式
    new Date().toISOString().replace(/[-T:.Z]/g, '').slice(0, 14), // ISO格式转换
    new Date().getTime().toString().slice(0, 13), // 时间戳
    new Date().toLocaleString('zh-CN').replace(/[\/ :]/g, '') // 本地时间格式
  ];
  
  console.log('=== 时间戳格式测试 ===');
  timestamps.forEach((ts, index) => {
    const signStr = userid + password + ts;
    const sign = crypto.createHash('md5').update(signStr).digest('hex').toLowerCase();
    console.log(`时间戳格式${index + 1}: ${ts}`);
    console.log(`生成的签名: ${sign}`);
    console.log('');
  });
};

// 执行测试
officialTest();
ourTest();
timestampTest();
