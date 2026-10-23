-- ============================================================
-- 正式库合并脚本 v2（分批处理，GO 分隔，2026-10-23）
-- 前置：已停 WtfkBackend 服务、已备份 New_WTFK
-- v1 失败原因：DDL 与 INSERT 同批处理，编译期看不到新增列 → 改分批
-- 规则（用户拍板）：
--   1) 新库现有 148 行【保留】（真实业务数据，附件关联），只追加导入老库 6450 行
--   2) 老库 8 组重复 lsh → 方案A：每组保留 ID 较小原号，后录 8 条改号 maxlsh+1..+8（动态）
--   3) 人员转换：姓名/编码不在系统 → 测试人(cjycsr)/研发人(cjyyfr)；杜心武→杜心伟(规则保留)
--   4) 老库历史问题统一置已完成：gongchengsbz='Y'、shouhoubz='Y'、taolunbz='N'；shouzhongbz 是→Y
--   5) 新库 148 行 LSH 按 ID 升序补号（老库改号后 max+1 起）
--   6) 结构改造：LSH nvarchar→int、4 text→nvarchar(max)、新增 iFanhuicishu、建 ok 表、UX_wentilb_LSH 唯一索引
--   7) 附件 zd_fjxx 按物理 ID 关联，不受影响
-- 执行：sqlcmd -S 服务器 -U SA -P 密码 -d New_WTFK -f 65001 -i 本文件
-- ============================================================

USE New_WTFK;
SET NOCOUNT ON;

-- ========== 批处理1：结构改造（每步独立提交，风险已由备份兜底） ==========
PRINT '== 批1. 结构改造 ==';
ALTER TABLE dbo.yw_wentilb ALTER COLUMN LSH int NULL;
ALTER TABLE dbo.yw_wentilb ALTER COLUMN wentism nvarchar(max) NULL;
ALTER TABLE dbo.yw_wentilb ALTER COLUMN shouzhongcs nvarchar(max) NULL;
ALTER TABLE dbo.yw_wentilb ALTER COLUMN gongcscs nvarchar(max) NULL;
ALTER TABLE dbo.yw_wentilb ALTER COLUMN shouhoucs nvarchar(max) NULL;
IF COL_LENGTH('dbo.yw_wentilb', 'iFanhuicishu') IS NULL
  ALTER TABLE dbo.yw_wentilb ADD iFanhuicishu int NOT NULL CONSTRAINT DF_iFanhuicishu DEFAULT 0;
IF OBJECT_ID('dbo.ok') IS NULL
  CREATE TABLE dbo.ok (lsh int NOT NULL);
PRINT '   结构改造完成';
GO

-- ========== 批处理2：建用户（幂等） ==========
PRINT '== 批2. 建用户 cjycsr/cjyyfr ==';
IF NOT EXISTS (SELECT 1 FROM dbo.sys_user WHERE username = 'cjycsr')
  INSERT INTO dbo.sys_user (username, password, realName, role, status, userType, isShishi, isYanfa)
  VALUES ('cjycsr', (SELECT TOP 1 password FROM dbo.sys_user WHERE password IS NOT NULL AND password <> ''), '测试人', 'user', 1, '内部员工', 1, 0);
IF NOT EXISTS (SELECT 1 FROM dbo.sys_user WHERE username = 'cjyyfr')
  INSERT INTO dbo.sys_user (username, password, realName, role, status, userType, isShishi, isYanfa)
  VALUES ('cjyyfr', (SELECT TOP 1 password FROM dbo.sys_user WHERE password IS NOT NULL AND password <> ''), '研发人', 'user', 1, '内部员工', 0, 1);
PRINT '   用户创建完成';
GO

-- ========== 批处理3：事务导入 + 补号 + 索引 + ok 表 ==========
BEGIN TRY
  BEGIN TRANSACTION;

  PRINT '== 批3. 导入老库数据（含方案A lsh 改号） ==';
  SET IDENTITY_INSERT dbo.yw_wentilb ON;

  ;WITH dup AS (
    SELECT lsh, ROW_NUMBER() OVER (ORDER BY lsh) AS grp
    FROM cjy_wtfk.dbo.yw_wentilb
    GROUP BY lsh HAVING COUNT(*) > 1
  ),
  src AS (
    SELECT
      o.ID, o.lsh, o.banben, o.yiyuanmc, o.shishiry, o.mokuai, o.chuangtimc,
      o.wentilx, o.lvrusj, o.wentism, o.shouzhongcs, o.gongcscs, o.shouhoucs,
      o.shouzhongbz, o.xgsj, o.xggcs, o.jingjicd, o.szcsgcs, o.shcsgcs, o.cssj,
      o.iFanhuicishu,
      ROW_NUMBER() OVER (PARTITION BY o.lsh ORDER BY o.ID) AS rn,
      d.grp
    FROM cjy_wtfk.dbo.yw_wentilb o
    LEFT JOIN dup d ON o.lsh = d.lsh
  )
  INSERT INTO dbo.yw_wentilb (
    ID, LSH, banben, yiyuanmc, shishiry, mokuai, chuangtimc, wentilx, lvrusj,
    wentism, shouzhongcs, gongcscs, shouhoucs, shouzhongbz, gongchengsbz, shouhoubz,
    xgsj, xggcs, jingjicd, taolunbz, szcsgcs, shcsgcs, cssj,
    iFanhuicishu, shishiryBM, xggcsBM, szcsgcsBM, shcsgcsBM, FanKuiQD, fanhuisj
  )
  SELECT
    s.ID,
    CASE WHEN s.grp IS NULL OR s.rn = 1 THEN s.lsh
         ELSE (SELECT MAX(lsh) FROM cjy_wtfk.dbo.yw_wentilb) + s.grp END AS LSH,
    s.banben, s.yiyuanmc,
    CASE WHEN s.shishiry = '杜心武' THEN '杜心伟'
         WHEN u1.username IS NULL THEN '测试人'
         ELSE s.shishiry END,
    s.mokuai, s.chuangtimc,
    CONVERT(nvarchar(20), s.wentilx), s.lvrusj,
    s.wentism, s.shouzhongcs, s.gongcscs, s.shouhoucs,
    CASE WHEN s.shouzhongbz = '是' THEN 'Y' WHEN s.shouzhongbz = '否' THEN 'N' ELSE s.shouzhongbz END,
    'Y', 'Y',
    s.xgsj,
    CASE WHEN s.xggcs = '杜心武' THEN '杜心伟'
         WHEN u2.username IS NULL THEN '研发人'
         ELSE s.xggcs END,
    s.jingjicd,
    'N',
    CASE WHEN s.szcsgcs = '杜心武' THEN '杜心伟'
         WHEN u3.username IS NULL THEN '测试人'
         ELSE s.szcsgcs END,
    CASE WHEN s.shcsgcs = '杜心武' THEN '杜心伟'
         WHEN u4.username IS NULL THEN '测试人'
         ELSE s.shcsgcs END,
    s.cssj,
    ISNULL(s.iFanhuicishu, 0),
    CASE WHEN s.shishiry = '杜心武' THEN 'cjydxw'
         WHEN u1.username IS NULL THEN 'cjycsr'
         ELSE u1.username END,
    CASE WHEN s.xggcs = '杜心武' THEN 'cjydxw'
         WHEN u2.username IS NULL THEN 'cjyyfr'
         ELSE u2.username END,
    CASE WHEN s.szcsgcs = '杜心武' THEN 'cjydxw'
         WHEN u3.username IS NULL THEN 'cjycsr'
         ELSE u3.username END,
    CASE WHEN s.shcsgcs = '杜心武' THEN 'cjydxw'
         WHEN u4.username IS NULL THEN 'cjycsr'
         ELSE u4.username END,
    NULL, NULL
  FROM src s
  LEFT JOIN dbo.sys_user u1 ON u1.realName = s.shishiry AND s.shishiry IS NOT NULL AND s.shishiry <> ''
  LEFT JOIN dbo.sys_user u2 ON u2.realName = s.xggcs   AND s.xggcs   IS NOT NULL AND s.xggcs   <> ''
  LEFT JOIN dbo.sys_user u3 ON u3.realName = s.szcsgcs AND s.szcsgcs IS NOT NULL AND s.szcsgcs <> ''
  LEFT JOIN dbo.sys_user u4 ON u4.realName = s.shcsgcs AND s.shcsgcs IS NOT NULL AND s.shcsgcs <> '';

  SET IDENTITY_INSERT dbo.yw_wentilb OFF;
  PRINT '   导入完成';

  PRINT '== 批3. 新库原行 LSH 补号 ==';
  DECLARE @start int;
  SELECT @start = MAX(LSH) + 1 FROM dbo.yw_wentilb;
  ;WITH cte AS (
    SELECT ID, ROW_NUMBER() OVER (ORDER BY ID) - 1 AS rn
    FROM dbo.yw_wentilb WHERE LSH IS NULL
  )
  UPDATE w SET w.LSH = @start + cte.rn
  FROM dbo.yw_wentilb w JOIN cte ON w.ID = cte.ID;
  PRINT '   补号完成，起点=' + CAST(@start AS VARCHAR);

  PRINT '== 批3. 唯一索引 + ok 表 ==';
  IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('dbo.yw_wentilb') AND name = 'UX_wentilb_LSH')
    CREATE UNIQUE NONCLUSTERED INDEX UX_wentilb_LSH ON dbo.yw_wentilb(LSH);
  DECLARE @cur int;
  SELECT @cur = MAX(LSH) FROM dbo.yw_wentilb;
  IF EXISTS (SELECT 1 FROM dbo.ok)
    UPDATE dbo.ok SET lsh = @cur;
  ELSE
    INSERT INTO dbo.ok (lsh) VALUES (@cur);
  PRINT '   索引与 ok 表完成，maxLSH=' + CAST(@cur AS VARCHAR);

  COMMIT;
  PRINT '========== 正式库合并完成 ==========';
END TRY
BEGIN CATCH
  ROLLBACK;
  PRINT '========== 错误，已回滚 ==========';
  PRINT '错误: ' + ERROR_MESSAGE();
END CATCH;
GO

-- ============ 验证（独立批处理） ============
PRINT '=== 总行数 / lsh 唯一 / NULL ===';
SELECT COUNT(*) AS total_cnt, COUNT(DISTINCT LSH) AS distinct_lsh,
       SUM(CASE WHEN LSH IS NULL THEN 1 ELSE 0 END) AS lsh_null_cnt
FROM dbo.yw_wentilb;
PRINT '=== 人员残留检查（应为 0） ===';
SELECT '雷志残留:' + CAST(COUNT(*) AS VARCHAR) FROM dbo.yw_wentilb WHERE shishiry LIKE '%雷志%' OR xggcs LIKE '%雷志%' OR szcsgcs LIKE '%雷志%' OR shcsgcs LIKE '%雷志%';
SELECT '朱洪波残留:' + CAST(COUNT(*) AS VARCHAR) FROM dbo.yw_wentilb WHERE shishiry LIKE '%朱洪波%' OR xggcs LIKE '%朱洪波%' OR szcsgcs LIKE '%朱洪波%' OR shcsgcs LIKE '%朱洪波%';
SELECT '崔鹏程残留:' + CAST(COUNT(*) AS VARCHAR) FROM dbo.yw_wentilb WHERE shishiry LIKE '%崔鹏程%' OR xggcs LIKE '%崔鹏程%' OR szcsgcs LIKE '%崔鹏程%' OR shcsgcs LIKE '%崔鹏程%';
SELECT '许晰翔残留:' + CAST(COUNT(*) AS VARCHAR) FROM dbo.yw_wentilb WHERE shishiry LIKE '%许晰翔%' OR xggcs LIKE '%许晰翔%' OR szcsgcs LIKE '%许晰翔%' OR shcsgcs LIKE '%许晰翔%';
SELECT '问题汇总残留:' + CAST(COUNT(*) AS VARCHAR) FROM dbo.yw_wentilb WHERE shishiry LIKE '%问题汇总%' OR xggcs LIKE '%问题汇总%' OR szcsgcs LIKE '%问题汇总%' OR shcsgcs LIKE '%问题汇总%';
SELECT 'CRM工程残留:' + CAST(COUNT(*) AS VARCHAR) FROM dbo.yw_wentilb WHERE shishiry LIKE '%CRM工程%' OR xggcs LIKE '%CRM工程%' OR szcsgcs LIKE '%CRM工程%' OR shcsgcs LIKE '%CRM工程%';
SELECT '杜心武残留:' + CAST(COUNT(*) AS VARCHAR) FROM dbo.yw_wentilb WHERE shishiry LIKE '%杜心武%' OR xggcs LIKE '%杜心武%' OR szcsgcs LIKE '%杜心武%' OR shcsgcs LIKE '%杜心武%';
PRINT '=== 状态分布 ===';
SELECT 'gongchengsbz', ISNULL(gongchengsbz,'(空)'), COUNT(*) FROM dbo.yw_wentilb GROUP BY gongchengsbz;
SELECT 'shouhoubz', ISNULL(shouhoubz,'(空)'), COUNT(*) FROM dbo.yw_wentilb GROUP BY shouhoubz;
SELECT 'taolunbz', ISNULL(taolunbz,'(空)'), COUNT(*) FROM dbo.yw_wentilb GROUP BY taolunbz;
PRINT '=== 测试人/研发人/杜心伟 涉及行数 ===';
SELECT '测试人:' + CAST(COUNT(*) AS VARCHAR) FROM dbo.yw_wentilb WHERE shishiry='测试人' OR szcsgcs='测试人' OR shcsgcs='测试人';
SELECT '研发人:' + CAST(COUNT(*) AS VARCHAR) FROM dbo.yw_wentilb WHERE xggcs='研发人';
SELECT '杜心伟:' + CAST(COUNT(*) AS VARCHAR) FROM dbo.yw_wentilb WHERE shishiry='杜心伟' OR xggcs='杜心伟' OR szcsgcs='杜心伟' OR shcsgcs='杜心伟';
PRINT '=== ok 表 / max lsh ===';
SELECT lsh FROM dbo.ok;
SELECT MAX(LSH) AS max_lsh FROM dbo.yw_wentilb;
PRINT '=== 新库原有行（ID<=1119）LSH 补号样本 ===';
SELECT TOP 8 ID, LSH FROM dbo.yw_wentilb WHERE ID <= 1119 ORDER BY ID;
PRINT '=== 老库导入段 lsh 改号样本（重复组段） ===';
SELECT ID, LSH FROM dbo.yw_wentilb WHERE LSH BETWEEN 15161 AND 15170 ORDER BY LSH;
PRINT '=== 附件表行数（应仍 115） ===';
SELECT 'zd_fjxx:' + CAST(COUNT(*) AS VARCHAR) FROM dbo.zd_fjxx;
PRINT '=== iFanhuicishu 分布 ===';
SELECT ISNULL(CAST(iFanhuicishu AS VARCHAR), '(空)'), COUNT(*) FROM dbo.yw_wentilb GROUP BY iFanhuicishu;
