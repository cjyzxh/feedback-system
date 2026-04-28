const crypto = require('crypto');

// 测试参数
const config = {
  userId: 'cjy01',
  companyId: '250',
  password: 'Cjysoft_2',
  timestamp: '20260428144512' // 14位时间戳
};

console.log('=== 签名调试详细信息 ===');
console.log('用户ID:', config.userId);
console.log('企业ID:', config.companyId);
console.log('密码:', config.password);
console.log('时间戳:', config.timestamp);
console.log('');

// 测试不同的签名组合
const testCombinations = [
  { name: '用户ID+密码+时间戳（文档推荐）', value: config.userId + config.password + config.timestamp },
  { name: '企业ID+密码+时间戳（可能的错误）', value: config.companyId + config.password + config.timestamp },
  { name: '用户ID+密码（无时间戳）', value: config.userId + config.password },
  { name: '密码+用户ID+时间戳（顺序错误）', value: config.password + config.userId + config.timestamp }
];

testCombinations.forEach(combination => {
  console.log(`--- ${combination.name} ---`);
  console.log('原始字符串:', combination.value);
  console.log('字符串长度:', combination.value.length);
  
  // 测试不同的编码
  const encodings = ['utf8', 'ascii', 'latin1'];
  
  encodings.forEach(encoding => {
    try {
      const sign = crypto.createHash('md5').update(combination.value, encoding).digest('hex');
      console.log(`${encoding}编码MD5小写: ${sign}`);
      console.log(`${encoding}编码MD5大写: ${sign.toUpperCase()}`);
      console.log(`${encoding}编码MD5长度: ${sign.length}`);
    } catch (e) {
      console.log(`${encoding}编码错误: ${e.message}`);
    }
  });
  
  console.log('');
});

// 测试官方示例
console.log('=== 官方示例验证 ===');
const officialUser = 'test';
const officialPass = 'mima';
const officialTimestamp = '20120701231212';
const officialExpected = '5cc68982f55ac74348e3d819f868fbe1';
const officialSignStr = officialUser + officialPass + officialTimestamp;
const officialSign = crypto.createHash('md5').update(officialSignStr).digest('hex');

console.log('官方示例用户:', officialUser);
console.log('官方示例密码:', officialPass);
console.log('官方示例时间戳:', officialTimestamp);
console.log('官方示例原始字符串:', officialSignStr);
console.log('官方示例计算签名:', officialSign);
console.log('官方示例期望签名:', officialExpected);
console.log('官方示例验证结果:', officialSign === officialExpected ? '通过' : '失败');
console.log('');

// 测试我们的配置与官方示例的对比
console.log('=== 配置对比 ===');
console.log('我们的用户ID长度:', config.userId.length);
console.log('官方示例用户长度:', officialUser.length);
console.log('我们的密码长度:', config.password.length);
console.log('官方示例密码长度:', officialPass.length);
console.log('我们的时间戳长度:', config.timestamp.length);
console.log('官方示例时间戳长度:', officialTimestamp.length);
console.log('');

// 测试密码的特殊字符
console.log('=== 密码字符分析 ===');
const passwordChars = config.password.split('').map((char, index) => {
  return `${char} (ASCII: ${char.charCodeAt(0)})`;
});
console.log('密码字符详情:', passwordChars);
