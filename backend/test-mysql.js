const mysql = require('mysql2');

// 创建连接（不指定数据库）
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'Cjysoft#01'
});

// 测试连接
connection.connect((err) => {
  if (err) {
    console.error('连接失败:', err.message);
    return;
  }
  console.log('连接成功!');
  
  // 创建数据库
  connection.query('CREATE DATABASE IF NOT EXISTS cjy_wtfk', (err, results) => {
    if (err) {
      console.error('创建数据库失败:', err.message);
    } else {
      console.log('数据库创建成功');
    }
    connection.end();
  });
});