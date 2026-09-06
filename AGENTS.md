# AGENTS.md — 新问题反馈系统（New_wtfk）

## 项目定位
HIS 问题反馈系统（Vue3 + Element Plus 前端 / NestJS + TypeORM 后端），团队新老技术衔接的练手项目 + 公司内部小项目。
工作目录：`E:\工作\HIS开发\新问题反馈系统\New_wtfk`

## 常用命令
- 前端 dev：`cd frontend && npm run dev`（端口 5173）
- 后端 dev：`cd backend && npm run start:dev`（端口 3001）
- 前端编译：`cd frontend && npm run build`（自动：bump 版本 → vite build → 生成变更清单）
- 后端编译：`cd backend && npm run build`（nest build → dist）
- 后台启动：`Start-Process cmd.exe "/c cd /d <dir> && npm run dev >> <根>\frontend-dev.log 2>&1" -WindowStyle Hidden`
- 健康检查：`curl http://localhost:5173/login` / `curl http://localhost:3001/api/dict/modules`

## 版本与编译机制
- 版本号在 `frontend/src/version.ts`（`APP_VERSION`），`frontend/scripts/bump-version.cjs` 在每次 build 前自动末位 +1
- 变更清单：`frontend/scripts/gen-changelog.cjs` 对比上次编译基线（git diff）自动生成，输出到 `docs\文档\`
- 基线状态存于根目录 `changelog-state.json`（运行状态文件，非文档）

## 归档规则（用户约定，必须遵守）
所有产出文件统一归档到 `docs\` 下，**禁止直接放项目根目录**：
- `docs\文档\`：文档类（方案、变更清单、升级记录、md/html 报告）
- `docs\截图\`：截图类（调试截图、界面截图）
- `docs\日志\`：日志类（前后台运行日志）
- `docs\其它\`：临时脚本、杂项

## 协作约定
- 用户亲自测试验证，助手负责修改；不要替用户大量测试
- 用户对主题配色/样式被覆盖问题极度敏感：颜色一律由主题系统控制，禁止硬编码颜色覆盖主题
- 测试数据可用英文，脏数据可不处理
- 回复使用中文
