# 设备管理系统（dev-vue）

设备管理系统的 Web 管理端，提供售货设备、货道、商品、点位、合作商和工单等管理页面，配合 dev-parent 后端使用。

## 主要功能

- 设备管理：设备、设备类型、设备状态及货道配置。
- 商品管理：商品和商品分类。
- 运营管理：区域、点位、合作商、分成策略和员工管理。
- 工单管理：运营、运维工单及相关人员管理。
- 数据展示：销售统计、商品排行和工单统计。
- 系统管理：用户、角色、菜单、部门、字典、系统监控及代码生成。

实际可访问的菜单由后端权限配置决定。

## 技术栈

Vue 3、Vite 5、Vue Router 4、Pinia、Element Plus、Axios 和 ECharts。

## 本地运行

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

## 构建与预览

```sh
# 生产环境构建
npm run build:prod

# 预发布环境构建
npm run build:stage

# 本地预览构建结果
npm run preview
```

构建结果输出到 `dist/`。生产环境和预发布环境的接口前缀分别为 `/prod-api`、`/stage-api`，部署时需要由 Web 服务器配置对应的后端代理。Vite 开发代理不用于生产部署。

## 目录说明

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

## 环境配置

- `.env.development`：开发环境，接口前缀 `/dev-api`。
- `.env.production`：生产环境，接口前缀 `/prod-api`。
- `.env.staging`：预发布环境，接口前缀 `/stage-api`。

页面标题通过 `VITE_APP_TITLE` 配置。`node_modules/` 为本地依赖，`dist/` 为构建产物，均不提交到 Git。
