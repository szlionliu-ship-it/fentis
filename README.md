# Fentis 第一批功能改进（可运行 + 可发布准备）

本次交付目标：直接落地第一批可用能力，而不是只停留在文档层。

## 本次已完成

- 提供一个可运行的官网基础页（`web/`）
- 提供 Nginx 配置与容器化部署骨架（`deploy/`, `Dockerfile`, `docker-compose.yml`）
- 提供发布前自动检查脚本（`scripts/release_prep.sh`）


## 当前改动进度（你可以直接预览）

- 已完成：静态首页、样式、GitHub Pages 工作流、发布文档、404 回退页。
- 可立即预览：
  - 本地预览：`./scripts/preview_local.sh`
  - 推断 GitHub Pages 地址：`./scripts/preview_github_url.sh`

## 本地运行

### 方式 1：直接静态预览

```bash
./scripts/preview_local.sh
```

或自定义端口：

```bash
./scripts/preview_local.sh 5000
```

打开：`http://127.0.0.1:4173`

### 方式 2：容器运行（推荐）

```bash
docker compose up --build -d
```

访问：`http://127.0.0.1:8080`

## 发布准备检查

```bash
./scripts/release_prep.sh
```

脚本会执行：

1. 必要文件存在性检查
2. 构建容器镜像
3. 启动 Compose 服务
4. 访问 `/healthz` 确认可用

## 下一步建议（第二批）

- 接入真实业务接口（线索收集 / 登录 / 控制台）
- 增加 CI（自动构建、健康检查、镜像推送）
- 按域名和证书完成正式生产发布

## 在 GitHub 里预览网站（给他人看）

你遇到“没有 GitHub Actions 选项”是常见情况，已提供两种预览方式：

1. 如果 Pages 里有 **GitHub Actions**，按 `docs/github-preview.md` 的路径 A。
2. 如果没有该选项，走路径 B（**Deploy from a branch**）：

```bash
./scripts/publish_branch_preview.sh
git add docs/site
git commit -m "chore: publish preview via branch source"
git push origin <你的分支>
```

然后在 `Settings -> Pages` 选择：
- Source: **Deploy from a branch**
- Folder: **/docs/site**

详细说明见：`docs/github-preview.md`。

## 快速拿到 GitHub 预览地址

```bash
./scripts/preview_github_url.sh
```

如果提示未配置 `origin`，先执行：

```bash
git remote add origin https://github.com/<你的用户名>/<你的仓库名>.git
```


## Pages 404 回退说明

为避免分享链接时出现空白错误页，已新增 `web/404.html`。

- GitHub Pages（分支部署）会一并发布 `docs/site/404.html`。
- 若访问不存在路径，会显示友好的 404 页面并可返回首页。
