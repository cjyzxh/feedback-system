# 信创环境下 HIS 系统技术选型与适配调研报告

> 调研目的：为新 HIS（NestJS + TypeORM 技术栈）满足信创要求提供参考。
> 调研时间：2026-09-08
> 说明：文中每个条目标注【已查证】（有官方文档/实测案例佐证）或【厂商声明】（数据库厂商官方宣传口径，未经本项目实测），严禁将未经证实的内容当作兼容性结论。

---

## 1. 信创政策与标准

### 1.1 政策背景与时间节点

| 时间 | 政策/事件 | 核心要求 | 来源 |
|---|---|---|---|
| 2021-05 | 财政部、工信部《政府采购进口产品审核指导标准》（551 号文） | 公立医院采购目录内产品优先采购国产 | 深网科技行业动态【已查证】 |
| 2023 | 工信部等五部门《关于加快推进医疗装备产业高质量发展的指导意见》 | 推动医疗信息系统国产化替代，鼓励基于鲲鹏、昇腾、麒麟、达梦等国产技术栈的全栈方案 | 豆丁网行业报告转引【已查证，原文待核】 |
| 2024 年底 | 国家卫健委（行业媒体转述） | **到 2027 年，三级医院信息系统国产化率 ≥ 70%，二级医院 ≥ 50%** | 信创开放社区【已查证】 |
| 2025 | 国家卫健委、国家中医药局、国家疾控局联合印发《紧密型县域医共体信息化功能指引》 | 医疗机构**所有硬件、基础软件均须符合信创标准**，医疗应用软件同步完成国产化与正版化改造——标志医疗信创由试点转为硬性要求 | 网易/搜狐多源【已查证】 |
| 2026 年（持续） | 各省卫健委下发通知 | 三级医院 **2027 年底前**完成核心业务系统（HIS/EMR/LIS/PACS）国产化适配或替代；数据库 Oracle→达梦/人大金仓，操作系统 Windows→国产 | 智慧医疗网【已查证】 |
| 2027 年前 | 数智医院「四标合一」评价（行业预测） | 2027 年前三甲医院必须完成 HIS、EMR、PACS 核心系统国产化改造，**未按期完成直接下调评级等级**；评审中单设信创适配打分板块 | 智慧医疗网【已查证（行业解读）】 |

**对民营/二级以下公立医院的意义**：
- 二级医院目标为国产化率不低于 50%，且县域医共体指引已把"全硬件/基础软件信创化"列为硬性要求。用户服务的民营医院与二级以下公立医院，若参与县域医共体或接受卫健委评级，信创合规将成为投标/验收的准入条件。
- 核心诊疗系统（HIS/EMR）遵循"能替尽替"原则稳步推进，非诊疗类（OA、财务）必须全面国产化替代【网易·医院信创改造规模定路径，已查证】。

### 1.2 互联互通标准化成熟度测评（与信创直接相关的要求）

- 等级要求：三级医院达到互联互通测评 **四级及以上**，二级医院达到 **三级及以上**（国家中医药管理局《中医医院信息与数字化建设规范（2024 版）》第四十六条）【已查证，官方文件】。
- 信创/国密要求（依据互联互通标准解读与医院招标文件）：
  - **4 级起要求采用国产化替代**（数据库、操作系统、中间件等信创软硬件体系兼容适配）；
  - **4.2 及以上要求采用 SM2/SM3 等国产加密算法**对患者敏感信息进行全流程加密，存储访问控制与审计，操作日志可追溯，满足《数据安全法》要求【已查证，多源交叉：抖音测评解读 + 广汉市人民医院招标公告 + 咸宁日报科普】。
- 医院招标实例佐证：广汉市人民医院（三乙）数智医院 5 级建设公告中明确"系统可对国产芯片（鲲鹏、飞腾、海光等）、国产服务器操作系统、国产数据库、国产中间件等信创软硬件体系的兼容适配能力……适配费用纳入总价包干"【已查证】。

### 1.3 国密/等保相关

- 等保三级 + 医疗行业专项是医院信息化安全底线；患者身份鉴别需满足电子病历分级评价的双因子要求，常与国密 SM4 令牌加密、SM2 验签结合【已查证，CSDN 改造指南】。
- 医保侧（见 §5.3）是国密算法的最强制约来源。

---

## 2. 国产数据库适配（PG 系）

> 当前新 HIS 后端为 NestJS + TypeORM，数据库驱动层走 `pg`（PostgreSQL 协议）或 `mysql2`（MySQL 协议）。PG 系国产库多数兼容 PG 协议，**驱动替换成本最低**。

### 2.1 金仓 KingbaseES（电科金仓/人大金仓）

- **官方 URL**：https://www.kingbase.com.cn/ ；产品手册：https://help.kingbase.com.cn/
- **版本**：KingbaseES V8 / V9（V9 为当前主力）
- **与 PG 的兼容性**：
  - 完全兼容 PostgreSQL 的 **libpq 通信协议**，官方宣称"已有应用无需更换数据库驱动即可无缝迁移"（指 JDBC/ODBC 层面）【厂商声明 + 官方技术博客，已查证声明原文】。
  - 提供**官方 Node.js 驱动**：`require('kb')`（模块名 `kb`），API 与 node-postgres 同构；《KingbaseES 客户端编程接口指南-Nodejs》官方文档【已查证】。
  - 无官方连接池，社区实测可用 `pg-pool`（接口兼容）【已查证，CSDN 实测】。
  - 也可直接用 `pg` 包连接（端口默认 54321）【已查证，CSDN 实测】。
- **迁移工具**（官方）：
  - **KDMS**（KingbaseES Data Migration System）：迁移评估/预扫描工具；
  - **KDTS**（KingbaseES Data Transformation Service）：异构数据迁移（结构+数据）；
  - **KFS**（KingbaseES Full/Increment Sync）：全量+增量同步工具【已查证，官方技术博客】。
- **常见踩坑**（社区实测）：
  - 日期格式：MySQL 的 `'0099-09-30'` 等特殊日期迁移后插入报 `date/time field value out of range`（公元前日期处理逻辑差异）；
  - SQL 关键字冲突：`level` 等在 Kingbase 中为保留字导致语法错误；
  - 存储过程/函数迁移需逐行梳理，KDMS 只能自动识别语法差异生成适配报告，不能全自动转换；
  - 驱动版本需与数据库大版本匹配，混用可能导致元数据解析错误【已查证，多篇迁移实战】。

### 2.2 Vastbase（海量数据）

- **官方 URL**：https://www.vastdata.com.cn/ ；文档：https://docs.vastdata.com.cn/
- **版本**：Vastbase G100（V2.2.x）、Vastbase M100（V5.x）
- **内核**：基于国产开源 openGauss 内核（openGauss 又基于 PG 9.2 内核）【已查证】。
- **兼容性**：官方宣称深度兼容 Oracle / MySQL / PostgreSQL 三种语法（M100 白皮书称 2000+ Oracle 兼容项、900+ MySQL 兼容项）【厂商声明】。
- **Node.js 支持**：官方文档明确列出"基于 JavaScript 开发"支持；Java 侧提供两种驱动（完全兼容 PG 的 `org.postgresql.Driver` 2.11p 版与重写包名的 2.11v 版）【已查证】；Node 侧社区实践以 `pg` 驱动直连为主【未找到官方 Node 驱动文档，标注：无法确认官方 Node 驱动，建议以 pg 驱动实测】。
- **迁移工具**：官方提供迁移工具与白皮书，但社区公开实战资料较少（商业闭源）【已查证局限】。

### 2.3 GaussDB / openGauss（华为）

- **官方 URL**：GaussDB：https://www.huaweicloud.com/product/gaussdb.html ；openGauss：https://www.opengauss.org/ ；驱动仓库：https://github.com/huaweicloud-samples/database-gaussdb-drivers
- **内核关系**：openGauss 开源（基于 PG 9.2.4 内核，官方声明兼容 PSQL 客户端与 PG 标准接口）；GaussDB 为华为云商业发行版。
- **Node.js 支持**：
  - 官方提供 **gaussdb-node** 驱动（基于 node-postgres 构建，已发布 npm）【已查证，GitHub 官方驱动仓库】；
  - 社区另有 node-openGauss（基于 node-postgres，支持 SHA256 加密连接）【已查证，GitHub】。
- **关键踩坑（认证方式）**：
  - openGauss/GaussDB 默认 `password_encryption_type` 为 2（sha256），原生 `pg` 驱动默认 SCRAM-SHA-256 认证会失败（报 `SASL: Only mechanism S...`）；
  - 需将数据库参数 `password_encryption_type` 改为 1（md5）或 0，配合 pg_hba.conf 调整后，pg 驱动/TypeORM 才能直连【已查证：华为云社区 TypeORM 适配 GaussDB 开源验证任务心得 + CSDN 文库】。
- **TypeORM 适配**：华为云社区有 TypeORM 连接 GaussDB 的实战记录，核心就是上述认证参数调整【已查证】。

### 2.4 瀚高 HighGo / HGDB

- **官方 URL**：https://www.highgo.com/
- **版本**：HGDB V9.0（企业版）、V4.5（安全版）
- **内核**：基于 PostgreSQL 内核自主研发，是 PG 国际社区重要贡献者（提交 Patch 800+）【已查证】。
- **兼容性**：官方宣称全面兼容 Oracle/MySQL 语法、多端口并行访问、独立多语法解析【厂商声明】；第三方（Apache SeaTunnel 团队）确认"完全兼容 PostgreSQL 协议、提供标准 PostgreSQL 驱动、无需额外驱动、有政府信创清单认证"【已查证，第三方实测】。
- **Node.js**：直接用 PostgreSQL 驱动（pg）即可【已查证，第三方文档】。
- **迁移工具**：官方提供（未检索到与 KDMS 同级的公开工具清单，标注：迁移工具细节无法确认，需向厂商索取）。

### 2.5 PolarDB（阿里云，PG 版）

- **官方 URL**：https://openpolardb.com/ ；阿里云帮助中心：https://help.aliyun.com/zh/polardb/
- **版本**：PolarDB PostgreSQL 版（100% 兼容 PostgreSQL，官方声明）；开源社区版可用【已查证】。
- **信创适配（重点）**：**PolarDB PostgreSQL 轻量版（PolarFlex）专为国产化私有化环境设计**，官方文档明确：
  - 支持操作系统：统信 UOS V20（x86/ARM 均支持）、欧拉开源版、龙蜥、麒麟、CentOS 7.2+；
  - 芯片建议：海光、鲲鹏【已查证，阿里云官方文档】。
- **Node.js**：100% PG 协议兼容，pg 驱动直连【已查证（官方兼容声明）】。
- **备注**：PolarDB 有 MySQL 版（100% 兼容 MySQL）与 PG 版（兼容 Oracle 语法），选型时注意区分；本地化部署需 License 计费【已查证】。

### 2.6 PG 系小结（对新 HIS 的适配成本评估）

| 数据库 | PG 协议兼容 | 官方 Node 驱动 | TypeORM 接入方式 | 信创适配成熟度 |
|---|---|---|---|---|
| 金仓 KingbaseES V9 | ✅ 完全（官方） | ✅ `kb` 包 | 用 `pg` 或 `kb`，TypeORM type: "postgres" | 高，医疗案例多 |
| Vastbase G100 | ✅（openGauss 系） | ⚠️ 未查到官方 Node 驱动 | 用 `pg`（需处理认证参数） | 中 |
| GaussDB/openGauss | ✅（需改认证参数） | ✅ gaussdb-node | 用 `pg`，改 password_encryption_type=1 | 中高，华为生态 |
| 瀚高 HGDB V9 | ✅ 完全 | ✅ 直接用 pg | TypeORM type: "postgres" | 中高 |
| PolarDB PG 轻量版 | ✅ 100%（官方） | ✅ 直接用 pg | TypeORM type: "postgres" | 高（官方信创适配文档完整） |

---

## 3. 国产数据库适配（MySQL 系 + 达梦）

### 3.1 OceanBase（蚂蚁/阿里）

- **官方 URL**：https://www.oceanbase.com/ ；社区版开源。
- **版本**：社区版 4.x（4.2.1+）；企业版。
- **MySQL 兼容性**：官方声明高度兼容 MySQL 5.7/8.0 大部分功能与语法【厂商声明】；社区实测"业务零修改或少量修改即可迁移"，但**非全部功能支持**（如部分 MySQL 特性未实现）【已查证，OceanBase 社区问答】。
- **TypeORM 支持（重要）**：**OceanBase 官方文档有《使用 TypeORM 连接 OceanBase 数据库》专章**，适用于 MySQL 模式，要求 Node.js 14+，按 mysql2 驱动接入【已查证，官方文档】。
- **迁移工具**：OMS（OceanBase Migration Service），全量+增量低停机迁移【已查证】。
- **常见踩坑**（社区实战）：
  - MyISAM 表转换失败（高危，需提前 30 天转换）；
  - 存储过程语法错误需迁移后逐一验证；
  - 无主键表数据冲突（需强制添加隐藏主键）；
  - PG→OB 迁移需重写 DISTINCT ON 为 GROUP BY、to_char→DATE_FORMAT 等【已查证，OceanBase 社区博客】。
- **医疗案例**：浙江省人民医院富阳院区全栈信创 HIS（全国首家"全栈上云、全栈国产"三甲医院，挂号等候缩短约 68%）；南华附一医院核心 HIS 分布式升级（每秒 2 万+并发）【已查证，中国日报/墨天轮】。

### 3.2 TiDB / 平凯数据库

- **官方 URL**：https://www.pingcap.com/（平凯）；https://docs.pingcap.com/tidb/v8.1/ （文档）
- **版本**：v8.1 LTS、v8.5.5 等。
- **MySQL 兼容性**：高度兼容 MySQL 协议（连接协议、SQL、系统视图、工具链）【官方声明 + 大量案例】。
- **医疗迁移实测**：平凯数据库敏捷模式在 HIS/电子病历系统验证——**95% 以上 SQL 直接执行无需修改**，仅 3 处 DATE_FORMAT 等时间函数需微调；业务系统仅需更换连接地址与端口【已查证，TiDB 社区博客】。
- **信创部署**：有麒麟 V10 + 鲲鹏 ARM64 部署 TiDB v8.5.5 实战教程（TiUP 部署）【已查证】；TiDB 官方文档支持 ARM 架构服务器与主流 Linux。
- **迁移工具**：DM（Data Migration）工具，全量+增量同步【已查证】。
- **医疗案例**：爱尔眼科（TiDB 8.5.5 双集群）、北京市西城区区域医共体云 HIS（11 家医院、超 1.5 万门诊量）、海曙区医共体（金唐软件）、伊川县全民大健康平台【已查证，TiDB 社区/中国日报】。
- **TypeORM 接入**：走 mysql2 驱动，TypeORM type: "mysql"【已查证（协议兼容推断 + 官方兼容声明）】。

### 3.3 达梦 DM8

- **官方 URL**：https://www.dameng.com/ ；技术社区：https://eco.dameng.com/
- **定位**：非 MySQL/PG 系，自研内核，但提供兼容模式。
- **MySQL 兼容模式**：`dm.ini` 中 `COMPATIBLE_MODE=4`（部分兼容 MySQL；3=兼容 SQL Server，2=部分兼容 Oracle）。**注意：兼容模式为"部分兼容"**，社区实测：
  - MySQL 的 `AUTO_INCREMENT` 需替换为 `IDENTITY`；
  - `LIMIT` 分页需改用 `ROWNUM` 或 `OFFSET/FETCH`；
  - `INSERT ... ON DUPLICATE KEY UPDATE` 无直接等价语法【已查证，CSDN/达梦社区】。
- **Node.js 支持**：达梦官方提供 **Node.js 编程指南**与 npm 驱动 `dmdb`【已查证，达梦官方文档】。
- **TypeORM 支持**：官方无 TypeORM 驱动；社区有 **typeorm-dmdb8**（基于 typeorm@0.2.45 + oracle 模块，npm install typeorm@npm:typeorm-dmdb8）与 **typeorm-dm8** 两个开源适配【已查证，GitHub】。NestJS+TypeORM 连接达梦存在连接超时等踩坑案例【已查证，达梦技术社区】。
- **评估**：达梦对 NestJS/TypeORM 的适配属于"社区方案 + 官方 Node 驱动"，TypeORM 集成不如 PG 系/MySQL 系平滑；若新 HIS 以 TypeORM 为核心，达梦优先级应靠后。

### 3.4 MySQL 系小结

| 数据库 | MySQL 协议兼容 | TypeORM 官方/文档支持 | 迁移工具 | 医疗案例 |
|---|---|---|---|---|
| OceanBase | 高（官方+实测） | ✅ 官方文档专章（mysql2 驱动） | OMS | 浙江省人民医院、南华附一 |
| TiDB/平凯 | 高（95% SQL 实测） | ✅ 走 mysql2 | DM | 爱尔眼科、西城区云 HIS、海曙区 |
| 达梦 DM8 | 部分（COMPATIBLE_MODE=4） | ⚠️ 仅社区驱动（typeorm-dmdb8/dm8） | 达梦官方迁移工具 | 少量（多用于政务） |

---

## 4. TypeORM / Node.js 对国产数据库的总体支持情况

### 4.1 TypeORM 官方支持范围【已查证，官方文档/GitHub】

TypeORM 官方支持：MySQL / MariaDB / PostgreSQL / SQLite / Microsoft SQL Server / Oracle / SAP HANA / MongoDB / CockroachDB / Google Spanner / sql.js / WebSQL。

**结论：没有任何国产数据库在 TypeORM 官方支持列表中。** 但 TypeORM 的连接本质是"驱动 + 协议"，因此：

- **PG 协议国产库**（金仓、Vastbase、GaussDB/openGauss、瀚高、PolarDB-PG）→ 用 `pg` 驱动，TypeORM `type: "postgres"`，**理论上零代码切换**，仅需处理：
  - 数据库特定保留字（金仓 `level` 等）；
  - 认证方式（openGauss/GaussDB 的 sha256 需改 md5）；
  - TypeORM 实体列类型与国产库的差异（如自增列、JSONB、时间精度）。
- **MySQL 协议国产库**（OceanBase、TiDB）→ 用 `mysql2` 驱动，TypeORM `type: "mysql"`，OceanBase 官方文档直接给出 TypeORM 连接方法；TiDB 兼容 MySQL 协议与系统视图。
- **达梦** → 需装社区驱动 `typeorm-dmdb8` / `typeorm-dm8`，或直接放弃 TypeORM 用官方 `dmdb` 驱动写原生 SQL。

### 4.2 项目侧可做的架构隔离建议（降低未来切换成本）

- 将数据访问收敛在 TypeORM Repository 层，禁止散落原生 SQL；
- 业务层禁止依赖特定数据库方言函数（to_char、DATE_FORMAT、LIMIT 分页写法），统一走 QueryBuilder 或抽象函数；
- 连接配置（host/port/type/driver）全部走环境变量，便于切换；
- 提前做"双库兼容"CI：同一套集成测试分别跑 PostgreSQL 与目标国产库。

---

## 5. 国产操作系统、CPU 与部署

### 5.1 支持矩阵【已查证】

| 维度 | 说明 |
|---|---|
| 操作系统 | 统信 UOS V20、银河麒麟 V10（SP1/SP3）、中标麒麟、openEuler、龙蜥 Anolis、麒麟 V11 |
| CPU | 鲲鹏/飞腾（ARM64）、海光（x86-64 兼容）、兆芯（x86）、龙芯（LoongArch）、申威（SW64） |
| Node.js 来源 | 官方预编译二进制 `linux-arm64`（Node ≥ 18 官方长期支持 ARM64）；源码编译（需 g++/make）；npmmirror 镜像下载 |

### 5.2 Node.js 在国产平台运行要点【已查证，多篇实战】

- **优先用官方预编译包**：`node-vXX-linux-arm64.tar.xz` 直接解压可用（鲲鹏/飞腾）；npmmirror 镜像（https://npmmirror.com/mirrors/node/）提供国内下载。
- **glibc 版本坑**：
  - 海光 + 麒麟 V10 SP1：glibc 2.31，预编译二进制可能因 glibc 版本不足报错 → 用 musl 静态版或源码编译；
  - 海光 + 统信 UOS V20：glibc 2.28，同样注意版本限制；
  - 龙芯 LoongArch：需要对应架构的构建产物（官方 Node 对 LoongArch 支持取决于版本，需逐版本确认，标注：无法确认所有版本均提供 LoongArch 二进制，建议查 nodejs.org/dist 官方列表）。
- **源码编译常见失败**：麒麟/UOS 精简安装默认无 `build-essential`（g++/make 缺失），需先安装编译工具链【已查证】。
- **npm 私有源**：信创内网环境通常配置 npmmirror 或自建 verdaccio。

### 5.3 NestJS 部署实践（麒麟/UOS 实测路径）【已查证，多篇实战】

- **PM2**：`npm install pm2 -g` → `pm2 start dist/main.js` → `pm2 startup systemd` 生成开机自启（麒麟 V10 有完整实战记录）【已查证】。
- **systemd**：手写 `.service` 单元（Type=simple、ExecStart=/usr/bin/node dist/main.js、Restart=always、Environment=NODE_ENV=production），`systemctl enable` 开机自启——国产 OS 同为 systemd 体系，无兼容问题【已查证】。
- **Docker**：国产 OS（麒麟/UOS）多预装/可装 Docker 或 iSulad 容器引擎；`node:20-alpine` 等镜像在 ARM64 上可用；注意需使用 ARM64 架构镜像（`--platform linux/arm64`）【已查证】。
- **前端**：Vue3 + Vite 构建产物为静态文件，与 OS 无关；在国产 OS 上由 Nginx 托管即可。

### 5.4 结论

NestJS（Node.js 应用）在国产 OS/CPU 上部署**没有不可逾越的障碍**，主要成本在：环境搭建（ARM64 二进制/编译工具链/glibc 版本）与依赖安装（内网 npm 源）。建议在交付文档中固化一套"麒麟 V10 + 鲲鹏/飞腾 + Node 20 LTS（arm64）+ PM2/systemd"的标准部署模板。

---

## 6. 国密算法（SM2/SM3/SM4）

### 6.1 Node.js 实现库【已查证，npm/GitHub】

| 库名 | 覆盖算法 | 性质 | URL | 版本 |
|---|---|---|---|---|
| **sm-crypto** | SM2/SM3/SM4 | 纯 JS，最流行（373 dependents） | https://www.npmjs.com/package/sm-crypto ；GitHub: https://github.com/JuneAndGreen/sm-crypto | 0.5.7 |
| **gm-crypto** | SM2/SM3/SM4 | TypeScript 实现 | https://www.npmjs.com/package/gm-crypto ；GitHub: https://github.com/byte-fe/gm-crypto | 最新版见 npm |
| **gmssl-node** | SM2/SM3/SM4/SM9/ZUC | GmSSL C 库的 Node binding（性能更高） | https://www.npmjs.com/package/gmssl-node | 1.0.3 |
| **gmkitx** | SM2/SM3/SM4/ZUC | 纯 TS 国密工具集 | https://www.npmjs.com/package/gmkitx | 见 npm |
| sm-crypto-v3 | SM2/SM3/SM4 | sm-crypto 的 ESM 版 | https://www.jsdelivr.com/package/npm/sm-crypto-v3 | 1.0.6 |
| miniprogram-sm-crypto | SM2/SM3/SM4 | 微信小程序版 | https://www.npmjs.org/package/miniprogram-sm-crypto | 0.3.13 |

**选型建议**：
- 纯 JS 场景（后端 NestJS）用 **sm-crypto**（生态最大、文档多）或 **gm-crypto**（TS 原生）；
- 性能敏感/对接硬件加密机时用 **gmssl-node**（GmSSL 官方绑定，覆盖 SM9/ZUC）；
- 注意 SM2 加密/签名有 C1C3C2 与 C1C2C3 模式差异、以及 `asn1` 编解码差异，**与医保/卫健委对接时必须按对方规范的字节序实现**——这是社区踩坑重灾区【已查证，多篇对接经验】。

### 6.2 医保接口中的国密应用场景【已查证】

- **国家医保平台**：强制要求使用国密 SSL（GMSSL）协议传输，业务报文进行 **SM2 签名与验签**；客户端需预置医保平台下发的国密证书/密钥【已查证，CSDN 对接经验】。
- **医保电子处方中心接入规范**：请求报文 `encType=SM4`（加密方式）、`signType=SM2`（签名方式）、`signData`（SM2 签名结果）、`encData`（SM4 加密数据）【已查证，接入规范原文】。
- **医保电子凭证技术规范（XJ-D01-2019）**：电子凭证基于证件信息采用 **SM4 加密 + SM3 签名**产生 64 位标识码；交易接口 signType 支持 SM2、SM3【已查证，山西医保局官方 PDF】。
- **通用接口模式**：SM2 用于签名（数据完整性+来源可靠），SM4 用于加密（敏感数据传输），请求参数需排序+拼接+签名【已查证，掘金实测】。
- **社保卡**：三代卡统一使用 SM4（对称加密存储/传输）+ SM2（证书/双向认证/签名）+ SM3（哈希）【已查证，CSDN 综述】。

**对新 HIS 的含义**：只要对接国家医保接口（住院/门诊结算、电子凭证、电子处方、异地就医等），**国密 SM2/SM4/SM3 就是硬需求**，与是否做信创无关。NestJS 侧用 sm-crypto/gm-crypto 实现即可，但密钥管理（UKey/加密机）与 GMSSL 双向 TLS 需单独设计。

---

## 7. 开源/公开信创适配案例（附来源）

### 7.1 医疗 HIS 信创改造标杆案例

| 案例 | 技术栈 | 来源 |
|---|---|---|
| 浙江省人民医院富阳院区（三甲，2025-08） | 和仁科技全栈信创 HIS，芯片/OS/数据库全栈国产，HIS/EMR/LIS/PACS 云化部署，**OceanBase** | 华西医院信息中心转载 https://it.wchscu.cn/contents/133/9835.html ；中国日报 http://cn.chinadaily.com.cn/a/202512/12/WS693bc2a7a310942cc4996615.html |
| 南华附一医院核心 HIS 分布式升级（湖南首个） | **OceanBase**，每秒 20000+ 并发 | 墨天轮 https://www.modb.pro/db/2075017922402152448 |
| 北京市西城区区域医共体云 HIS | **平凯数据库（TiDB）**，11 家医院、1.5 万+门诊量 | 中国日报 http://tech.chinadaily.com.cn/a/202601/29/WS697b0d79a310942cc499d57e.html |
| 海曙区医共体（区县级） | 平凯数据库 + 金唐软件，10 余家区县级医院 | TiDB 社区 https://tidb.net/blog/bfbfde5d |
| 爱尔眼科（集团） | TiDB 8.5.5 双集群 | TiDB 社区 https://asktug.com/tidbcommunity/forum/t/topic/1052107 |
| 三甲医院 HIS 替换（MySQL→金仓，零停机） | **金仓 KingbaseES** | 金仓官网 https://kingbase.com.cn/archives/x5Uoy5CT1 |
| HIS 系统信创改造金仓替代方案全记录 | 金仓 KingbaseES V9（短事务高并发强一致性场景） | 金仓官网 https://www.kingbase.com.cn/explore/tech-blog/his-%E7%B3%BB%E7%BB%9F%E4%BF%A1%E5%88%9B%E6%94%B9%E9%80%A0%EF%BC%9A%E9%87%91%E4%BB%93%E6%95%B0%E6%8D%AE%E5%BA%93%E6%9B%BF%E4%BB%A3%E6%96%B9%E6%A1%88%E5%85%A8%E8%AE%B0%E5%BD%95/ |
| 解放军总医院第八医学中心 GHIS（2026-01） | 全军新一代医院信息系统，全栈信创 | HIT专家网 http://www.hit180.com/78110.html |
| 伊川县全民大健康平台（县级） | TiDB（兼容 MySQL，团队零学习成本迁移） | 中国日报 http://cnews.chinadaily.com.cn/a/202606/26/WS6a3e3a8ba310d709c2fba584.html |

### 7.2 开源项目

- **OpenHIS 医院系统（信创版）**：GitHub `tntlinking-opensource/openhis-itai-pro`，集门诊/住院全流程、药房药库、耗材、财务、医保合规对接等十大模块，**目标适配民营公立一二级医院**，宣称通过国家信创认证体系、全栈自主可控【已查证，GitHub；"通过国家信创认证体系"为项目自述，未独立核验】。
- 达梦 TypeORM 适配：`li1125435097/typeorm-dmdb8`、`xiaojian-hong/typeorm-dm8`【已查证，GitHub】。
- GaussDB/openGauss Node 驱动：`huaweicloud-samples/database-gaussdb-drivers`（gaussdb-node）、`Art-Chen/node-openGauss`【已查证，GitHub】。

### 7.3 无法确认的事项（诚实声明）

- 各数据库厂商宣称的"100% 兼容 PostgreSQL/MySQL"均为厂商口径，**未在本项目做实测**；社区实测（TiDB 95%、OceanBase 高兼容）仅代表特定版本与特定 SQL 集。
- Vastbase 官方 Node.js 驱动是否存在：未查到官方文档，无法确认。
- 龙芯（LoongArch）各 Node 版本的官方二进制可用性：需逐版本查 nodejs.org/dist，本次未逐一核验。
- 各厂商迁移工具的许可（免费/付费）与性能：未核验。

---

## 8. 新 HIS 信创适配分阶段建议

### 阶段一：一期可先做（低风险、可立即启动，成本 ≈ 0）

1. **架构层"方言隔离"**
   - 所有数据库访问收敛到 TypeORM Repository；禁止在业务代码写 `to_char`、`DATE_FORMAT`、`LIMIT x,y` 等方言 SQL；分页统一 QueryBuilder；
   - 连接参数全部环境变量化（DB_TYPE / DB_HOST / DB_PORT / DB_USER / DB_PASS），一行配置切换数据库。
2. **国密算法库选型与封装**
   - 引入 `sm-crypto` 或 `gm-crypto`，封装统一的 `crypto/sm2.ts`、`crypto/sm3.ts`、`crypto/sm4.ts` 服务；明确 SM2 C1C3C2 模式与 asn1 选项；
   - 提前与医保接口做 SM2/SM4 签名验签联调（医保国密是硬需求，不分信创与否）。
3. **Node 运行时国产化验证**
   - 在麒麟 V10（ARM64）+ 统信 UOS 上搭建开发/测试环境，验证 Node 20 LTS arm64 预编译包 + NestJS + TypeORM 全链路可跑；
   - 固化"麒麟 V10 + 鲲鹏/飞腾 + Node 20 + PM2/systemd"部署模板文档。
4. **建立双库 CI**
   - 集成测试同时跑 PostgreSQL（开发）+ 一个目标国产库（建议先选金仓或 PolarDB-PG 之一）做冒烟验证，尽早暴露方言差异。

### 阶段二：二期必须做（正式信创交付，涉及投入）

1. **确定主数据库并完成适配测试**
   - **PG 系优先路线**（推荐，TypeORM 切换成本最低）：金仓 KingbaseES V9 或 PolarDB PG 轻量版 → 用官方驱动/`pg` 驱动接入，跑全量集成测试 + 性能基准（HIS 是"短事务、高并发、强一致性"，务必压测挂号/结算等高频事务）；
   - **MySQL 系备选路线**：OceanBase（官方文档有 TypeORM 接入）或 TiDB/平凯（95% SQL 兼容实测）——适合客户已有 MySQL 存量且需要分布式扩展的场景；
   - 达梦 DM8 仅当客户点名要求时考虑（TypeORM 需社区驱动，成本最高）。
2. **迁移方案与演练**
   - 按厂商工具（金仓 KDMS/KDTS/KFS、OceanBase OMS、TiDB DM）+ 增量同步，制定"全量迁移 + 增量同步 + 灰度切换 + 回退演练"标准作业；迁移期严禁源库大 DDL；
   - 处理已知坑：关键字冲突（金仓 level）、认证方式（GaussDB sha256→md5）、日期/时区、自增列（达梦 IDENTITY）、无主键表（OceanBase 隐藏主键）。
3. **国产 OS + 国产 CPU 生产部署**
   - 在麒麟 V10 / 统信 UOS（鲲鹏/飞腾/海光）上完成生产部署：Node 二进制（arm64 预编译或 musl 静态版）、内网 npm 源、PM2/systemd 守护、Docker（如需容器化，注意 ARM64 镜像）；
   - 完成等保三级相关配置 + 国密 SSL（GMSSL）网关（若对接医保平台）。
4. **信创合规验收材料**
   - 准备信创适配清单（OS/CPU/数据库/中间件/驱动版本）、兼容性测试报告、适配方案文档，供客户投标与评级（互联互通四级/电子病历分级）审查；
   - 关注"2027 年三级医院 70%、二级 50%"目标与县域医共体指引，作为对外宣讲与投标的依据。

### 风险提示

- 国产数据库厂商的"100% 兼容"是营销口径，**必须用真实业务 SQL 集做回归测试**；
- TypeORM 对国产库的适配属于"协议级"适配，**synchronize 建表、迁移脚本、JSON 列、自增主键**等行为可能与 PG/MySQL 有差异，需逐项验证；
- 信创选型一旦确定，切换成本随开发进度指数上升——建议在需求阶段就锁定目标数据库（或至少锁定 PG 系/MySQL 系路线），避免后期大改。

---

## 附：主要参考来源汇总

- 政策：国家中医药管理局（互联互通等级要求）、智慧医疗网（2027 节点）、信创开放社区（70%/50% 目标）、网易/搜狐（县域医共体指引）、华西医院信息中心（医疗信创深水区）
- 金仓：kingbase.com.cn 官方博客与产品手册（Nodejs 指南、迁移工具、HIS 案例）
- Vastbase：vastdata.com.cn 官方文档/白皮书；CSDN 适配指南
- GaussDB/openGauss：huaweicloud-samples/database-gaussdb-drivers（GitHub）、华为云社区 TypeORM 适配心得、openGauss 官方文档
- 瀚高：highgo.com 官网；Apache SeaTunnel 博客（协议兼容第三方佐证）
- PolarDB：openpolardb.com、阿里云帮助中心（PolarFlex 国产化部署文档）
- OceanBase：oceanbase.com 官方文档（TypeORM 连接专章、OMS）、社区迁移踩坑博客
- TiDB/平凯：tidb.net 社区博客（95% SQL 兼容、海曙区/爱尔眼科案例）、中国日报（西城区云 HIS）
- 达梦：eco.dameng.com 官方文档与社区（Node.js 编程指南、COMPATIBLE_MODE）、GitHub（typeorm-dmdb8/typeorm-dm8）
- 国密：npm/GitHub（sm-crypto、gm-crypto、gmssl-node、gmkitx）、山西医保局《医保电子凭证技术规范 XJ-D01-2019》、医保电子处方中心接入规范
- 案例：HIT专家网（解放军总医院 GHIS）、中国日报（浙江省人民医院 OceanBase 全栈信创）、GitHub openhis-itai-pro
