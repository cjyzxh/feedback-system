-- ===========================================
-- 创建用户表和管理员账号
-- ===========================================

-- 1. 创建用户表（如果不存在）
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_user]') AND type in (N'U'))
BEGIN
    CREATE TABLE sys_user (
        id INT IDENTITY(1,1) PRIMARY KEY,
        username NVARCHAR(50) NOT NULL UNIQUE,
        password NVARCHAR(200) NOT NULL,
        realName NVARCHAR(50),
        email NVARCHAR(100),
        phone NVARCHAR(20),
        role NVARCHAR(20) DEFAULT 'user',
        status INT DEFAULT 1,
        createTime DATETIME DEFAULT GETDATE(),
        updateTime DATETIME DEFAULT GETDATE()
    );
    PRINT '✅ 表 sys_user 创建成功';
END
ELSE
BEGIN
    PRINT 'ℹ️  表 sys_user 已存在';
END

-- 2. 检查 admin 用户是否存在
IF NOT EXISTS (SELECT * FROM sys_user WHERE username = 'admin')
BEGIN
    -- 插入默认管理员账号
    -- 密码 admin123 的 bcrypt 哈希值
    INSERT INTO sys_user (username, password, realName, email, phone, role, status)
    VALUES (
        'admin', 
        '$2b$10$zElWi2FgV1FVx3gO4v9lSO.G2WWRHbnKFtNSHC004AqOOxz2qkzHa', 
        '系统管理员', 
        'admin@example.com', 
        '13800138000', 
        'admin', 
        1
    );
    PRINT '✅ 管理员账号 admin 创建成功';
    PRINT '   用户名: admin';
    PRINT '   密码: admin123';
END
ELSE
BEGIN
    PRINT 'ℹ️  管理员账号 admin 已存在';
END

-- ===========================================
-- 验证
-- ===========================================
SELECT * FROM sys_user WHERE username = 'admin';

