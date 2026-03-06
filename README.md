# Fentis 第一批功能改进（可运行 + 可发布准备）

本次交付目标：直接落地第一批可用能力，而不是只停留在文档层。

## 本次已完成

- 提供一个可运行的官网基础页（`web/`）
- 提供 Nginx 配置与容器化部署骨架（`deploy/`, `Dockerfile`, `docker-compose.yml`）
- 提供发布前自动检查脚本（`scripts/release_prep.sh`）

## 本地运行

### 方式 1：直接静态预览

```bash
python3 -m http.server 4173 --directory web
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


## 在 GitHub 里预览网站（推荐）

本仓库已配置 GitHub Pages 自动发布工作流：`.github/workflows/pages.yml`，会将 `web/` 目录发布为静态站点。

快速步骤：

1. 进入仓库 `Settings -> Pages`，将 Source 设为 **GitHub Actions**。
2. push 到 `work` / `main` / `master`，或在 Actions 手动运行发布。
3. 在 Actions 的 deploy 任务中查看 `page_url` 即可在线预览。

详细说明见：`docs/github-preview.md`。
