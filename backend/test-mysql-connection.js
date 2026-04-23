const mysql = require('mysql2');

// 创建连接池
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: 'Cjysoft#01',
  database: 'cjy_wtfk',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

// 测试连接
pool.getConnection((err, connection) => {
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
    connection.release();
  });
});