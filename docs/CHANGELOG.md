# 项目修改日志

## 2026-04-24

### 7. 短信认证功能开发
- **新增文件**：
  - `backend/src/modules/sms/sms.service.ts` - 短信服务
  - `backend/src/modules/sms/sms.module.ts` - 短信模块
  - `backend/.env.example` - 环境变量配置示例
- **修改文件**：
  - `backend/src/modules/auth/auth.service.ts` - 集成短信发送功能
  - `backend/src/modules/auth/auth.module.ts` - 引入短信模块
  - `backend/package.json` - 添加依赖 (@nestjs/axios, axios)
- **功能说明**：
  - 发送短信验证码接口
  - 短信验证码登录
  - 开发模式下短信发送失败会模拟成功（便于调试）
  - 支持环境变量配置短信服务（用户名、密码、API地址）

---

## 2026-04-23

### 6. 初始化 Git 仓库并首次提交
- **文件**：新建 `.gitignore` 文件
- **操作**：
  - 初始化 git 仓库
  - 创建标准的 Node.js 项目 .gitignore（排除 node_modules、dist、环境变量文件等）
  - 首次提交 111 个文件到本地仓库
  - 提交信息："初始化项目 - HIS问题反馈系统"

---

### 5. 创建 docs/ 文件夹
- 新建 `docs/` 文件夹，用于存放项目文档和修改记录

### 4. 修复反馈列表刷新问题
- **文件**：`backend/src/modules/feedback/feedback.service.ts`
- **修改**：
  - `findAll` 方法改回使用原生 SQL 查询，避免实体列名与数据库不匹配问题
  - `findById` 方法改回使用原生 SQL 查询
  - 保留完整的错误处理逻辑，确保即使出错也不会挂掉
- **问题原因**：实体定义的列名与数据库实际表结构不匹配，导致 TypeORM QueryBuilder 查询失败

### 3. 统一反馈控制器返回格式
- **文件**：`backend/src/modules/feedback/feedback.controller.ts`
- **修改**：所有接口方法都改回 async/await，并统一返回格式 `{ code: 200, message: "...", data: ... }`
- **修改的接口**：
  - `POST /api/feedback` - 创建反馈
  - `GET /api/feedback` - 查询列表
  - `GET /api/feedback/:id` - 查询详情
  - `PUT /api/feedback/:id` - 更新反馈
  - `DELETE /api/feedback/:id` - 删除反馈
  - `POST /api/feedback/batch-delete` - 批量删除

### 2. 更新前端数据加载逻辑
- **文件**：`frontend/src/views/feedback/index.vue`
- **修改**：更新 `loadData` 方法，正确处理新的响应格式

### 1. （之前的修改记录）
- 优化 dict.service.ts，尽量使用 TypeORM Repository 方法
- 配置 MSSQL 数据库连接
- 初始化数据库表结构
- 创建管理员账号
