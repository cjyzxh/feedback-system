-- ============================================================
-- 老库历史数据导入脚本（yw_wentilb）
-- 用途：将老库 cjy_wtfk.yw_wentilb 全量导入目标库（结构一致）
-- 目标库：测试 = New_wtfk ；正式 = New_WTFK（两者结构方式一致，数据各自独立）
-- 本次执行：测试库 New_wtfk（正式库未获允许不碰）
-- 特性：幂等（按 ID 判断已存在跳过）、lsh 去重补号、唯一索引、ok 取号表初始化、整体事务
-- 执行：sqlcmd -S 服务器 -U SA -P 密码 -d New_wtfk -f 65001 -i 本文件
-- ============================================================

USE New_wtfk;   -- <== 目标库：正式库时改为 USE New_WTFK
SET NOCOUNT ON;

BEGIN TRY
  BEGIN TRANSACTION;

  -- 0. 建 cjycsy 测试员用户（幂等；密码复用现有测试用户哈希）
  IF NOT EXISTS (SELECT 1 FROM dbo.sys_user WHERE username = 'cjycsy')
    INSERT INTO dbo.sys_user (username, password, realName, role, status, userType, isShishi, isYanfa)
    VALUES ('cjycsy', (SELECT TOP 1 password FROM dbo.sys_user WHERE username = 'cjy002'), '测试员', 'user', 1, '内部员工', 1, 1);

  -- 1. 导入老库数据
  --    - 老库独有 12 列丢弃；新库独有 FanKuiQD/fanhuisj 置空
  --    - lsh：老库原值导入，绝不重建（HIS 代码按 lsh 对接，历史值必须一一对应；老库 8 个重复 lsh 属历史脏数据，保留原样）
  --    - BM 编码：姓名能匹配 sys_user.realName 则转编码；匹配不上统一填 cjycsy
  --    - 幂等：目标库已存在的 ID 跳过
  SET IDENTITY_INSERT dbo.yw_wentilb ON;

  INSERT INTO dbo.yw_wentilb (
    ID, LSH, banben, yiyuanmc, shishiry, mokuai, chuangtimc, wentilx, lvrusj,
    wentism, shouzhongcs, gongcscs, shouhoucs, shouzhongbz, gongchengsbz, shouhoubz,
    xgsj, xggcs, jingjicd, taolunbz, szcsgcs, shcsgcs, cssj,
    iFanhuicishu, shishiryBM, xggcsBM, szcsgcsBM, shcsgcsBM, FanKuiQD, fanhuisj
  )
  SELECT
    o.ID,
    o.lsh,   -- 老库 lsh 原值
    o.banben, o.yiyuanmc, o.shishiry, o.mokuai, o.chuangtimc,
    CONVERT(nvarchar(20), o.wentilx), o.lvrusj,
    o.wentism, o.shouzhongcs, o.gongcscs, o.shouhoucs,
    o.shouzhongbz, o.gongchengsbz, o.shouhoubz,
    o.xgsj, o.xggcs, o.jingjicd, o.taolunbz, o.szcsgcs, o.shcsgcs, o.cssj,
    ISNULL(o.iFanhuicishu, 0),
    ISNULL(u1.username, 'cjycsy'),   -- shishiryBM 跟进人编码
    ISNULL(u2.username, 'cjycsy'),   -- xggcsBM   修改工程师编码
    ISNULL(u3.username, 'cjycsy'),   -- szcsgcsBM 反馈人编码
    ISNULL(u4.username, 'cjycsy'),   -- shcsgcsBM 测试人编码
    NULL, NULL
  FROM cjy_wtfk.dbo.yw_wentilb o
  LEFT JOIN dbo.sys_user u1 ON u1.realName = o.shishiry AND o.shishiry IS NOT NULL AND o.shishiry <> ''
  LEFT JOIN dbo.sys_user u2 ON u2.realName = o.xggcs   AND o.xggcs   IS NOT NULL AND o.xggcs   <> ''
  LEFT JOIN dbo.sys_user u3 ON u3.realName = o.szcsgcs AND o.szcsgcs IS NOT NULL AND o.szcsgcs <> ''
  LEFT JOIN dbo.sys_user u4 ON u4.realName = o.shcsgcs AND o.shcsgcs IS NOT NULL AND o.shcsgcs <> ''
  WHERE NOT EXISTS (SELECT 1 FROM dbo.yw_wentilb n WHERE n.ID = o.ID);

  SET IDENTITY_INSERT dbo.yw_wentilb OFF;

  -- 2. 仅为 LSH 为 NULL 的行（新库原有 16 行，本就没有 lsh）按 ID 升序从当前 max(LSH)+1 起补号
  DECLARE @maxlsh int;
  SELECT @maxlsh = MAX(LSH) FROM dbo.yw_wentilb;

  ;WITH t AS (
    SELECT ID, ROW_NUMBER() OVER (ORDER BY ID) AS rn
    FROM dbo.yw_wentilb WHERE LSH IS NULL
  )
  UPDATE dbo.yw_wentilb SET LSH = @maxlsh + t.rn
  FROM dbo.yw_wentilb INNER JOIN t ON dbo.yw_wentilb.ID = t.ID;

  -- 3. LSH 唯一索引（老库重复已在导入前按方案 A 处理，导入后全表唯一，可建索引）
  --    保证"现在和以后"lsh 列不重复（兜底任何途径写入的重复）
  IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('dbo.yw_wentilb') AND name = 'UX_wentilb_LSH')
    CREATE UNIQUE NONCLUSTERED INDEX UX_wentilb_LSH ON dbo.yw_wentilb(LSH);

  -- 4. ok 取号表初始化 = 当前 max(LSH)（动态计算，不硬编码；正式库导入时按正式库数据现算）
  DECLARE @cur int;
  SELECT @cur = MAX(LSH) FROM dbo.yw_wentilb;
  IF EXISTS (SELECT 1 FROM dbo.ok)
    UPDATE dbo.ok SET lsh = @cur;
  ELSE
    INSERT INTO dbo.ok (lsh) VALUES (@cur);

  COMMIT;
  PRINT '导入完成';
END TRY
BEGIN CATCH
  ROLLBACK;
  PRINT '错误: ' + ERROR_MESSAGE();
END CATCH;

-- ============ 验证 ============
PRINT '=== 验证：总行数 / lsh 唯一性 / NULL ===';
SELECT COUNT(*) AS total_cnt,
       COUNT(DISTINCT LSH) AS distinct_lsh,
       SUM(CASE WHEN LSH IS NULL THEN 1 ELSE 0 END) AS lsh_null_cnt
FROM dbo.yw_wentilb;
PRINT '=== 验证：ok 表 ===';
SELECT lsh FROM dbo.ok;
PRINT '=== 验证：BM 编码分布 ===';
SELECT shishiryBM, COUNT(*) AS n FROM dbo.yw_wentilb GROUP BY shishiryBM ORDER BY n DESC;
PRINT '=== 验证：iFanhuicishu 分布 ===';
SELECT iFanhuicishu, COUNT(*) AS n FROM dbo.yw_wentilb GROUP BY iFanhuicishu ORDER BY iFanhuicishu;
PRINT '=== 验证：编号连续性（老库 lsh 段 + 补号段） ===';
SELECT MIN(LSH) AS min_lsh, MAX(LSH) AS max_lsh FROM dbo.yw_wentilb;
PRINT '=== 验证：老库 ID 保留抽查（ID=6638） ===';
SELECT ID, LSH, yiyuanmc, shishiry, shishiryBM, wentilx, iFanhuicishu FROM dbo.yw_wentilb WHERE ID IN (6638, 19797);
