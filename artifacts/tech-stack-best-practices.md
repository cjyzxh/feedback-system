# 与本系统技术栈直接相关的先进实践与开源参考项目调研报告

> 调研目的：为全新 HIS（创佳益新 HIS）架构设计提供依据。
> 调研日期：**2026-09-08**（star 数均为该日检索所得快照，或标注来源日期）
> 当前技术栈基线：Vue3 + Element Plus + Vite / NestJS + TypeORM / MSSQL + MySQL 双库
> 新 HIS 约束：SaaS 多租户、集团化连锁/单客户单体部署、信创环境（国产 OS/CPU、PG 系/MySQL 系国产数据库、国密算法）、颜色一律由主题系统控制（禁止硬编码覆盖主题）

---

## 目录

1. [NestJS 大型项目架构](#1-nestjs-大型项目架构)
2. [TypeORM 多数据库适配](#2-typeorm-多数据库适配)
3. [Vue3 大型中后台架构](#3-vue3-大型中后台架构)
4. [Node.js 在医疗场景的高并发/稳定性实践](#4-nodejs-在医疗场景的高并发稳定性实践)
5. [已查证 / 无法确认清单](#5-已查证--无法确认清单)
6. [创佳益新 HIS 技术选型建议清单](#6-创佳益新-his-技术选型建议清单)
7. [参考链接汇总](#7-参考链接汇总)

---

## 1. NestJS 大型项目架构

### 1.1 模块化 / 领域驱动分层（DDD）最佳实践

**官方立场**：NestJS 官方文档（docs.nestjs.com）明确其核心价值是"提供开箱即用的应用架构，使团队能构建高可测、可扩展、低耦合、易维护的应用"，模块系统（@Module）是组织单元；官方还提供 `@nestjs/cqrs`（CQRS 模块）与微服务支持，为 DDD 战术模式（命令/查询分离、事件溯源）提供官方积木。官方推荐的"轻量 DDD"落地方式是：**Module 作为模块边界 → 每个业务模块内部再按 domain / application / infrastructure 分层**。

**可参考的开源 DDD 项目（均已检索验证存在）：**

| 项目 | 说明 | Star（查询日期） |
|---|---|---|
| [brocoders/nestjs-boilerplate](https://github.com/brocoders/nestjs-boilerplate) | NestJS 最经典的企业级模板：Auth、TypeORM、Mongoose、Postgres、MongoDB、邮件、I18N、Docker、Seeding、Swagger。结构清晰、配套文档完整，适合作为单体/模块化项目起点 | 4.4k（2026-08-26 GitHub 主页显示 4,383） |
| [andrea-acampora/nestjs-ddd-devops](https://github.com/andrea-acampora/nestjs-ddd-devops) | DDD + Clean Architecture + 函数式编程 + DevOps（CI/CD/QA），明确采用 **Modular Monolith（模块化单体）** 模式，模块边界清晰 | 未直接获取（项目活跃，2026-08 有更新） |
| [chuanghiduoc/nestjs-boilerplate-enterprise](https://github.com/chuanghiduoc/nestjs-boilerplate-enterprise) | Enterprise 级：Clean Architecture + DDD + Hexagonal（六边形架构），**Multi-DB**、JWT/OAuth2、RBAC、Docker & K8s 就绪 | 未直接获取（2026-08 活跃） |
| [Henabakos/nestjs-enterprise-cqrs](https://github.com/Henabakos/nestjs-enterprise-cqrs) | CQRS + Clean Architecture + DDD，PostgreSQL + Docker，生产级 starter | 未直接获取 |
| [nestjslatam/ddd](https://github.com/nestjslatam/ddd) | `@nestjslatam/ddd-lib` DDD 库 + 示例应用：聚合根、值对象、领域事件、CQRS、Saga | 未直接获取 |
| [A3S-Lab/nestify](https://github.com/A3S-Lab/nestify) | pnpm workspace 化的 DDD 可复用后端包集合 + 示例 order API | 未直接获取 |
| [poliath/nest-ddd-generator](https://github.com/poliath/nest-ddd-generator) | DDD 脚手架生成器：自动生成 domain/DTO/entities/mappers/repositories 目录结构，保证团队架构一致性 | 未直接获取 |

**DDD 分层要点（综合上述项目与社区共识）：**

- **Strategic（战略设计）**：先划清模块/限界上下文边界（如患者主索引、医嘱、药品、收费、病案），模块间通过显式接口交互。
- **Tactical（战术设计）**：在模块内实现 领域层（实体/聚合/值对象/领域事件）→ 应用层（用例/CQRS 命令查询）→ 基础设施层（Repository 实现/TypeORM 实体映射）的三层结构，依赖方向始终指向内层（依赖倒置）。
- NestJS 中 DDD 常见落地：每个模块一个 `XxxModule`，内部建 `domain/`、`application/`、`infrastructure/` 子目录；Repository 用接口定义、TypeORM 实现注入；复杂业务用 `@nestjs/cqrs` 的 Command/Query/Event。

### 1.2 多租户（SaaS）设计模式

**三种主流方案对比（综合 syedarifiqbal.com、theartofcto.com、bufferbytes.io 等资料）：**

| 维度 | ① 共享数据库 + 共享 Schema（行级隔离） | ② 共享数据库 + 独立 Schema | ③ 独立数据库 |
|---|---|---|---|
| 隔离粒度 | 每张表加 `tenant_id` 列 | 每租户一个 schema（如 `tenant_xxx`） | 每租户一个物理库 |
| 成本 | 最低，单库单 schema | 中，单库多 schema | 最高，多实例/多库 |
| 数据隔离强度 | 弱（靠应用层强制过滤） | 中（库内 schema 隔离） | 强（物理隔离） |
| 扩容/备份 | 一起扩，一起备份 | 一起扩，schema 级备份 | 可单租户扩、单租户备份恢复 |
| 适合场景 | 小型 SaaS、成本敏感、租户量巨大 | 中型、租户间数据敏感度中等 | 大型客户/集团/医疗合规要求高 |
| 迁移/维护复杂度 | 最低 | 中（迁移需逐 schema 执行） | 高 |

**NestJS 中的实现方式（均已检索到实例）：**

- **行级隔离（方案①）**：
  - `TenantKit`（[AhmadS7/TenantKit](https://github.com/AhmadS7/TenantKit)）：NestJS 11 + TypeORM + **PostgreSQL Row-Level Security（RLS）**，通过 `SET LOCAL ROLE + set_config` 在**每次请求**内强制行级隔离；租户上下文用 **AsyncLocalStorage** 在请求作用域传播；配 JWT refresh rotation 与 RBAC。这是行级方案里安全度最高的实现（RLS 兜底，不依赖开发者自觉）。
  - `Multi-Tenant-SaaS-Starter-NestJS`（[OwaliShawon/Multi-Tenant-SaaS-Starter-NestJS](https://github.com/OwaliShawon/Multi-Tenant-SaaS-Starter-NestJS)）：row-level 租户隔离 + 自动作用域（automatic scoping），组织/用户/角色/严格隔离 + 计费就绪。
  - `PkLavc/saas-backend-platform`：共享库共享 schema，服务层强制 `organizationId` 过滤（文档明确其取舍：简单、可扩展、无 schema 重复；代价是每次查询必须严格过滤）。
  - 常见脚手架：Tenant 中间件从 `x-tenant-id` 头或 JWT 提取租户 → 请求作用域（`REQUEST` scope）或 AsyncLocalStorage 注入 → 自定义 `TenantAwareRepository` 在 `createQueryBuilder` 自动追加 `tenant_id = :tenantId`（CSDN 工程示例）。
- **独立 schema（方案②）**：`theartofcto.com` 的 SaaS 多租户指南给出 `provisionTenant` 模式：租户注册时 `CREATE SCHEMA tenant_${id}` → 对该 schema 跑迁移。TypeORM 中通过动态 `DataSource`/多数据源或 `schema` 配置实现。
- **独立数据库（方案③）**：租户注册时动态创建数据库连接（TypeORM 多 DataSource / 连接注册表），隔离最强但连接管理成本最高。

**给 HIS 的关键提示**：多租户方案与部署形态强相关——集团化连锁（多院区，可接受独立库或独立 schema）与单客户单体部署（单租户，直接共享库即可）很可能需要**混合模式**（租户元数据表记录每个租户的隔离级别与数据源配置，启动/运行时按租户路由）。

### 1.3 微服务 vs 单体模块化（HIS 场景建议）

**两种架构的取舍（综合 NestJS 官方文档、HIS 行业资料）：**

- **模块化单体（Modular Monolith）**：NestJS 天然适合。模块边界 = 未来服务边界；单库事务简单；部署/排障成本低；团队规模小时效率最高。`nestjs-ddd-devops` 项目即明确选择该模式。
- **微服务**：NestJS 原生支持（docs.nestjs.com/microservices，支持 TCP/Redis/RabbitMQ/gRPC/Kafka 等传输层）。优势是故障隔离、独立扩缩容；代价是分布式事务、网络故障、链路追踪复杂度剧增。经验法则：**没有清晰限界上下文就拆分 = 分布式单体（distributed monolith）**，是最坏情况。

**HIS 行业现状（检索到的公开资料）：**

- 国内主流新一代 HIS 大多采用 Java/Spring Cloud 微服务架构：解放军总医院多院区门诊云 HIS 案例（挂号收费、高值物资扫码、药品出入库、跨院医嘱核验等按服务拆分，配 Redis 缓存）；博客园《HIS 微服务完整拆分方案》给出行业通用拆分：用户权限中心、患者主索引（EMPI）、字典服务、医嘱、药房、收费结算等。
- 也有 HIS 项目采用"单体 + 微服务双模式"（HIS-master / his-cloud）供实施团队按医院规模选择。
- **Node.js 在 HIS 场景**：开源 Node.js HIS 项目极少（检索到 Myheart_Hospital_Project 等演示级项目，非生产级），生产 HIS 主流仍是 Java/.NET。这意味着本项目选 Node.js 属于"非主流但可行"路线，需要自己把架构质量做扎实（这正是本报告的意义）。

**建议结论（详见第 6 节）**：新 HIS 采用 **"模块化单体为主、预留服务化演进"**：NestJS 模块严格按限界上下文切分，模块间通过接口解耦；当出现明确独立扩展需求（如面向患者的互联网服务、消息推送）时，再拆为独立 Nest 微服务（可用官方 Redis/RabbitMQ 传输），不一步到位上微服务。

---

## 2. TypeORM 多数据库适配

### 2.1 多数据库支持的最佳实践

**官方能力（已查证）：**

- TypeORM 官方文档提供 **Multiple data sources** 专章（typeorm.io/docs/data-source/multiple-data-sources/）：创建多个 `DataSource` 实例连接不同数据库，实体按数据源分组。
- TypeORM 1.0 已于 2026-05-19 发布（官方博客，**36,400+ GitHub stars**，npm 周下载 4.7M+）：**MySQL 驱动仅保留 mysql2**（移除旧 mysql 客户端与 connectorPackage 选项）；官方与 NestJS 团队协作适配，`@nestjs/typeorm` v11.0.1 起支持 TypeORM 1.0。
- 支持的数据库类型：postgres、mysql、mariadb、mssql、oracle、sqlite、mongodb 等。
- NestJS 侧：`TypeOrmModule.forRoot()` 的 `name` 属性支持多连接（CSDN NestJS 实战教程）；`@nestjs/typeorm` 提供多数据源注入模式。

**连接管理 / 实体兼容要点（工程经验 + 资料佐证）：**

| 关注点 | 做法 |
|---|---|
| 连接管理 | 每数据库一个命名 `DataSource`（如 `MSSQL_DB`、`MYSQL_DB`、`PG_DB`），通过 `@InjectDataSource('xxx')` 注入；连接池参数（pool size、idleTimeout）按库单独配置 |
| 实体兼容 | ① 公共字段（主键、审计字段、软删除）用 TypeORM 装饰器（`@PrimaryGeneratedColumn`/`@CreateDateColumn`/`@UpdateDateColumn`/`@DeleteDateColumn`）自动生成，避免方言差异；② 类型选择取"三库交集"（如 `varchar`/`decimal`/`datetime`），`json` 类型在 MSSQL 上无原生列，需用 `nvarchar(max)` + 应用层序列化，或按库指定列类型（TypeORM 支持 `type: 'json'` 的驱动级降级处理，但 MSSQL 上实测需自行兜底——此项标注为"工程经验，未在本次检索中拿到官方权威出处"）；③ 避免数据库特有函数进实体查询，统一用 QueryBuilder 或 Repository API |
| 迁移策略 | 每个数据源独立迁移（`DataSource.runMigrations()`）；生产关闭 `synchronize`；迁移脚本由 `typeorm migration:generate` 按目标库生成，**多库切换时必须分别生成/校验**（SQL Server 的 DDL 与 MySQL/PG 不通用） |
| 分页差异 | MSSQL 用 `TOP/FETCH`（或 OFFSET-FETCH），MySQL/PG 用 `LIMIT ... OFFSET`；TypeORM 的 `take/skip`（或 `limit/offset`）会按方言生成正确 SQL，**业务代码一律走 API 分页，禁止手写方言 SQL** |
| JSON 字段差异 | PG 有 `jsonb`（可索引、可查询），MySQL 有 `json`（8.0+ 支持 JSON 函数），MSSQL 无原生 JSON 类型（有 `JSON_VALUE`/`ISJSON` 函数与 `nvarchar` 存储）——跨库 JSON 查询能力差异最大，建议仅做存储型 JSON，不在 JSON 内做跨库查询条件 |

### 2.2 国产数据库适配情况（已查证）

| 国产数据库 | 协议/兼容模式 | Node.js/TypeORM 适配结论 | 证据 |
|---|---|---|---|
| **OceanBase** | MySQL 兼容模式（默认）+ Oracle 模式 | ✅ **官方文档明确支持 TypeORM + mysql2 驱动**（OceanBase 文档中心《使用 TypeORM 连接 OceanBase 数据库》V4.3.5，2026-04） | oceanbase.com 官方文档 |
| **KingbaseES（人大金仓）** | PostgreSQL 兼容（主）+ **MySQL 原生通信协议兼容（端口 3308）** + Oracle 兼容 | ✅ 可用 pg 驱动（PG 模式）或 mysql2 驱动（MySQL 协议模式）；金仓官方确认 Node.js npm Registry 有支持 | help.kingbase.com.cn 官方手册、CSDN 金仓开发生态盘点 |
| **GaussDB / openGauss** | PostgreSQL 兼容（openGauss 系）；GaussDB(for MySQL) 为 MySQL 兼容 | ✅ 通用 MCP 连接器已按 PG 协议接入；工程上可用 pg 驱动（openGauss 系） | 通用数据库连接器项目资料 + 行业资料 |
| **Vastbase G100** | 兼容 PostgreSQL 与 MySQL 双模式 | ✅ 行业平台已实现 Provider 适配（PG 模式为主） | 赛意谷神工业互联网平台数据库参考手册 |

**结论**：TypeORM 对国产数据库的策略是"**借道协议**"——PG 系（KingbaseES PG 模式、GaussDB、Vastbase PG 模式）用 `pg` 驱动；MySQL 系（OceanBase MySQL 模式、KingbaseES MySQL 兼容端口、GaussDB for MySQL）用 `mysql2` 驱动；**不需要厂商专用驱动**。但需注意：国产库对 PG/MySQL 的兼容不是 100%（分页、JSON 函数、DDL 细节有差异），迁移到国产库前必须做方言回归测试。此项差异明细属于"无法在本次检索中穷举确认"，建议立项后联系厂商要适配清单。

### 2.3 连接池 / 读写分离 / 软删除 / 审计字段的通用封装

- **连接池**：TypeORM `DataSource` 的 `pool` 配置（底层用对应驱动连接池：mysql2/pg/tedious 各自实现）；企业实践 `poolSize` 默认 10，按并发调整（CSDN 企业级架构设计文章）。
- **读写分离/复制**：TypeORM 官方 **replication 配置**（master/slaves 列表，读走从库、写走主库）在多数据源文档中有专门章节；在 MSSQL 上需确认 AlwaysOn 监听器方式（此项未深入验证）。
- **软删除**：`@DeleteDateColumn` + `softRemove`/`softDelete`，查询自动过滤已删除行（`withDeleted` 可查含删除数据）——官方实体文档已确认。
- **审计字段**：`@CreateDateColumn`/`@UpdateDateColumn` 自动维护；业务审计（谁在何时改了什么）用 TypeORM **Subscriber（`EntitySubscriberInterface`）** 或自定义 BaseEntity 统一封装，记录操作人（结合 NestJS 请求上下文/CLS）。
- 第三方扩展：`@nest-extended/typeorm`（npm）提供内置分页、可配置软删除（CLS 用户追踪）、批量操作——可作为自研封装的参考。

---

## 3. Vue3 大型中后台架构

### 3.1 组件库选型对比（医疗中后台场景）

| 维度 | Element Plus | Ant Design Vue | Naive UI |
|---|---|---|---|
| Star（2026-09-08 检索） | **27.7k**（GitHub org 2026-09-02） | 未直接查证 | **18.5k**（npm-compare 2026-09-04） |
| 样式方案 | theme-chalk + **CSS 变量**，暗色模式开箱 | Ant Design 设计体系 | TS 源码，主题引擎灵活（可深度定制） |
| 维护 | Element 团队，迭代频率高，社区最大 | Ant Design 社区，生态大（ProComponents） | 核心维护者少，有单点风险 |
| 医疗中后台适配 | 组件覆盖最快、上手成本最低、**中文文档最全**、坑都有答案 | 企业级设计体系完整、国际化好，适合金融/复杂业务 | 样式自由度最高，但组件生态与社区相对小 |
| 团队现状匹配 | ✅ 与当前项目一致，可复用既有经验 | 换库成本高，视觉体系需重建 | 主题定制强，但违反"团队新老衔接"的平稳诉求 |

**结论（综合 CSDN/SegmentFault/掘金等对比资料）**：中后台/桌面端场景 **Element Plus 优先**——组件覆盖、中文文档、社区成熟度最优；Ant Design Vue 适合要与蚂蚁体系对齐的场景；Naive UI 适合重度样式定制但需承担维护单点风险。**对本项目而言：继续使用 Element Plus，且因其 CSS 变量主题体系，天然满足"颜色由主题系统控制、禁止硬编码覆盖"的约束**。

### 3.2 Pinia 最佳实践（与服务端状态同步）

- **按域拆分 store**：`auth`（登录态/用户信息）、`permission`（权限码/动态路由）、`app`（主题/布局/多标签页）等，避免单一大 store（CSDN 权限架构文章推荐模式）。
- **setup 语法 + TS**：`defineStore` 使用 setup 函数风格，类型推导最佳。
- **持久化**：`pinia-plugin-persistedstate` 持久化登录态/权限（刷新不丢失）。
- **与服务端状态同步**：store 内只放服务端返回的"快照"（用户信息、权限码、字典），业务数据尽量走组件内/组合式函数按需请求，避免全量缓存导致的脏数据；权限码在登录后一次性拉取放入 `permission` store。

### 3.3 权限体系（路由级 / 按钮级 / 数据权限）

检索到的成熟实现模式（CSDN/51CTO/掘金多篇文章一致）：

1. **后端返回权限码数组**：登录后接口返回 `['dashboard:view', 'user:list', 'user:add']` 与用户信息，存入 Pinia。
2. **路由级权限**：静态路由（登录页/403）+ 动态路由（带 `meta.permission` 的私有路由）；路由守卫 `router.beforeEach` 中：未登录跳登录页（带 redirect）、已登录但无权限跳 403；登录后用 `addRoute` 动态注入有权限的路由，菜单由路由表驱动生成。
3. **按钮级权限**：自定义指令 `v-permission="'user:add'"`，无权限时移除/禁用元素（DOM 级）；这是后台管理系统按钮权限的通用方案。
4. **数据权限**：前端通常只做"数据范围提示"（如 `{ merchant: ['self','sub'] }`），真正的行级过滤必须后端强制（对应第 1.2 节多租户行级隔离的同一套机制）；前端不做数据权限的兜底。

### 3.4 推荐的开源中后台模板项目（star 均为 2026-09-08 检索快照）

| 项目 | 说明 | Star |
|---|---|---|
| [anncwb/vue-vben-admin](https://github.com/anncwb/vue-vben-admin) | Vue3 + Vite + TS + Pinia + **Element Plus**（默认）的旗舰模板：动态权限、多标签页、主题配置、Mock；文档完善 | **≈28.6k**（CSDN 2026-07 数据，第三方来源） |
| [pure-admin/vue-pure-admin](https://github.com/pure-admin/vue-pure-admin) | 全 ESM + Vue3 + Vite + **Element Plus** + TS，兼容移动端；动态路由、权限系统、暗色、多标签、水印、主题定制 | **20.6k**（GitHub org 2026-08-23） |
| [honghuangdc/soybean-admin](https://github.com/honghuangdc/soybean-admin) | Vue3 + Vite + TS + Pinia + **Naive UI** + UnoCSS，有 antd / element-plus 版本分支 | **≈14.8k**（GitHub 主页 2026-09-07） |
| [zclzone/vue-naive-admin](https://github.com/zclzone/vue-naive-admin)（Vue Naive Admin） | 轻量 Naive UI 后台，代码紧凑、易读（约 3.9k star，2026-08 第三方数据） | ≈3.9k |

**建议**：团队当前已用 Element Plus，**以 vue-pure-admin（20.6k，ESM 工程化标杆）或 vue-vben-admin（28.6k，功能最全）为参考模板**；其中 vue-vben-admin 的权限体系（动态路由 + 按钮指令 + 主题配置）与"主题系统控制颜色"的要求最贴合。注意：模板仅作参考基底，医疗业务组件（病历、医嘱、收费）需自建。

---

## 4. Node.js 在医疗场景的高并发/稳定性实践

### 4.1 连接池、超时、重试

- **SQL Server 连接**：官方维护的 `tediousjs/node-mssql`（GitHub 2026-09 活跃）——`pool: { max, min, idleTimeoutMillis }`，内置连接健康检查（死连接自动替换）；**必须挂 error 监听**，否则池内连接错误会静默丢连接（node-mssql 文档明确提示）。
- **连接池参数经验值**（CSDN 多篇实战）：max 10~50（按服务器资源），min 5~10（避免冷启动抖动），idleTimeoutMillis 30~120s（高频应用延长到 60-120s），`acquireTimeout` 需显式配置；SQL Server 侧 `Max Pool Size ≤ 200`。
- **三层超时设计**（千万 QPS 架构公开课总结）：应用总超时 > 连接池 checkout 超时 + SQL 执行超时，**内层超时之和不能超过外层**；checkout 超时建议为业务总超时的 20%~30%；命令超时（Command Timeout）按业务调整，避免长查询永久占连接。
- **重试**：对瞬态故障（连接中断、超时、锁死锁重试场景）采用**指数退避**（exponential backoff）+ 最大重试次数限制；重试必须带 jitter，避免"重试放大为全站雪崩"（连接故障处理公开课警示）。

### 4.2 日志与链路追踪

- **日志**：`pino`（结构化 JSON、性能顶级）+ NestJS 集成 `nestjs-pino` 或 `pino-nestjs`（请求上下文自动注入每条日志）。
- **链路追踪**：**OpenTelemetry**（Node.js SDK + 自动插桩）采集 trace/span，`trace_id`/`span_id` 通过 pino mixin 注入日志，实现"日志 ↔ 链路"关联；阿里云 ARMS 等平台支持 Node.js OTel 上报（阿里云帮助中心文档）。
- **请求关联 ID**：`AsyncLocalStorage` + request-id 中间件 + pino 子 logger，让同一请求的所有日志共享 `req_id`（pino 2026 生产实践文章）——排查 HIS 慢查询/卡单问题时是最高性价比的工程手段。

### 4.3 与 SQL Server 大事务 / 长查询的配合

- 大事务：拆小、控制事务内网络往返；长查询走异步 + 超时 + 可取消（node-mssql 的 `request.cancel()`），避免占用连接池。
- 结合本系统现状（SQL Server 复杂 UDF、百万级表）：**复杂报表/统计查询建议走只读副本或独立查询数据源**，与主业务连接池隔离，防止慢查询拖垮在线交易（读写分离的典型动机）。
- 医疗场景参考：解放军总医院多院区云 HIS 采用微服务 + Redis 缓存减轻数据库读压力（CHIMA 案例）；这是 HIS 高并发（早高峰挂号、结算）的通用套路——**缓存热数据（字典、科室、排班），数据库只承载强一致写与核心读**。

---

## 5. 已查证 / 无法确认清单

### 已查证（本次检索有直接来源）

| 条目 | 证据 |
|---|---|
| TypeORM 1.0 发布、36.4k+ star、仅 mysql2、@nestjs/typeorm v11.0.1 支持 | typeorm.io 官方博客（2026-05-19） |
| TypeORM 多数据源官方文档、replication 配置 | typeorm.io/docs/data-source/multiple-data-sources/ |
| TypeORM 软删除 `@DeleteDateColumn` / 审计 `@CreateDateColumn`/`@UpdateDateColumn` | TypeORM 实体文档 |
| OceanBase 官方支持 TypeORM + mysql2 | OceanBase 文档中心（V4.3.5） |
| KingbaseES MySQL 协议兼容（3308 端口）、PG 兼容、Node.js npm 支持 | 金仓官方手册 + CSDN 生态盘点 |
| Element Plus 27.7k star、Naive UI 18.5k star | GitHub org / npm-compare（2026-09） |
| vue-pure-admin 20.6k star、SoybeanAdmin 14.8k star | GitHub org / 作者主页（2026-08/09） |
| vue-vben-admin ≈28.6k star | CSDN 文章（2026-07，第三方） |
| brocoders/nestjs-boilerplate 4.4k star | GitHub brocoders 主页（2026-08-26） |
| NestJS 原生微服务支持、官方文档结构 | docs.nestjs.com |
| node-mssql 连接池/健康检查/错误监听要求 | tediousjs/node-mssql GitHub README |
| pino + OpenTelemetry 日志链路关联模式 | pino-nestjs / nest-logger / hirenodejs 文章 |
| HIS 行业微服务拆分方案、解放军总医院多院区云 HIS 案例 | 博客园 + CHIMA |
| 国内电子病历标准以 HL7/FHIR 为主、FHIR 全国互认推进 | HL7 中国委员会、健康界 |

### 无法确认 / 需进一步验证

| 条目 | 说明 |
|---|---|
| NestJS 主仓库（nestjs/nest）精确 star | 本次检索未直接返回精确值，未列具体数字 |
| Ant Design Vue 精确 star | npm-compare 表格未收录，未直接查证 |
| MSSQL 上 TypeORM `json` 列的官方行为 | 官方文档未给出 MSSQL JSON 专项说明，按工程经验处理（nvarchar + 应用层序列化），建议实测 |
| KingbaseES/GaussDB/Vastbase 与 TypeORM 的官方认证清单 | 未见 TypeORM 官方"国产库认证列表"，兼容性基于协议兼容推断，需向厂商索取适配清单 + 做方言回归测试 |
| Node.js 生产级开源 HIS 项目 | 检索到的均为演示/学习级，生产 HIS 主流仍是 Java/.NET，无成熟 Node.js HIS 可对标 |
| RLS 方案在 MSSQL 上的等价实现 | RLS 是 PG 特性；MSSQL 对应能力较弱（无等价行级安全策略），共享库方案在 MSSQL 上只能靠应用层强制过滤 + 数据库视图/同义词辅助 |

---

## 6. 创佳益新 HIS 技术选型建议清单

### 后端（NestJS + TypeORM）

1. **架构形态：模块化单体优先，预留服务化演进。** 按限界上下文划分 NestJS 模块（患者主索引/医嘱/药品/收费/病案/字典/权限），模块内采用 DDD 三层（domain/application/infrastructure），参考 brocoders/nestjs-boilerplate 起步、nestjslatam/ddd 的战术模式。集团化连锁若出现独立部署需求，再按官方微服务文档拆分。
2. **多租户：租户元数据驱动 + 混合隔离。** 采用"租户表记录隔离级别与数据源配置"，默认小型/单体客户走**共享库共享 schema + 强制 tenant_id 过滤**（低成本，覆盖单客户单体部署）；中大型集团走**共享库独立 schema**；合规要求高的机构走**独立数据库**。实现上：请求作用域/AsyncLocalStorage 承载租户上下文，自定义 `TenantAwareRepository` 自动追加租户条件；若主库为 PG 系，可上 RLS 兜底（参考 TenantKit）；MSSQL 上只能应用层强制过滤 + 数据库层视图辅助。
3. **多数据库：统一抽象层 + 每库独立 DataSource。** MSSQL（现有业务主库）/MySQL（现有）/PG（信创主目标）各自命名 DataSource；实体字段取三库交集类型；分页统一走 `take/skip`；JSON 仅作存储型字段（MSSQL 用 nvarchar 兜底）；生产关闭 synchronize、每库独立迁移；预留**国产库适配层**——PG 系（KingbaseES/GaussDB/Vastbase）切 `pg` 驱动、MySQL 系（OceanBase/金仓 MySQL 端口）切 `mysql2` 驱动，上线前按厂商适配清单做方言回归。
4. **稳定性基建：** 连接池按库独立调参（min 5~10 / max 按并发 / idleTimeout 60-120s）；三层超时设计（总超时 > checkout + 执行）；指数退避 + jitter 重试（仅瞬态故障）；pino + OpenTelemetry（trace_id 注入日志，AsyncLocalStorage 关联 req_id）；报表/统计查询走独立只读数据源，与在线交易隔离。
5. **软删除与审计统一封装：** 基类实体内置 `@CreateDateColumn/@UpdateDateColumn/@DeleteDateColumn`，业务审计用 Subscriber + 操作人上下文，一套代码三库生效。

### 前端（Vue3 + Element Plus + Vite）

6. **组件库：继续使用 Element Plus。** 与现技术栈衔接最顺、中文文档最全、社区最大；CSS 变量主题体系天然满足"颜色由主题系统控制、禁止硬编码覆盖"的约束（主题定制走 `--el-color-*` 变量，组件内禁止写死色值）。
7. **模板基底：参考 vue-vben-admin（28.6k，权限体系最全）或 vue-pure-admin（20.6k，ESM 工程化标杆）。** 重点借鉴：动态路由 + 路由守卫 + `v-permission` 按钮指令 + Pinia 分域 store（auth/permission/app）+ 持久化；医疗专属组件（病历、医嘱、收费界面）自建。
8. **权限体系：三级落地。** 路由级（守卫 + addRoute）、按钮级（v-permission 指令）、数据权限（后端强制，前端仅提示范围）；权限码由后端统一返回。
9. **信创前端注意：** 目标国产浏览器/OS 兼容（麒麟/UOS + 奇安信/360 等），构建目标按 ES2015+ 兼容配置；字体、组件库图标等资源本地化，避免 CDN 依赖。

### 标准与合规

10. **预留医疗互操作标准位。** 国内电子病历以 HL7/FHIR 为主导方向（HL7 中国委员会已发布基于 API + FHIR 的跨机构病历交换指南），新 HIS 的对外接口层建议按 FHIR Resource 风格建模（RESTful + JSON），为互联互通测评与跨院数据交换留口；核心业务内部不强上标准，但字典/编码体系对齐国家卫生信息标准（此项为行业趋势判断，接口实现细节需后续专项设计）。

### 部署形态

11. **一套代码、多形态部署。** 通过配置（环境变量/租户元数据）区分：单客户单体部署（1 库 1 实例）、集团化连锁（独立 schema 或独立库）、SaaS 平台（共享库 + 行级隔离）；信创环境通过数据库驱动切换层适配国产库，国密算法通过可插拔加密服务接入（SM2/SM3/SM4，具体接入方案建议后续专项调研确认）。

---

## 7. 参考链接汇总

**NestJS 架构/DDD/多租户**
- https://docs.nestjs.com/ （官方文档）
- https://docs.nestjs.com/microservices/basics
- https://github.com/brocoders/nestjs-boilerplate
- https://github.com/andrea-acampora/nestjs-ddd-devops
- https://github.com/nestjslatam/ddd
- https://github.com/A3S-Lab/nestify
- https://github.com/Henabakos/nestjs-enterprise-cqrs
- https://github.com/AhmadS7/TenantKit
- https://github.com/OwaliShawon/Multi-Tenant-SaaS-Starter-NestJS
- https://github.com/PkLavc/saas-backend-platform
- https://syedarifiqbal.com/blog/multi-tenant-saas-isolation
- https://theartofcto.com/architectures/saas-multi-tenant
- https://dev.to/tak089/multi-tenant-architecture-a-complete-guide-basic-to-advanced-119o

**TypeORM / 国产数据库**
- https://typeorm.io/docs/data-source/multiple-data-sources/
- https://typeorm.io/blog/typeorm-1-0/
- https://www.oceanbase.com/docs/common-oceanbase-database-cn-1000000003131282 （TypeORM + OceanBase）
- https://help.kingbase.com.cn/v9/intro/releasenotes-external-v9/V9.1.1.14.html
- https://github.com/tediousjs/node-mssql
- https://www.npmjs.com/package/@nest-extended/typeorm

**Vue3 中后台**
- https://github.com/anncwb/vue-vben-admin
- https://github.com/pure-admin/vue-pure-admin
- https://github.com/honghuangdc/soybean-admin
- https://segmentfault.com/a/1190000047709818 （2026 Vue3 UI 组件库生态）
- https://npm-compare.com/ant-design-vue,bootstrap-vue,element-plus,naive-ui,vuetify

**Node.js 稳定性/可观测**
- https://github.com/moshclouds/node-observability-with-lgtm
- https://pino-nest.js.org/
- https://www.hirenodejs.com/blog/nodejs-pino-logging-production-2026
- https://help.aliyun.com/zh/arms/tracing-analysis/monitor-node-js-applications/

**HIS 行业**
- https://chima.org.cn/Html/News/Articles/16907.html （解放军总医院多院区云 HIS）
- https://www.cnblogs.com/starfish29/p/20773382 （HIS 微服务拆分方案）
- https://www.hl7.org.cn/newsinfo/10732758.html （FHIR 跨机构病历交换指南）

---

*报告完。所有 star 数均为 2026-09-08 前后检索快照；"未直接获取/无法确认"条目已在第 5 节明示，未作任何编造。*
