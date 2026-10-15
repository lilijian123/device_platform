# 设备管理系统（device_platform）

## 本地配置与模板

真实连接配置仅保存在本地，不纳入 Git。首次下载项目后，在仓库根目录用 PowerShell 执行以下命令，将示例文件复制为实际配置：

```powershell
Copy-Item back/dev-admin/src/main/resources/application.yml.example back/dev-admin/src/main/resources/application.yml
Copy-Item back/dev-admin/src/main/resources/application-druid.yml.example back/dev-admin/src/main/resources/application-druid.yml
Copy-Item front/vite.config.js.example front/vite.config.js
Copy-Item front/.env.development.example front/.env.development
Copy-Item front/.env.production.example front/.env.production
Copy-Item front/.env.staging.example front/.env.staging
# 可选：需要运行 OSS 上传测试时复制
Copy-Item back/dev-common/src/test/java/com/dev/common/test/Demo.java.example back/dev-common/src/test/java/com/dev/common/test/Demo.java
```

已有本地配置时不要覆盖。将模板中的 `YOUR_*` 占位内容替换为实际数据库、Redis、后端地址、Token 密钥及文件存储配置，再启动应用。网页用户账号和密码、数据库初始化脚本不属于本次忽略范围。

设备管理系统的前后端一体仓库，面向售货设备的运营、运维和系统管理。

## 仓库结构

```text
device_platform/
├── back/       # 后端 Maven 多模块项目
├── front/      # 前端 Vue 管理端
└── README.md   # 前后端使用说明
```

先按后端说明准备数据库、Redis 和配置，再分别启动后端与前端。


## 后端（back）

本节的路径和命令均相对于 `back/`。请先进入该目录：

```sh
cd back
```

设备管理系统的后端项目，面向售货设备的运营与运维管理，为 dev-vue 管理端提供业务接口。

### 主要功能

- 设备管理：设备信息、设备类型和货道配置。
- 商品管理：商品信息与商品分类。
- 运营管理：区域、点位、合作商、分成策略与员工管理。
- 工单管理：工单、工单类型及工单明细。
- 系统管理：用户、角色、菜单、部门、字典、系统监控、定时任务与代码生成。

### 技术栈

Spring Boot 2.5、Spring Security、MyBatis、Druid、Redis、Quartz、openGauss 和 Maven。

### 模块说明

| 模块 | 用途 |
| --- | --- |
| `dev-admin` | 应用启动入口及系统管理接口 |
| `dev-manage` | 设备管理系统业务功能 |
| `dev-common` | 公共工具、基础实体及通用配置 |
| `dev-framework` | Web、安全认证、数据源等基础框架 |
| `dev-system` | 用户、角色、菜单、部门等系统功能 |
| `dev-quartz` | 定时任务 |
| `dev-generator` | 代码生成 |

Java 包名前缀为 `com.dev`，启动类为 `com.dev.DevApplication`。

### 环境准备

- JDK 17：项目已使用 JDK 17 完成编译校验，建议使用该版本。
- Maven：用于依赖管理、编译和打包。
- openGauss：存储系统数据和业务数据。
- Redis：默认连接 `localhost:6379`，使用数据库 `0`。

Maven 使用的 Java 版本由 `JAVA_HOME` 决定，可通过 `mvn -version` 检查。

### 数据库初始化

初始化脚本位于 `sql/initData.sql`，包含建表、初始数据、索引和外键。

脚本使用模式 `a_dev_pf`，模式所有者配置为 `e124302026`。执行前需要根据实际数据库用户调整，并确认当前数据库连接。脚本会删除并重建 `a_dev_pf` 模式，执行前应备份需要保留的数据。

表名前缀说明：

- `sys_`：用户、权限、菜单、部门、日志等系统表。
- `tb_`：设备、商品、点位、工单等业务表。

### 配置说明

配置文件位于 `dev-admin/src/main/resources/`：

- `application.yml`：服务端口、Redis、上传路径和文件存储等配置。
- `application-druid.yml`：openGauss 数据源和连接池配置。

当前默认端口为 `8080`，启用 `druid` 配置。启动前应检查数据库连接、账号、密码和模式，并按实际环境调整 Redis 与文件存储配置；涉及上传时还需配置可用的存储服务。

### 编译与启动

在项目根目录执行：

```sh
# 编译并执行测试阶段
mvn clean test

# 打包
mvn clean package

# 启动后端
java -jar dev-admin/target/dev-admin.jar
```

也可以在 IDE 中运行 `dev-admin/src/main/java/com/dev/DevApplication.java`。应用启动前需确保数据库、Redis 及相应功能依赖的服务可用。

前端项目为 `dev-vue`。其开发环境通过 `/dev-api` 代理请求后端，默认目标地址为 `http://127.0.0.1:8080`。

### 其他目录

- `sql/`：数据库初始化脚本。
- `bin/`：Windows 清理、打包和启动脚本。
- `dev.bat`、`dev.sh`：应用管理脚本。
- 各模块的 `target/`：编译和打包产物，不提交到 Git。

## 前端（front）

本节的路径和命令均相对于 `front/`。请从仓库根目录打开另一个终端，进入该目录：

```sh
cd front
```

设备管理系统的 Web 管理端，提供售货设备、货道、商品、点位、合作商和工单等管理页面，配合 dev-parent 后端使用。

### 主要功能

- 设备管理：设备、设备类型、设备状态及货道配置。
- 商品管理：商品和商品分类。
- 运营管理：区域、点位、合作商、分成策略和员工管理。
- 工单管理：运营、运维工单及相关人员管理。
- 数据展示：销售统计、商品排行和工单统计。
- 系统管理：用户、角色、菜单、部门、字典、系统监控及代码生成。

实际可访问的菜单由后端权限配置决定。

### 技术栈

Vue 3、Vite 5、Vue Router 4、Pinia、Element Plus、Axios 和 ECharts。

### 本地运行

建议使用 Node.js 18 或 20，以及 npm。

```sh
npm install
npm run dev
```

开发服务默认端口为 `80`，以启动日志显示的地址为准。端口占用时可指定其他端口：

```sh
npm run dev -- --port 5173
```

启动后端服务后再进行登录及业务操作。开发环境请求以 `/dev-api` 为前缀，由 `vite.config.js` 代理到 `http://127.0.0.1:8080`；需要连接其他后端时修改代理目标地址。

### 构建与预览

```sh
# 生产环境构建
npm run build:prod

# 预发布环境构建
npm run build:stage

# 本地预览构建结果
npm run preview
```

构建结果输出到 `dist/`。生产环境和预发布环境的接口前缀分别为 `/prod-api`、`/stage-api`，部署时需要由 Web 服务器配置对应的后端代理。Vite 开发代理不用于生产部署。

### 目录说明

| 路径 | 用途 |
| --- | --- |
| `src/api/` | 后端接口调用 |
| `src/views/` | 业务页面 |
| `src/components/` | 公共组件 |
| `src/router/` | 路由配置 |
| `src/store/` | 状态管理 |
| `src/layout/` | 管理端布局 |
| `src/utils/` | 公共工具 |
| `src/assets/` | 图片、样式和图标 |
| `public/` | 公共静态资源 |
| `vite/` | 构建插件配置 |
| `bin/` | Windows 辅助脚本（使用 Yarn） |

### 环境配置

- `.env.development`：开发环境，接口前缀 `/dev-api`。
- `.env.production`：生产环境，接口前缀 `/prod-api`。
- `.env.staging`：预发布环境，接口前缀 `/stage-api`。

页面标题通过 `VITE_APP_TITLE` 配置。`node_modules/` 为本地依赖，`dist/` 为构建产物，均不提交到 Git。
