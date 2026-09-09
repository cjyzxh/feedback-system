# 开源医院信息系统（HIS）调研报告

> 调研目的：为创佳益规划全新 HIS 系统（服务民营医院与二级以下公立医院）提供架构与功能参考。
> 调研日期：2026-09-08。star 数均标注查询日期（GitHub/Gitee API 实时获取），口径以项目主页为准。
> 调研范围：Node.js 系开源 HIS 优先，Java 系作为架构参考，覆盖核心模块实现方式与真实部署案例。
> 说明：所有事实均附来源 URL；无法确认的信息明确标注"无法确认"，未编造任何项目名、star 数或功能。

---

## 一、核心发现（摘要）

1. **Node.js/Vue3 系开源 HIS 处于空白**：未检索到成熟、可商用的"Vue3/React + NestJS/Express"中文开源 HIS。最接近的 Node 系项目是已归档停更的 HospitalRun（React + Node + CouchDB）与作为 FHIR 数据平台的 Medplum（TypeScript）。这对创佳益意味着：**核心业务需自研，但架构可借鉴 Java/.NET 系成熟项目**。
2. **国内开源 HIS 主流是 Java（Spring Boot/Cloud）**：以 ZainZhao/HIS（GitHub 1629★）、尚医通（教学项目，Gitee 分支 121★）、天天开源 OpenHIS（Gitee 通用版 196★/信创版 44★）为代表，模块划分、领域建模、接口分层思路可直接迁移到 NestJS 技术栈。
3. **与创佳益目标客群最契合的参考是 OpenHIS**：官方定位即"公立二级以下医院、乡镇卫生院、社区卫生服务中心、民营及公立一二级医院"，覆盖门诊/住院/医技/后勤全流程，有集团化运营与信创版，且有真实落地案例（广西金秀、内蒙古通辽等）。
4. **国际开源 HIS 以 Java/PHP 为主**：OpenMRS、Bahmni、Open Hospital、OpenEMR 有大规模真实部署（OpenEMR 号称 10 万+ provider），其 EMR 数据模型、LIS/PACS 集成方式、概念字典/表单引擎设计对电子病历模块有直接借鉴价值。
5. **真实部署案例集中于"低资源国家/基层"场景**：SIMRS-Khanza（印尼 1000+ 医院）、Bahmni（500+ 站点/50+ 国家）、hmislk（斯里兰卡 40+ 机构）等，说明开源 HIS 在基层医疗确有落地，但国内合规（电子病历评级、互联互通、医保接口）普遍缺失，需要二次开发补齐。

---

## 二、Node.js 系开源 HIS（与目标技术栈最相关）

### 1. HospitalRun
- **项目名**：HospitalRun（组织：github.com/hospitalrun，官网 hospitalrun.io）
- **仓库 URL**：https://github.com/hospitalrun/hospitalrun（v2 monorepo，已归档）；前端 https://github.com/hospitalrun/hospitalrun-frontend ；后端 https://github.com/hospitalrun/hospitalrun-server
- **star 数（2026-09-08，GitHub API）**：frontend **6888**；server **883**（两者均于 2023-01-09 归档 archived=true）
- **技术栈**：v2 为 React（TypeScript）前端 + Node.js（Express）后端 + PouchDB/CouchDB，offline-first（离线优先）设计；v1 为 Ember.js；MIT 协议（官网 FAQ 确认：https://hospitalrun.io/faq ）
- **模块覆盖**：面向发展中国家慈善医院的门诊/住院流程、患者管理、药品/物资库存、账单等（定位为轻量 HIS/EHR）
- **架构亮点**：离线优先 + CouchDB 同步，适合网络不稳定场景；monorepo 组织（frontend/server/components 统一管理）
- **可借鉴点**：离线缓存与同步机制（基层医院网络差的场景可用）；Node.js 生态在医疗业务后端的可行性验证
- **局限/风险**：**v2 已归档停更（2023 年）**，社区活跃度低；功能深度远不足以支撑国内 HIS（无医保、无合规）；CouchDB 与国内 MSSQL/MySQL 双库规划不匹配
- 来源：https://github.com/hospitalrun 、https://github.com/hospitalrun/hospitalrun-frontend 、https://github.com/hospitalrun/hospitalrun-server 、https://hospitalrun.io/faq 、https://www.medsoftwares.com/news/hospitalrun-vs-hospitalos-comparison-2026

### 2. Medplum（FHIR 医疗数据平台，非完整 HIS，但值得关注）
- **项目名**：Medplum
- **仓库 URL**：https://github.com/medplum/medplum
- **star 数（2026-09-08，GitHub API）**：**2658**
- **技术栈**：TypeScript 全栈（Node.js 后端 + React 前端），Apache-2.0，FHIR R4 标准实现，PostgreSQL 存储
- **模块覆盖**：FHIR 资源管理（患者/诊疗/处方/检验结果）、用户认证与审计日志、Bots 自动化脚本、应用构建器；定位是"快速开发合规医疗应用"的平台层，而非开箱即用的 HIS 业务系统
- **架构亮点**：以 FHIR 标准为数据模型底座，天然支持互操作；多租户设计；TypeScript 全栈工程化水准高
- **可借鉴点**：若创佳益二期要对接医保/卫健/第三方（HL7/FHIR），可直接借鉴其 FHIR 建模与 API 分层；TypeScript 全栈（与 NestJS 同为 Node 生态）的工程组织方式
- **局限/风险**：非完整 HIS（无挂号收费/住院/药房等国内业务流程）；面向美国合规（HIPAA），国内合规需自行处理
- 来源：https://github.com/medplum/medplum

### 3. medic / CHT Core（社区健康平台，Node.js 后端大规模部署参考）
- **项目名**：Community Health Toolkit（CHT Core）
- **仓库 URL**：https://github.com/medic/cht-core
- **star 数（2026-09-08，GitHub API）**：**554**
- **技术栈**：Node.js（JavaScript 后端）、CouchDB，offline-first 移动端优先架构
- **模块覆盖**：面向社区卫生工作者（CHW）的随访、妇幼、免疫等健康管理应用框架（非医院 HIS）
- **架构亮点**：离线优先 + 多级同步；在肯尼亚等多个国家的国家级社区健康项目中落地（项目定位为"打造响应式离线优先数字健康应用"）
- **可借鉴点**：Node.js 后端承载医疗级数据的工程实践；离线/弱网场景同步设计
- **局限/风险**：领域是社区健康而非医院院内业务；与国内 HIS 业务流程差异大；具体医院级部署数量本报告未能独立核实
- 来源：https://github.com/medic/cht-core

### 4. NestJS 系新兴/学习型项目（证明可行性，但不成熟）
- **EfraRS-dev/his**：https://github.com/EfraRS-dev/his ，1★（2026-09-08），TypeScript。NestJS + Prisma + PostgreSQL 微服务架构 HIS，哥伦比亚某大学 2025 软件设计课程项目，含微服务拆分与 Docker Compose。
- **hongdat-pham/HospitalCare**：https://github.com/hongdat-pham/HospitalCare ，0★（2026-09-08），TypeScript。NestJS + React + PostgreSQL + Socket.IO，覆盖门诊管理、EMR、检验、药房、计费，学生项目。
- **结论**：NestJS 构建 HIS 在技术上是可行的，但当前公开项目均为课程作业/演示级别，**无成熟中文开源产品**。创佳益以 Vue3 + NestJS + TypeORM 自研，属于国内该技术栈的先行者，竞争压力小，但需自行承担领域建模与合规工作量。
- 来源：https://github.com/EfraRS-dev/his 、https://github.com/hongdat-pham/HospitalCare

---

## 三、Java 系开源 HIS（架构参考重点）

### 5. ZainZhao/HIS（GitHub 上 star 最高的中文 HIS）
- **项目名**：HIS（医院信息就诊系统，需求源自东软云医院）
- **仓库 URL**：https://github.com/ZainZhao/HIS
- **star 数（2026-09-08，GitHub API）**：**1629**；Apache-2.0；最后提交 2025-02-24
- **技术栈**：后端 Spring Cloud Netflix（Eureka/Config/Feign/Zuul/Hystrix/Zipkin/Turbine）+ Spring Boot 2.0.x + MyBatis + Elasticsearch + RabbitMQ + Redis + Druid + Docker；前端 Vue 2 + Element UI + ECharts + uni-app（患者 App）
- **模块覆盖**：门诊医生工作站、药房医生工作站、医技医生工作站、收费员工作站、对账员工作站、管理员工作站；病历模板管理、排班管理、App 挂号、日结对账
- **架构亮点**：**同一业务同时提供单体版（HIS-master）与微服务版（his-cloud）双模式**，便于按医院规模选型；后端以"工作站"视角划分模块，贴合国内医院岗位习惯；微服务全套治理组件（注册/配置/网关/熔断/链路）齐全
- **可借鉴点**：单体→微服务演进路线（与创佳益"一期 SaaS 门诊版、二期住院+医保+硬件"的渐进式规划高度契合）；工作站式菜单/权限设计可直接映射到 Element Plus 前端；病历模板、排班、对账等模块的字段与流程设计
- **局限/风险**：README 明示"致力于打造一个医疗系统 demo"，**无真实医院部署案例**；技术栈偏老（Spring Cloud Netflix、Vue2）；无医保接口、无电子病历评级合规；作者声明已申请著作权，商用/二开需联系作者
- 来源：https://github.com/ZainZhao/HIS 、https://raw.githubusercontent.com/ZainZhao/HIS/master/README.md

### 6. 尚医通（yygh，尚硅谷教学项目，微服务架构范本）
- **项目名**：尚医通（网上预约挂号系统）
- **仓库 URL**：官方源码经 gitee.com/jpsite/hub 汇总指向 https://gitee.com/itxinfei/yygh-parent.git（当前已不可访问，404）；代表性可访问分支：Gitee https://gitee.com/swust-liuchuan/shang-yitong 、GitHub https://github.com/xiongsihao/yygh_parent
- **star 数（2026-09-08）**：Gitee swust-liuchuan/shang-yitong **121**（Gitee API）；GitHub xiongsihao/yygh_parent **37**（GitHub API）
- **技术栈**：后端 Spring Boot + Spring Cloud Alibaba（Nacos 注册/配置、Feign、Gateway）+ MyBatis-Plus + MySQL + Redis + MongoDB + RabbitMQ + EasyExcel + xxl-job + 阿里云 OSS + 微信支付/微信登录；新版前端 Vue 3 + TypeScript + Vite + Pinia + Element Plus（参见掘金实战笔记）
- **模块覆盖**：后台：医院设置、数据字典、用户管理、订单管理、统计管理；前台：用户登录、就诊人管理、实名认证、预约挂号、排班号源查询
- **架构亮点**：**微服务+分布式全栈教学范本**，前后端分离，业务贴近真实预约挂号流程（排班、号源、订单状态机）
- **可借鉴点**：预约挂号/号源/排班的数据模型与接口设计（创佳益 SaaS 门诊版可直接参考）；Nacos+Gateway 的服务治理模式可映射为 NestJS 侧的网关/配置方案；微信支付对接流程
- **局限/风险**：教学项目，**无真实部署**；覆盖"预约挂号平台"而非完整 HIS（无住院、药房药库、EMR 深度实现）；官方源码已 404，需以社区分支为基础
- 来源：https://gitee.com/jpsite/hub 、https://gitee.com/swust-liuchuan/shang-yitong 、https://github.com/xiongsihao/yygh_parent 、http://m.atguigu.com/video/detail/49/ 、https://juejin.cn/post/7258288616455323706

### 7. OpenHIS（天天开源/新致开源）——与创佳益客群最重合
- **项目名**：OpenHIS 医院系统（通用版 / 信创版），运营方"天天开源"（前身新致开源，2022-06 首发）
- **仓库 URL**：
  - 通用版：GitHub 镜像 https://github.com/Turbo-AGI/openhis ；Gitee 官方 https://gitee.com/tntlinking-opensource/openhis
  - 信创版：GitHub 镜像 https://github.com/Turbo-AGI/openhis-itai ；Gitee 官方 https://gitee.com/tntlinking-opensource/openhis-itai ；官网 https://open.tntlinking.com/
- **star 数（2026-09-08）**：Gitee 通用版 **196**（forks 151）、信创版 **44**（forks 56）（Gitee API）；GitHub 镜像均为 0★（GPL-3.0）
- **技术栈**：
  - 通用版：**C#/.NET（ASP.NET Core MVC）+ SQL Server**（仓库语言统计含 C#、TSQL，需 Visual Studio 2017/2022 编译）——与创佳益的 MSSQL 经验直接相关
  - 信创版：**Java（JDK17）+ Vue3 + PostgreSQL 16 + Redis**（README 运行环境），前端 openhis-ui-vue3，后端 openhis-server
- **模块覆盖（通用版 10 大模块，仓库目录结构）**：后台管理（Newtouch.HIS.Base）、医护协同（CIS）、电子病历（EMR）、医疗资源管理（HERP）、病案管理（MRMS）、病历质控（MRQC）、手术管理（OR）、药房药库管理（PDS）、结算管理（Sett）、联合工作站（SSO）、定时任务（HangFire）、API 管理、医保插件（WinServiceAPI）、报表（JSViewer_MVC_Core）；覆盖门诊/住院/医技/后勤
- **架构亮点**：**按业务域拆分的模块化单体**（每个模块独立 .sln），模块边界清晰；医保对接独立为插件（WinServiceAPI）；支持私有化部署、第三方电子病历接入、医保/卫健对接；信创版通过国家信创认证体系，支持单体/集团化/区域医疗协同多部署模式（372 项标准化功能）
- **可借鉴点**：**模块划分方式最值得抄作业**——Base/CIS/EMR/PDS/Sett/医保插件 的分层可直接映射到 NestJS 模块；通用版 SQL Server 表结构可作为 MSSQL 双库的设计起点；医保插件化思路对应创佳益二期"医保+三方硬件接口"；信创版认证路径可参考
- **真实部署案例**：
  - 2024-02 广西来宾金秀瑶族自治县村卫云诊所上线（新浪财经，2025-06-20 报道）
  - 内蒙古通辽处方流转等（同上）
  - 2022 年报道称已与多家三甲/二甲医院合作部署并开展开源化认证（健康界）
  - 官网"应用案例中心"列示：广西县域医共体案例、河北中医医共体案例、安徽民营医院信息化案例（open.tntlinking.com）
  - 2025 年入选武汉十大优秀开源项目（新浪财经）
- **局限/风险**：GitHub 镜像 0★，主阵地在 Gitee；通用版为 .NET 栈、信创版为 Java 栈，**均非 Node.js**；具体医院名单与上线规模多为厂商自述，第三方可核实数据有限；"服务全国百万基层机构"为宣传口径，需谨慎采信
- 来源：https://github.com/Turbo-AGI/openhis 、https://gitee.com/tntlinking-opensource/openhis 、https://github.com/Turbo-AGI/openhis-itai 、https://gitee.com/tntlinking-opensource/openhis-itai 、https://finance.sina.com.cn/tech/roll/2025-06-20/doc-infateup2840850.shtml 、https://www.cn-healthcare.com/articlewm/20221109/wap-content-1463959.html 、https://open.tntlinking.com/ 、https://m.sohu.com/a/1031394977_121894455/

### 8. 万孝国/his（Gitee，学习型全模块 HIS）
- **项目名**：东软云医院 HIS 系统
- **仓库 URL**：https://gitee.com/wanxiaoguo/his
- **star 数（2026-09-08，Gitee API）**：**75**（forks 30）
- **技术栈**：Spring Boot 2.x + MyBatis-Plus + JWT + MySQL 5.7/8.0；前端 Vue 2 + Vuex + Element UI + Axios
- **模块覆盖**：门诊医生工作站（接诊/病历/医嘱）、住院医生工作站、护士工作站（护理记录/医嘱核对）、检验系统（申请/样本/结果）、检查系统（预约/报告/影像）、药品管理（库存/出入库/发药/合理用药审核）、挂号收费（号源控制/费用计算/退费/发票/退号）、系统管理（用户/角色/科室/常量）
- **架构亮点**：controller/entity/service/mapper 经典分层；JWT + 自定义注解（@PassToken/@UserLoginToken）实现接口鉴权；提供完整 API 文档与数据库脚本
- **可借鉴点**：**覆盖面最均衡的"全模块单体"参考**，检验/检查申请-缴费-退费流程、药品多单位/价格管理、号源控制等字段设计可直接参考；JWT 鉴权注解模式可迁移到 NestJS 守卫
- **局限/风险**：README 声明"仅供学习研究使用"；Vue2 老前端；无部署案例；无医保/合规
- 来源：https://gitee.com/wanxiaoguo/his 、https://gitee.com/wanxiaoguo/his（README 全文）

### 9. 一飞开源 HIS（多机构微服务版）
- **项目名**：一飞开源医院 HIS（多机构版，由"一飞开源"平台发布、点晴资讯转载）
- **仓库 URL**：一飞开源平台 https://code.exmay.com/ （文章称"访问一飞开源：https://code.exmay.com/"）；**具体仓库路径无法确认**（平台为内容聚合站，需站内检索）
- **star 数**：无法确认（平台未提供公开 star 数据）
- **技术栈**：后端 Spring Cloud + Nacos + PostgreSQL（README 提示切换 dev-pgsql 分支为最新）；前端 Vue 3 + TypeScript + Element Plus；Apache-2.0
- **模块覆盖**（转载页截图）：用户/角色/菜单/机构管理、药品字典/价表/供应商、挂号、门诊病历、检查、检验、处方（含中药）、收费结算、报表、数据中心等
- **架构亮点**：**支持多机构**（集团化/连锁医院场景）、分布式事务、分布式锁；微服务架构；界面含"测试机构1"机构切换，可见多租户设计
- **可借鉴点**：**多机构/多租户 SaaS 化思路与创佳益集团化连锁部署规划高度相关**；分布式事务在挂号-收费-药房扣库存联动中的用法
- **局限/风险**：来源为转载资讯，官方仓库与版本演进无法核实；PostgreSQL 单库（非 MSSQL/MySQL 双库）；无部署案例公开信息
- 来源：https://www.clicksun.com.cn/mis/bbs/showapp.asp?id=25977 、https://code.exmay.com/

### 10. 苜蓿草智慧医院 HIS（cloveropen/his）
- **项目名**：智慧医院信息管理系统 HIS（苜蓿草科技）
- **仓库 URL**：https://github.com/cloveropen/his （另有门急诊挂号收款前端 https://github.com/cloveropen/outp ）
- **star 数（2026-09-08，GitHub API）**：**50**；GPL-3.0；最后提交 2023-01-04（已停滞）
- **技术栈**：Vue 前端 + Java 后端（仓库主语言 Vue）；支持卫计委标准数据集、HL7/CDA/IHE 标准
- **模块覆盖**：患者主索引（EMPI）、电子医嘱、电子病历、门诊系统、住院系统、医技系统、药品管理、病案管理、划价收费、后勤物资、医疗质控、临床决策支持（CDSS）、辅助管理决策；通过 Kafka 消息实现松耦合
- **架构亮点**：**标准先行**（HL7/CDA/IHE）+ 消息总线解耦子系统；可视化/拖拽式设计
- **可借鉴点**：EMPI（患者主索引）设计对集团化/连锁部署至关重要；Kafka 消息解耦思路可对应 NestJS 侧的 BullMQ/RabbitMQ 事件驱动
- **局限/风险**：项目停滞（2023 年后无提交）；star 少；GPL 协议商用需注意
- 来源：https://github.com/cloveropen/his 、https://github.com/cloveropen/outp

---

## 四、国际开源 HIS/EMR（生态与标准参考）

### 11. OpenMRS
- **仓库 URL**：https://github.com/openmrs/openmrs-core
- **star 数（2026-09-08，GitHub API）**：**1909**，Java，活跃维护（最后提交 2026-09-07）
- **技术栈**：Java（Spring + Hibernate），模块化插件架构，MySQL 为主
- **模块覆盖**：患者注册、就诊（Encounter）记录、概念字典（Concept Dictionary）、表单引擎、预约、报告、FHIR 支持（OpenMRS 3）
- **架构亮点**：**概念字典 + 表单引擎 + 模块插件机制**，非程序员可配置病历表单；平台化思路
- **真实部署**：学术文献称已在至少 44 个中低收入国家临床部署，尤以 HIV/TB/妇幼项目为主（PMC PMC9719763）；孟加拉国 Aalo 诊所等被政府指定采用（buhn.org）
- **可借鉴点**：EMR 领域建模（Encounter/Observation/Concept 三层）、病历表单可配置化设计
- **局限/风险**：偏 EMR 平台而非完整国内 HIS；无国内医保/评级合规；模块机制与 Spring 生态迁移到 NestJS 需重新设计
- 来源：https://github.com/openmrs/openmrs-core 、https://pmc.ncbi.nlm.nih.gov/articles/PMC9719763/ 、https://buhn.org/first-ever-digitization-of-primary-health-care-phc-services-in-the-country-through-model-urban-phc-clinics-aalo-clinics-project

### 12. Bahmni
- **仓库 URL**：https://github.com/Bahmni/bahmni-core
- **star 数（2026-09-08，GitHub API）**：**168**，Java，AGPL-3.0，活跃（最后提交 2026-09-08）
- **技术栈**：以 OpenMRS 为临床核心，集成 OpenELIS（检验）、Odoo/ERPNext（计费与库存）、dcm4chee（PACS/影像）的开源组合架构
- **模块覆盖**：患者注册与排班、临床文档、医嘱、药房、检验（LIS）、影像（PACS）、计费、报表、出院小结
- **架构亮点**：**"最佳开源组件集成"路线**——用统一界面整合多个成熟开源系统，避免从零自研
- **真实部署**：ThoughtWorks 与 Mylan 为印度地区医院开发；公开资料称已部署 500+ 站点、覆盖 50+ 国家、管理 200 万+ 患者记录（IntuitionLabs）；Synodus 称 50+ 国家采用；孟加拉国 Upazila 健康中心、莱索托等有落地（GitHub 配置仓库）
- **可借鉴点**：**LIS/PACS 通过标准接口集成而非自研**的思路，对应创佳益二期"检验检查（LIS/PACS 接口）"规划；统一患者视图
- **局限/风险**：面向低资源国家流程，与国内医保/收费/评级体系差异大；AGPL 协议传染性需法务评估；集成组件多、运维复杂
- 来源：https://github.com/Bahmni/bahmni-core 、https://intuitionlabs.ai/articles/global-health-information-systems 、https://synodus.com/blog/healthcare/free-hospital-information-system-open-source/ 、https://github.com/sharedhealth/bd-uhc-config

### 13. Open Hospital（OH）
- **仓库 URL**：发布构建库 https://github.com/informatici/openhospital （629★）；核心库 https://github.com/informatici/openhospital-core （109★）；GUI https://github.com/informatici/openhospital-gui （56★）
- **star 数（2026-09-08，GitHub API）**：合计约 **629（主库）**；GPL-3.0，活跃（最后提交 2026-09-01）
- **技术栈**：Java（Swing 桌面客户端 + 客户端/服务器模式），MySQL/MariaDB；也有 Web 版本在研
- **模块覆盖**：EHR 电子健康记录（门诊/住院病历、处方、检验）、药房、库存、计费等
- **架构亮点**：面向低资源地区（便携模式可在单机上运行）；意大利"无国界工程师"组织维护
- **真实部署**：博客报道肯尼亚 20 床诊所等案例（BrightCoding，2026-05）；**医院名单与规模无法独立核实**
- **可借鉴点**：低配置环境下 HIS 的轻量化设计；离线/单机模式对基层诊所的参考
- **局限/风险**：桌面应用架构，与 Web 化目标不符；国内无合规适配
- 来源：https://github.com/informatici/openhospital 、https://github.com/informatici/openhospital-core 、https://github.com/informatici/openhospital-gui 、https://blog.brightcoding.dev/2026/05/09/open-hospital-the-powerful-free-ehr-every-clinic-needs

### 14. OpenEMR
- **仓库 URL**：https://github.com/openemr/openemr
- **star 数（2026-09-08，GitHub API）**：**5415**，PHP，GPL-3.0，活跃（最后提交 2026-09-08）
- **技术栈**：PHP（LAMP 架构）+ MySQL，ONC 认证 Complete EHR
- **模块覆盖**：患者管理、预约排程、电子病历、处方（含电子处方）、检验医嘱与结果、计费（保险/自费）、报表、患者门户、多语言
- **架构亮点**：**功能完整性 + 认证体系**（ONC 认证意味着功能清单可作为"完整 EHR 该有什么"的基准）；活跃社区（官方称月下载 4000+、100+ 国家使用）
- **真实部署**：官方欢迎页称估计 **10 万+ 医疗 provider 使用**（open-emr.org/welcome）；CapMinds 称 1.5 万+ 机构安装、覆盖 9000 万+ 患者（更早口径）；IntuitionLabs 称 100+ 国家
- **可借鉴点**：作为"完整 EMR 功能清单"的对照基准（对比自身功能覆盖度）；计费与报表模块设计
- **局限/风险**：PHP 技术栈，与 Node/Java 体系差异大；美国医保/编码体系（CPT/ICD）与国内不同，业务流程不可直接复用
- 来源：https://github.com/openemr/openemr 、https://www.open-emr.org/welcome/ 、https://www.capminds.com/blog/the-ultimate-guide-to-openemr-features-benefits-and-complete-implementation-roadmap/

### 15. SIMRS-Khanza（印尼，真实部署量最大的开源 HIS 之一）
- **仓库 URL**：https://github.com/mas-elkhanza/SIMRS-Khanza
- **star 数（2026-09-08，GitHub API）**：**740**，Java，活跃（最后提交 2026-09-05）
- **技术栈**：Java（NetBeans/Ant 构建，桌面客户端 + Web 混合），MySQL；仓库含大量 BPJS（印尼国家医保）与 SatuSehat（印尼 FHIR 平台）对接服务模块
- **模块覆盖**：挂号排队（Antrian/叫号）、门诊/住院、处方与药房（Apotek）、检验（样本/结果/回执）、放射（bridging radiologi）、计费支付（含银行接口）、应收（Piutang）、库存、百余种临床表单（入院评估/护理/知情同意等）、年度报表
- **架构亮点**：**与国家医保/国家 FHIR 平台深度对接**（BPJS、SatuSehat、MobileJKN 等 20+ 对接服务），医保直连经验的完整样本
- **真实部署**：仓库描述称**已在印尼 1000+ 医院/诊所/社区卫生中心使用**（"lebih dari 1000 rumah sakit"）
- **可借鉴点**：医保/国家平台对接的插件化服务设计（对应创佳益二期医保对接）；排队叫号与处方流转流程
- **局限/风险**：印尼本地化（语言、医保规则），国内不可直接复用；桌面架构偏老；协议未注明（license 字段为空），商用需谨慎
- 来源：https://github.com/mas-elkhanza/SIMRS-Khanza

### 16. hmislk/hmis（CareCode，斯里兰卡 20 年落地）
- **仓库 URL**：https://github.com/hmislk/hmis
- **star 数（2026-09-08，GitHub API）**：**230**，Java EE，活跃（最后提交 2026-09-08）
- **技术栈**：Java EE（Servlet/JSP 系老栈）
- **模块覆盖**：医院管理全模块（患者护理、行政、药房、检验、计费等）
- **真实部署**：README 称 **2004 年起服务 40+ 医疗机构**，列明 Ruhunu MediHospital（Hambanthota，2012-至今）、科伦坡大学医学院大学医学中心（2025 起）、Galle Cooperative Hospital（2008-至今）等斯里兰卡医院
- **可借鉴点**：长期落地的机构化运维经验；README 中医院列表的披露方式值得参考（透明度）
- **局限/风险**：老 Java EE 技术栈；斯里兰卡市场，国内无适配
- 来源：https://github.com/hmislk/hmis 、https://github.com/hmislk/hmis/blob/master/README.md

---

## 五、核心模块典型实现参考

| 核心模块 | 代表性项目 | 典型实现方式/亮点 |
|---|---|---|
| 门诊挂号收费 | ZainZhao/HIS、万孝国/his、OpenHIS（Sett 结算）、SIMRS-Khanza | 挂号级别/号源控制→挂号登记→收费/退费/发票→日结对账；工作站式岗位划分；排队叫号（SIMRS-Khanza） |
| 住院管理 | OpenHIS（CIS/OR 手术）、万孝国/his、OpenMRS | 住院医生工作站+护士工作站（医嘱核对/护理记录）；入院-转科-出院全流程；手术管理独立模块（OpenHIS OR） |
| 电子病历 EMR | OpenHIS（EMR+MRQC 质控+MRMS 病案）、OpenMRS（概念字典/表单引擎）、OpenEMR（ONC 认证） | 病历模板管理（ZainZhao）；可配置表单引擎+概念字典（OpenMRS）；病历质控与病案归档独立成模块（OpenHIS） |
| 药房药库 | OpenHIS（PDS）、万孝国/his、一飞开源 | 药品字典（通用名/商品名/剂型/医保文号）、多单位价格、库存出入库、发药、合理用药审核；住院药房/门诊药房分库 |
| 检验检查 LIS/PACS | Bahmni（OpenELIS+dcm4chee 集成）、SIMRS-Khanza（bridging lab/radiologi）、万孝国/his | 检验申请→样本管理→结果录入/回执；检查预约→报告→影像；**标准接口集成而非自研**（Bahmni 路线） |
| 财务与报表 | OpenHIS（Sett+财务核算+报表）、ZainZhao（收费员/对账员工作台）、SIMRS-Khanza（应收/年度报表） | 收费-退费-日结-对账闭环；应收管理；多维报表（OpenHIS 信创版 372 项功能中含报表体系） |
| 医保对接 | OpenHIS（WinServiceAPI 医保插件、信创版医保合规）、SIMRS-Khanza（BPJS/SatuSehat 20+ 对接服务） | **医保独立为插件/服务层**，隔离厂商差异；对接国家平台（医保/卫健）的经验样本 |
| 集团化/多机构 | OpenHIS 信创版（集团化运营/区域医疗协同）、一飞开源（多机构）、Medplum（多租户） | 机构维度贯穿权限/数据/报表；分布式事务/锁保障跨机构一致性；患者主索引 EMPI（苜蓿草） |

---

## 六、真实落地部署案例汇总

| 项目 | 部署规模/案例 | 证据等级 | 来源 |
|---|---|---|---|
| SIMRS-Khanza | 印尼 1000+ 医院/诊所 | 项目方自述（仓库描述） | https://github.com/mas-elkhanza/SIMRS-Khanza |
| Bahmni | 500+ 站点 / 50+ 国家（印度、孟加拉、埃塞、海地等），200 万+ 患者记录 | 第三方综述引用 | https://intuitionlabs.ai/articles/global-health-information-systems 、https://synodus.com/blog/healthcare/free-hospital-information-system-open-source/ |
| OpenMRS | 至少 44 个中低收入国家临床部署 | 同行评审文献 | https://pmc.ncbi.nlm.nih.gov/articles/PMC9719763/ |
| OpenEMR | 10 万+ provider / 100+ 国家 | 官方 + 第三方 | https://www.open-emr.org/welcome/ 、https://www.capminds.com/blog/the-ultimate-guide-to-openemr-features-benefits-and-complete-implementation-roadmap/ |
| OpenHIS（天天开源） | 广西金秀村卫云诊所（2024-02）、内蒙古通辽；与多家三甲/二甲合作部署；官网应用案例：广西县域医共体/河北中医医共体/安徽民营医院 | 媒体报道 + 厂商官网 | https://finance.sina.com.cn/tech/roll/2025-06-20/doc-infateup2840850.shtml 、https://www.cn-healthcare.com/articlewm/20221109/wap-content-1463959.html 、https://open.tntlinking.com/ |
| hmislk/hmis | 斯里兰卡 40+ 医疗机构（2004 年起） | 项目 README | https://github.com/hmislk/hmis/blob/master/README.md |
| Open Hospital | 肯尼亚等基层诊所案例 | 博客报道，无法独立核实 | https://blog.brightcoding.dev/2026/05/09/open-hospital-the-powerful-free-ehr-every-clinic-needs |
| ZainZhao/HIS、尚医通 | **无真实部署**（demo / 教学项目） | 项目 README 明示 | https://github.com/ZainZhao/HIS 、https://juejin.cn/post/7258288616455323706 |

---

## 七、对创佳益新 HIS 的借鉴建议（结合技术栈与规划）

**技术栈匹配结论**：Vue3 + NestJS + TypeORM + MSSQL/MySQL 双库的**成熟开源 HIS 不存在**，核心需自研；以下建议聚焦"抄架构、抄领域模型、不抄代码"。

1. **一期 SaaS 门诊版**：
   - 参考 ZainZhao/HIS 的"单体先行 + 预留微服务边界"策略：以 NestJS 模块（Module）划分领域边界（挂号、收费、处方、药房、基础数据），先单体部署，二期再按需拆服务。
   - 预约挂号/号源/排班数据模型直接参考尚医通；挂号收费-退费-日结对账闭环参考 ZainZhao 与万孝国/his。
   - 多租户（机构维度）参考一飞开源多机构设计与 OpenHIS 信创版集团化模式，数据层以 tenant_id/机构号贯穿。
2. **二期住院 + 医保 + 三方硬件**：
   - 医保对接参考 OpenHIS 的**插件化隔离**（WinServiceAPI 模式）与 SIMRS-Khanza 的医保平台服务拆分，避免医保厂商差异污染主业务。
   - LIS/PACS 参考 Bahmni 的"标准接口集成"路线（HL7/FHIR 预留），而非自研设备协议；TypeORM 层预留外部接口适配器。
   - 住院/护士站/手术模块参考 OpenHIS CIS/OR 与万孝国护士工作站的功能清单。
3. **集团化连锁部署**：
   - EMPI 患者主索引必须前置（参考苜蓿草 cloveropen/his）；机构-院区-科室多级组织模型贯穿权限与报表。
   - 分布式事务仅用于强一致核心（挂号-收费-扣库存），参考一飞开源/Java 系经验，Node 侧可评估 BullMQ 事务性消息 + 本地事务表（outbox 模式）。
4. **信创要求**：
   - 参考 OpenHIS 信创版（Java+Vue3+PostgreSQL）的信创认证路径；创佳益的 NestJS 栈需提前确认国产化中间件/数据库（如达梦、人大金仓）与 TypeORM 的兼容性，避免二期返工。
5. **双库（MSSQL/MySQL）**：
   - 通用版 OpenHIS 为 SQL Server 全套实现，其表结构（药品字典多单位、价表、结算）可作为 MSSQL 侧设计起点；TypeORM 需从第一天做方言差异测试（自增/分页/JSON 类型）。
6. **EMR 深度**：
   - 参考 OpenMRS 概念字典+表单引擎、OpenHIS EMR/质控/病案三模块拆分、OpenEMR ONC 功能清单，规划病历模板、质控规则、病案归档的演进路径。
7. **风险提示**：
   - 许可证：GPL/AGPL 项目（OpenHIS 通用版 GPL-3.0、Bahmni AGPL-3.0、苜蓿草 GPL-3.0）代码复用需法务评估；Apache-2.0（ZainZhao/HIS、Medplum、一飞开源）更宽松。
   - 国内合规（电子病历应用水平分级、互联互通测评、医保接口规范）是开源 HIS 普遍空白，需作为独立工作项。

---

## 八、数据来源链接汇总

- GitHub 项目主页/API（star 数均为 2026-09-08 实时获取）：
  https://github.com/ZainZhao/HIS 、https://github.com/medplum/medplum 、https://github.com/openmrs/openmrs-core 、https://github.com/Bahmni/bahmni-core 、https://github.com/informatici/openhospital 、https://github.com/openemr/openemr 、https://github.com/mas-elkhanza/SIMRS-Khanza 、https://github.com/hmislk/hmis 、https://github.com/hospitalrun/hospitalrun-frontend 、https://github.com/hospitalrun/hospitalrun-server 、https://github.com/medic/cht-core 、https://github.com/cloveropen/his 、https://github.com/Turbo-AGI/openhis 、https://github.com/Turbo-AGI/openhis-itai 、https://github.com/EfraRS-dev/his 、https://github.com/hongdat-pham/HospitalCare
- Gitee 项目页/API（star 数均为 2026-09-08 实时获取）：
  https://gitee.com/tntlinking-opensource/openhis 、https://gitee.com/tntlinking-opensource/openhis-itai 、https://gitee.com/wanxiaoguo/his 、https://gitee.com/swust-liuchuan/shang-yitong
- 媒体与文献：
  https://finance.sina.com.cn/tech/roll/2025-06-20/doc-infateup2840850.shtml 、https://www.cn-healthcare.com/articlewm/20221109/wap-content-1463959.html 、https://pmc.ncbi.nlm.nih.gov/articles/PMC9719763/ 、https://intuitionlabs.ai/articles/global-health-information-systems 、https://synodus.com/blog/healthcare/free-hospital-information-system-open-source/ 、https://www.capminds.com/blog/the-ultimate-guide-to-openemr-features-benefits-and-complete-implementation-roadmap/ 、https://www.open-emr.org/welcome/ 、https://juejin.cn/post/7258288616455323706 、http://m.atguigu.com/video/detail/49/ 、https://www.clicksun.com.cn/mis/bbs/showapp.asp?id=25977 、https://code.exmay.com/ 、https://open.tntlinking.com/

> 备注：OpenHIS 通用版技术栈判定依据为仓库语言统计（C#/TSQL 占比最高）与 README 目录结构（Newtouch.HIS.* 系列、Visual Studio .sln），已交叉验证 GitHub/Gitee 两侧 README。
