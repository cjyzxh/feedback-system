import { createConnection } from 'typeorm';

async function testMssqlConnection() {
  try {
    console.log('开始测试 SQL Server 连接...');
    
    const connection = await createConnection({
      type: 'mssql',
      host: 'ZZ',
      port: 1443,
      username: 'sa',
      password: '1',
      database: 'cjy_wtfk',
      entities: [],
      synchronize: false,
    });

    console.log('连接成功!');
    await connection.close();
    console.log('连接已关闭');
  } catch (error) {
    console.error('连接失败:', error);
  }
}

testMssqlConnection();
