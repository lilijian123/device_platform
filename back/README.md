# 设备管理系统（dev-parent）

设备管理系统的后端项目，面向售货设备的运营与运维管理，为 dev-vue 管理端提供业务接口。

## 主要功能

- 设备管理：设备信息、设备类型和货道配置。
- 商品管理：商品信息与商品分类。
- 运营管理：区域、点位、合作商、分成策略与员工管理。
- 工单管理：工单、工单类型及工单明细。
- 系统管理：用户、角色、菜单、部门、字典、系统监控、定时任务与代码生成。

## 技术栈

Spring Boot 2.5、Spring Security、MyBatis、Druid、Redis、Quartz、openGauss 和 Maven。

## 模块说明

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

## 环境准备

- JDK 17：项目已使用 JDK 17 完成编译校验，建议使用该版本。
- Maven：用于依赖管理、编译和打包。
- openGauss：存储系统数据和业务数据。
- Redis：默认连接 `localhost:6379`，使用数据库 `0`。

Maven 使用的 Java 版本由 `JAVA_HOME` 决定，可通过 `mvn -version` 检查。

## 数据库初始化

初始化脚本位于 `sql/initData.sql`，包含建表、初始数据、索引和外键。

脚本使用模式 `a_dev_pf`，模式所有者配置为 `e124302026`。执行前需要根据实际数据库用户调整，并确认当前数据库连接。脚本会删除并重建 `a_dev_pf` 模式，执行前应备份需要保留的数据。

表名前缀说明：

- `sys_`：用户、权限、菜单、部门、日志等系统表。
- `tb_`：设备、商品、点位、工单等业务表。

## 配置说明

配置文件位于 `dev-admin/src/main/resources/`：

- `application.yml`：服务端口、Redis、上传路径和文件存储等配置。
- `application-druid.yml`：openGauss 数据源和连接池配置。

当前默认端口为 `8080`，启用 `druid` 配置。启动前应检查数据库连接、账号、密码和模式，并按实际环境调整 Redis 与文件存储配置；涉及上传时还需配置可用的存储服务。

## 编译与启动

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

## 其他目录

- `sql/`：数据库初始化脚本。
- `bin/`：Windows 清理、打包和启动脚本。
- `dev.bat`、`dev.sh`：应用管理脚本。
- 各模块的 `target/`：编译和打包产物，不提交到 Git。
