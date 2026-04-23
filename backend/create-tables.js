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
console.log('正在创建数据库表...');
console.log('========================================\n');

async function createTables() {
  try {
    console.log('1/10 正在连接数据库...');
    const pool = await sql.connect(config);
    console.log('✅ 数据库连接成功！\n');

    // 角色表
    console.log('2/10 创建 role 表...');
    await pool.request().query(`
      IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[role]') AND type in (N'U'))
      BEGIN
        CREATE TABLE role (
          id INT IDENTITY(1,1) PRIMARY KEY,
          name NVARCHAR(50) NOT NULL,
          description NTEXT NULL,
          view_others INT DEFAULT 0,
          is_admin INT DEFAULT 0,
          status INT DEFAULT 1,
          create_time DATETIME DEFAULT GETDATE(),
          update_time DATETIME DEFAULT GETDATE()
        )
      END
    `);
    console.log('✅ role 表创建成功！\n');

    // 权限表
    console.log('3/10 创建 permission 表...');
    await pool.request().query(`
      IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[permission]') AND type in (N'U'))
      BEGIN
        CREATE TABLE permission (
          id INT IDENTITY(1,1) PRIMARY KEY,
          code NVARCHAR(50) NOT NULL,
          name NVARCHAR(100) NOT NULL,
          parentCode NVARCHAR(50) NULL,
          status INT DEFAULT 1,
          sort INT DEFAULT 0
        )
      END
    `);
    console.log('✅ permission 表创建成功！\n');

    // 问题反馈表
    console.log('4/10 创建 yw_wentilb 表...');
    await pool.request().query(`
      IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yw_wentilb]') AND type in (N'U'))
      BEGIN
        CREATE TABLE yw_wentilb (
          id INT IDENTITY(1,1) PRIMARY KEY,
          lsh INT NULL,
          banben NVARCHAR(50) NULL,
          yiyuanmc NVARCHAR(50) NULL,
          shishiry NVARCHAR(50) NULL,
          mokuai NVARCHAR(50) NULL,
          form NVARCHAR(50) NULL,
          wentilx NVARCHAR(50) NULL,
          wentism NTEXT NULL,
          shouzhongcs NTEXT NULL,
          gongcscs NTEXT NULL,
          shouhoucs NTEXT NULL,
          shouzhongbz NVARCHAR(4) NULL,
          gongchengsbz NVARCHAR(4) NULL,
          shouhoubz NVARCHAR(4) NULL,
          xggcs NVARCHAR(50) NULL,
          csgcs NVARCHAR(50) NULL,
          jingjicd NVARCHAR(10) NULL,
          lvrusj DATETIME NULL,
          taolunbz NVARCHAR(4) NULL,
          lurusr NVARCHAR(50) NULL,
          lurumid INT NULL,
          szcsgcs NVARCHAR(50) NULL,
          shcsgcs NVARCHAR(50) NULL
        )
      END
    `);
    console.log('✅ yw_wentilb 表创建成功！\n');

    // 问题反馈图片表
    console.log('5/10 创建 yw_wentitp 表...');
    await pool.request().query(`
      IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yw_wentitp]') AND type in (N'U'))
      BEGIN
        CREATE TABLE yw_wentitp (
          id INT IDENTITY(1,1) PRIMARY KEY,
          lsh NVARCHAR(50) NULL,
          yiyuanmc NVARCHAR(200) NULL,
          tpnum INT NULL,
          pic1 NVARCHAR(500) NULL,
          lurusj DATETIME DEFAULT GETDATE()
        )
      END
    `);
    console.log('✅ yw_wentitp 表创建成功！\n');

    // 医院表
    console.log('6/10 创建 xt_ConfigServer 表...');
    await pool.request().query(`
      IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[xt_ConfigServer]') AND type in (N'U'))
      BEGIN
        CREATE TABLE xt_ConfigServer (
          id INT IDENTITY(1,1) PRIMARY KEY,
          YHMC NVARCHAR(200) NULL,
          PYM NVARCHAR(100) NULL,
          province NVARCHAR(100) NULL,
          city NVARCHAR(100) NULL,
          leader NVARCHAR(100) NULL,
          contact NVARCHAR(100) NULL,
          level NVARCHAR(20) NULL,
          nature NVARCHAR(20) NULL,
          MK NVARCHAR(100) NULL,
          BeiZhu NVARCHAR(500) NULL,
          ZuoFeiBZ NVARCHAR(10) NULL,
          SYQ DATETIME DEFAULT GETDATE()
        )
      END
    `);
    console.log('✅ xt_ConfigServer 表创建成功！\n');

    // 人员表
    console.log('7/10 创建 zd_jishuyuan 表...');
    await pool.request().query(`
      IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[zd_jishuyuan]') AND type in (N'U'))
      BEGIN
        CREATE TABLE zd_jishuyuan (
          id INT IDENTITY(1,1) PRIMARY KEY,
          xingming NVARCHAR(50) NULL,
          gender NVARCHAR(10) NULL,
          birth_date DATE NULL,
          phone NVARCHAR(20) NULL,
          email NVARCHAR(50) NULL,
          zhiwu NVARCHAR(50) NULL,
          zhuangtai INT DEFAULT 1,
          category NVARCHAR(20) NULL,
          createTime DATETIME DEFAULT GETDATE(),
          updateTime DATETIME DEFAULT GETDATE()
        )
      END
    `);
    console.log('✅ zd_jishuyuan 表创建成功！\n');

    // 字典 - 医院表
    console.log('8/10 创建 zd_yiyuanmc 表...');
    await pool.request().query(`
      IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[zd_yiyuanmc]') AND type in (N'U'))
      BEGIN
        CREATE TABLE zd_yiyuanmc (
          id INT IDENTITY(1,1) PRIMARY KEY,
          yiyuanmc NVARCHAR(200) NULL,
          pym NVARCHAR(100) NULL,
          mk NVARCHAR(100) NULL,
          syq NVARCHAR(100) NULL,
          beizhu NVARCHAR(500) NULL,
          zhuangtai INT DEFAULT 1
        )
      END
    `);
    console.log('✅ zd_yiyuanmc 表创建成功！\n');

    // 字典 - 模块表
    console.log('9/10 创建 zd_mokuai 表...');
    await pool.request().query(`
      IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[zd_mokuai]') AND type in (N'U'))
      BEGIN
        CREATE TABLE zd_mokuai (
          id INT IDENTITY(1,1) PRIMARY KEY,
          banben NVARCHAR(50) NULL,
          mokuaimc NVARCHAR(100) NULL
        )
      END
    `);
    console.log('✅ zd_mokuai 表创建成功！\n');

    // 字典 - 表单表
    console.log('10/10 创建 zd_form 表...');
    await pool.request().query(`
      IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[zd_form]') AND type in (N'U'))
      BEGIN
        CREATE TABLE zd_form (
          id INT IDENTITY(1,1) PRIMARY KEY,
          name NVARCHAR(100) NULL,
          module NVARCHAR(100) NULL,
          status INT DEFAULT 1
        )
      END
    `);
    console.log('✅ zd_form 表创建成功！\n');

    // 字典 - 工程师表
    await pool.request().query(`
      IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[zd_engineer]') AND type in (N'U'))
      BEGIN
        CREATE TABLE zd_engineer (
          id INT IDENTITY(1,1) PRIMARY KEY,
          name NVARCHAR(50) NULL,
          phone NVARCHAR(20) NULL,
          status INT DEFAULT 1
        )
      END
    `);
    console.log('✅ zd_engineer 表创建成功！\n');

    // 插入默认数据
    console.log('正在插入默认数据...');
    await pool.request().query(`
      IF NOT EXISTS (SELECT * FROM role WHERE name = '管理员')
      BEGIN
        INSERT INTO role (name, description, is_admin, status)
        VALUES ('管理员', '系统管理员角色', 1, 1)
      END
    `);

    await pool.request().query(`
      IF NOT EXISTS (SELECT * FROM role WHERE name = '普通用户')
      BEGIN
        INSERT INTO role (name, description, is_admin, status)
        VALUES ('普通用户', '普通用户角色', 0, 1)
      END
    `);
    console.log('✅ 默认角色数据插入成功！\n');

    await pool.close();

    console.log('========================================');
    console.log('🎉 所有表创建完成！');
    console.log('========================================\n');
    console.log('已创建的表：');
    console.log('  - sys_user');
    console.log('  - role');
    console.log('  - permission');
    console.log('  - yw_wentilb');
    console.log('  - yw_wentitp');
    console.log('  - xt_ConfigServer');
    console.log('  - zd_jishuyuan');
    console.log('  - zd_yiyuanmc');
    console.log('  - zd_mokuai');
    console.log('  - zd_form');
    console.log('  - zd_engineer');
    console.log('  - ok');
    console.log('\n现在可以正常使用系统了！\n');

  } catch (error) {
    console.error('\n❌ 创建表失败！');
    console.error('========================================');
    console.error('错误信息:', error.message);
    console.error('========================================\n');
    process.exit(1);
  }
}

createTables();
