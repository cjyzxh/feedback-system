const mysql = require('mysql2');

// 模拟环境变量加载
const dotenv = require('dotenv');
dotenv.config();

console.log('环境变量:');
console.log('DB_HOST:', process.env.DB_HOST);
console.log('DB_PORT:', process.env.DB_PORT);
console.log('DB_USERNAME:', process.env.DB_USERNAME);
console.log('DB_PASSWORD:', process.env.DB_PASSWORD);
console.log('DB_NAME:', process.env.DB_NAME);

// 创建连接
const connection = mysql.createConnection({
  host: process.env.DB_HOST || 'localhost',
  port: parseInt(process.env.DB_PORT || '3306'),
  user: process.env.DB_USERNAME || 'root',
  password: process.env.DB_PASSWORD || 'Cjysoft#01',
  database: process.env.DB_NAME || 'cjy_wtfk'
});

// 测试连接
connection.connect((err) => {
  if (err) {
    console.error('连接失败:', err.message);
    return;
  }
  console.log('连接成功!');
  
  // 测试查询
  connection.query('SELECT 1 + 1 AS solution', (err, results) => {
    if (err) {
      console.error('查询失败:', err.message);
    } else {
      console.log('查询成功:', results[0].solution);
    }
    connection.end();
  });
});