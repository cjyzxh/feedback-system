-- ============================================================
-- 重导脚本：老库历史数据 + 人员归属/状态转换规则
-- 目标库：测试 = New_wtfk ；正式 = New_WTFK（正式库未获允许不碰）
-- 规则（用户 2026-10-23 拍板）：
--   1) 老库"杜心武" = 新库"杜心伟"(cjydxw)，直接匹配
--   2) 测试/反馈类(shishiry/szcsgcs/shcsgcs)：姓名/编码不在系统用户表 → 测试人(cjycsr)
--   3) 处理类(xggcs)：不在系统 → 研发人(cjyyfr)
--   4) 空姓名也按上述转换（用户确认：shcsgcs 空姓名填"测试人"）
--   5) 老库导入的历史问题统一置为已完成：gongchengsbz='Y'、shouhoubz='Y'、taolunbz='N'
-- 流程：建用户(幂等) → 备份当前表 → 删老库段(保留新库原16行44-65) → 导入+转换 → 唯一索引 → ok表
-- 执行：sqlcmd -S 服务器 -U SA -P 密码 -d New_wtfk -f 65001 -i 本文件
-- ============================================================

USE New_wtfk;
SET NOCOUNT ON;

BEGIN TRY
  BEGIN TRANSACTION;

  -- 0. 建 cjycsr 测试人 / cjyyfr 研发人（幂等；密码复用现有测试用户哈希）
  IF NOT EXISTS (SELECT 1 FROM dbo.sys_user WHERE username = 'cjycsr')
    INSERT INTO dbo.sys_user (username, password, realName, role, status, userType, isShishi, isYanfa)
    VALUES ('cjycsr', (SELECT TOP 1 password FROM dbo.sys_user WHERE username = 'cjy002'), '测试人', 'user', 1, '内部员工', 1, 0);
  IF NOT EXISTS (SELECT 1 FROM dbo.sys_user WHERE username = 'cjyyfr')
    INSERT INTO dbo.sys_user (username, password, realName, role, status, userType, isShishi, isYanfa)
    VALUES ('cjyyfr', (SELECT TOP 1 password FROM dbo.sys_user WHERE username = 'cjy002'), '研发人', 'user', 1, '内部员工', 0, 1);

  -- 1. 备份当前表（可回滚）
  IF OBJECT_ID('dbo.yw_wentilb_bak_1023') IS NULL
    SELECT * INTO dbo.yw_wentilb_bak_1023 FROM dbo.yw_wentilb;
  ELSE
  BEGIN
    DELETE FROM dbo.yw_wentilb_bak_1023;
    INSERT INTO dbo.yw_wentilb_bak_1023 SELECT * FROM dbo.yw_wentilb;
  END;

  -- 2. 删除老库导入段（ID 6638-19797 及一切非 44-65 行），保留新库原 16 行
  DELETE FROM dbo.yw_wentilb WHERE ID NOT BETWEEN 44 AND 65;

  -- 3. 导入老库 5793 行（人员转换 + 状态转换）
  SET IDENTITY_INSERT dbo.yw_wentilb ON;

  INSERT INTO dbo.yw_wentilb (
    ID, LSH, banben, yiyuanmc, shishiry, mokuai, chuangtimc, wentilx, lvrusj,
    wentism, shouzhongcs, gongcscs, shouhoucs, shouzhongbz, gongchengsbz, shouhoubz,
    xgsj, xggcs, jingjicd, taolunbz, szcsgcs, shcsgcs, cssj,
    iFanhuicishu, shishiryBM, xggcsBM, szcsgcsBM, shcsgcsBM, FanKuiQD, fanhuisj
  )
  SELECT
    o.ID,
    o.lsh,   -- 老库 lsh 原值（老库已按方案 A 去重，max=14339）
    o.banben, o.yiyuanmc,
    CASE WHEN o.shishiry = '杜心武' THEN '杜心伟'
         WHEN u1.username IS NULL THEN '测试人'
         ELSE o.shishiry END,
    o.mokuai, o.chuangtimc,
    CONVERT(nvarchar(20), o.wentilx), o.lvrusj,
    o.wentism, o.shouzhongcs, o.gongcscs, o.shouhoucs,
    o.shouzhongbz,
    'Y',   -- 老库历史问题统一处理完成（gongchengsbz）
    'Y',   -- 售后标志统一已完成（shouhoubz）
    o.xgsj,
    CASE WHEN o.xggcs = '杜心武' THEN '杜心伟'
         WHEN u2.username IS NULL THEN '研发人'
         ELSE o.xggcs END,
    o.jingjicd,
    'N',   -- 待讨论统一清除（taolunbz）
    CASE WHEN o.szcsgcs = '杜心武' THEN '杜心伟'
         WHEN u3.username IS NULL THEN '测试人'
         ELSE o.szcsgcs END,
    CASE WHEN o.shcsgcs = '杜心武' THEN '杜心伟'
         WHEN u4.username IS NULL THEN '测试人'
         ELSE o.shcsgcs END,
    o.cssj,
    ISNULL(o.iFanhuicishu, 0),
    CASE WHEN o.shishiry = '杜心武' THEN 'cjydxw'
         WHEN u1.username IS NULL THEN 'cjycsr'
         ELSE u1.username END,
    CASE WHEN o.xggcs = '杜心武' THEN 'cjydxw'
         WHEN u2.username IS NULL THEN 'cjyyfr'
         ELSE u2.username END,
    CASE WHEN o.szcsgcs = '杜心武' THEN 'cjydxw'
         WHEN u3.username IS NULL THEN 'cjycsr'
         ELSE u3.username END,
    CASE WHEN o.shcsgcs = '杜心武' THEN 'cjydxw'
         WHEN u4.username IS NULL THEN 'cjycsr'
         ELSE u4.username END,
    NULL, NULL
  FROM cjy_wtfk.dbo.yw_wentilb o
  LEFT JOIN dbo.sys_user u1 ON u1.realName = o.shishiry AND o.shishiry IS NOT NULL AND o.shishiry <> ''
  LEFT JOIN dbo.sys_user u2 ON u2.realName = o.xggcs   AND o.xggcs   IS NOT NULL AND o.xggcs   <> ''
  LEFT JOIN dbo.sys_user u3 ON u3.realName = o.szcsgcs AND o.szcsgcs IS NOT NULL AND o.szcsgcs <> ''
  LEFT JOIN dbo.sys_user u4 ON u4.realName = o.shcsgcs AND o.shcsgcs IS NOT NULL AND o.shcsgcs <> '';

  SET IDENTITY_INSERT dbo.yw_wentilb OFF;

  -- 4. LSH 唯一索引（老库已无重复；新库原16行 14340-14355 与老库段不冲突）
  IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('dbo.yw_wentilb') AND name = 'UX_wentilb_LSH')
    CREATE UNIQUE NONCLUSTERED INDEX UX_wentilb_LSH ON dbo.yw_wentilb(LSH);

  -- 5. ok 取号表 = max(LSH)（动态）
  DECLARE @cur int;
  SELECT @cur = MAX(LSH) FROM dbo.yw_wentilb;
  IF EXISTS (SELECT 1 FROM dbo.ok)
    UPDATE dbo.ok SET lsh = @cur;
  ELSE
    INSERT INTO dbo.ok (lsh) VALUES (@cur);

  COMMIT;
  PRINT '重导完成';
END TRY
BEGIN CATCH
  ROLLBACK;
  PRINT '错误: ' + ERROR_MESSAGE();
END CATCH;

-- ============ 验证 ============
PRINT '=== 总行数 / lsh 唯一 / NULL ===';
SELECT COUNT(*) AS total_cnt, COUNT(DISTINCT LSH) AS distinct_lsh,
       SUM(CASE WHEN LSH IS NULL THEN 1 ELSE 0 END) AS lsh_null_cnt
FROM dbo.yw_wentilb;
PRINT '=== 人员残留检查（应为 0） ===';
SELECT '杜心武残留:' + CAST(COUNT(*) AS VARCHAR) FROM dbo.yw_wentilb WHERE shishiry LIKE '%杜心武%' OR xggcs LIKE '%杜心武%' OR szcsgcs LIKE '%杜心武%' OR shcsgcs LIKE '%杜心武%';
SELECT '雷志残留:' + CAST(COUNT(*) AS VARCHAR) FROM dbo.yw_wentilb WHERE shishiry LIKE '%雷志%' OR xggcs LIKE '%雷志%' OR szcsgcs LIKE '%雷志%' OR shcsgcs LIKE '%雷志%';
SELECT '朱洪波残留:' + CAST(COUNT(*) AS VARCHAR) FROM dbo.yw_wentilb WHERE shishiry LIKE '%朱洪波%' OR xggcs LIKE '%朱洪波%' OR szcsgcs LIKE '%朱洪波%' OR shcsgcs LIKE '%朱洪波%';
SELECT '姚晓盼残留:' + CAST(COUNT(*) AS VARCHAR) FROM dbo.yw_wentilb WHERE shishiry LIKE '%姚晓盼%' OR xggcs LIKE '%姚晓盼%' OR szcsgcs LIKE '%姚晓盼%' OR shcsgcs LIKE '%姚晓盼%';
PRINT '=== 状态分布 ===';
SELECT gongchengsbz, COUNT(*) AS n FROM dbo.yw_wentilb GROUP BY gongchengsbz;
PRINT '=== 测试人/研发人/杜心伟 涉及行数 ===';
SELECT '测试人(含shishiry/szcsgcs/shcsgcs):' + CAST(COUNT(*) AS VARCHAR) FROM dbo.yw_wentilb WHERE shishiry='测试人' OR szcsgcs='测试人' OR shcsgcs='测试人';
SELECT '研发人(xggcs):' + CAST(COUNT(*) AS VARCHAR) FROM dbo.yw_wentilb WHERE xggcs='研发人';
SELECT '杜心伟:' + CAST(COUNT(*) AS VARCHAR) FROM dbo.yw_wentilb WHERE shishiry='杜心伟' OR xggcs='杜心伟' OR szcsgcs='杜心伟' OR shcsgcs='杜心伟';
PRINT '=== ok 表 / max lsh ===';
SELECT lsh FROM dbo.ok;
SELECT MAX(LSH) AS max_lsh FROM dbo.yw_wentilb;
