const sql = require('mssql');

const config = {
  server: '192.168.2.5',
  port: 1433,
  user: 'SA',
  password: '1',
  database: 'cjy_wtfk',
  options: {
    encrypt: true,
    trustServerCertificate: true,
    enableArithAbort: true
  }
};

console.log('========================================');
console.log('正在更新 yw_wentilb 表结构...');
console.log('========================================\n');

async function updateTable() {
  try {
    const pool = await sql.connect(config);
    console.log('✅ 数据库连接成功！\n');

    // 检查并添加缺失的字段
    const columnsToAdd = [
      { name: 'szcsgcs', type: 'NVARCHAR(50)', nullable: true },
      { name: 'shcsgcs', type: 'NVARCHAR(50)', nullable: true },
      { name: 'lurumid', type: 'INT', nullable: true }
    ];

    for (const col of columnsToAdd) {
      const check = await pool.request().query(`
        SELECT COUNT(*) as cnt FROM sys.columns WHERE Name = '${col.name}' AND Object_ID = OBJECT_ID('yw_wentilb')
      `);
      if (check.recordset[0].cnt === 0) {
        console.log(`正在添加字段: ${col.name}`);
        await pool.request().query(`
          ALTER TABLE yw_wentilb ADD [${col.name}] ${col.type} ${col.nullable ? 'NULL' : 'NOT NULL'}
        `);
        console.log(`✅ ${col.name} 添加成功！`);
      } else {
        console.log(`✅ ${col.name} 已存在，跳过`);
      }
    }

    await pool.close();

    console.log('\n========================================');
    console.log('🎉 yw_wentilb 表结构更新完成！');
    console.log('========================================\n');
  } catch (error) {
    console.error('\n❌ 更新失败！');
    console.error('========================================');
    console.error('错误信息:', error.message);
    console.error('========================================\n');
    process.exit(1);
  }
}

updateTable();
