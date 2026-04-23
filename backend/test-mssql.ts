import { createConnection } from 'typeorm';
import * as path from 'path';

async function testMSSQL() {
  console.log('正在连接 MSSQL 数据库...');
  console.log('配置信息:');
  console.log('- Host: 192.168.2.5');
  console.log('- Port: 1433');
  console.log('- User: SA');
  console.log('- Database: cjy_wtfk');
  console.log('');

  try {
    const connection = await createConnection({
      type: 'mssql',
      host: '192.168.2.5',
      port: 1433,
      username: 'SA',
      password: '1',
      database: 'cjy_wtfk',
      entities: [path.join(__dirname, 'src/**/*.entity{.ts,.js}')],
      synchronize: true, // 自动同步表结构
      logging: true,
      options: {
        encrypt: true,
        trustServerCertificate: true,
      },
    });

    console.log('');
    console.log('✅ 数据库连接成功！');
    console.log('');
    console.log('正在同步表结构...');
    console.log('');

    // 获取已同步的实体
    const entityMetadatas = connection.entityMetadatas;
    console.log(`找到 ${entityMetadatas.length} 个实体：`);
    entityMetadatas.forEach((metadata, index) => {
      console.log(`  ${index + 1}. ${metadata.name} -> ${metadata.tableName}`);
    });

    await connection.close();
    console.log('');
    console.log('✅ 表结构同步完成！');
    console.log('');
    console.log('所有表已创建在数据库 cjy_wtfk 中。');

  } catch (error) {
    console.error('');
    console.error('❌ 错误:');
    console.error('');
    console.error(error.message);
    if (error.stack) {
      console.error('');
      console.error('堆栈信息:');
      console.error(error.stack);
    }
    process.exit(1);
  }
}

testMSSQL();
