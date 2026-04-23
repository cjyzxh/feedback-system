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
console.log('正在添加缺失的表...');
console.log('========================================\n');

async function addTables() {
  try {
    const pool = await sql.connect(config);
    console.log('✅ 数据库连接成功！\n');

    // 表单字典表（zd_chuangti）
    console.log('正在检查/创建 zd_chuangti 表...');
    await pool.request().query(`
      IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[zd_chuangti]') AND type in (N'U'))
      BEGIN
        CREATE TABLE zd_chuangti (
          id INT IDENTITY(1,1) PRIMARY KEY,
          mokuai NVARCHAR(100) NULL,
          chuangtimc NVARCHAR(100) NULL
        )
      END
    `);
    console.log('✅ zd_chuangti 表处理完成！\n');

    console.log('正在添加示例数据...');

    // 添加一些示例模块
    await pool.request().query(`
      IF NOT EXISTS (SELECT * FROM zd_mokuai WHERE mokuaimc = '门诊系统')
      BEGIN
        INSERT INTO zd_mokuai (banben, mokuaimc) VALUES ('V1.0', '门诊系统'), ('V1.0', '住院系统'), ('V1.0', '药房系统')
      END
    `);

    // 添加一些示例表单
    await pool.request().query(`
      IF NOT EXISTS (SELECT * FROM zd_chuangti WHERE chuangtimc = '挂号登记')
      BEGIN
        INSERT INTO zd_chuangti (mokuai, chuangtimc) VALUES 
          ('门诊系统', '挂号登记'), ('门诊系统', '门诊收费'), 
          ('住院系统', '入院登记'), ('住院系统', '出院结算'),
          ('药房系统', '药品入库'), ('药房系统', '药品发放')
      END
    `);

    // 添加一些示例人员
    await pool.request().query(`
      IF NOT EXISTS (SELECT * FROM zd_jishuyuan WHERE xingming = '张三')
      BEGIN
        INSERT INTO zd_jishuyuan (xingming, gender, phone, email, zhiwu, zhuangtai, category) VALUES
          ('张三', '男', '13800138001', 'zhangsan@example.com', '实施工程师', 1, '0'),
          ('李四', '男', '13800138002', 'lisi@example.com', '开发工程师', 1, '1'),
          ('王五', '女', '13800138003', 'wangwu@example.com', '实施工程师', 1, '0,1'),
          ('赵六', '男', '13800138004', 'zhaoliu@example.com', '开发工程师', 1, '1'),
          ('钱七', '女', '13800138005', 'qianqi@example.com', '售后服务', 1, '0')
      END
    `);

    // 添加一些示例医院
    await pool.request().query(`
      IF NOT EXISTS (SELECT * FROM xt_ConfigServer WHERE YHMC = '北京协和医院')
      BEGIN
        INSERT INTO xt_ConfigServer (YHMC, PYM, province, city, BeiZhu, ZuoFeiBZ, SYQ) VALUES
          ('北京协和医院', 'BJXHYY', '北京', '北京', '综合三甲医院', 'N', GETDATE()),
          ('北京大学第一医院', 'BDDY', '北京', '北京', '综合三甲医院', 'N', GETDATE()),
          ('上海瑞金医院', 'SHRJ', '上海', '上海', '综合三甲医院', 'N', GETDATE()),
          ('广东省人民医院', 'GDSRM', '广东', '广州', '综合三甲医院', 'N', GETDATE())
      END
    `);

    console.log('✅ 示例数据添加完成！\n');
    await pool.close();

    console.log('========================================');
    console.log('🎉 所有缺失的表和数据已添加完成！');
    console.log('========================================\n');
  } catch (error) {
    console.error('\n❌ 添加失败！');
    console.error('========================================');
    console.error('错误信息:', error.message);
    console.error('========================================\n');
    process.exit(1);
  }
}

addTables();
