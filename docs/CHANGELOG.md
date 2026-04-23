# 项目修改日志

## 2026-04-23

### 1. 创建 docs/ 文件夹
- 新建 `docs/` 文件夹，用于存放项目文档和修改记录

### 2. 修复反馈列表刷新问题
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

### 4. 更新前端数据加载逻辑
- **文件**：`frontend/src/views/feedback/index.vue`
- **修改**：更新 `loadData` 方法，正确处理新的响应格式

### 5. （之前的修改记录）
- 优化 dict.service.ts，尽量使用 TypeORM Repository 方法
- 配置 MSSQL 数据库连接
- 初始化数据库表结构
- 创建管理员账号
