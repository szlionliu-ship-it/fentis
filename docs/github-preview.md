# 如何在 GitHub 里预览网站（GitHub Pages）

这个仓库已配置 `.github/workflows/pages.yml`，会把 `web/` 目录自动发布到 GitHub Pages。

## 一次性设置（GitHub 网页端）

1. 打开仓库 -> **Settings** -> **Pages**。
2. 在 **Build and deployment** 里选择 **Source: GitHub Actions**。
3. 保存后，回到仓库首页。

## 触发发布

- 方式 1：直接 push 到 `work` / `main` / `master` 分支。
- 方式 2：打开 **Actions**，手动运行 `Deploy static site to GitHub Pages`。

## 在哪里看预览地址

1. 进入 **Actions** -> 对应 workflow 的最新运行。
2. 打开 `deploy` job。
3. 查看 `deployment` 步骤输出里的 `page_url`。

通常地址形如：

- `https://<你的GitHub用户名>.github.io/<仓库名>/`

## 常见问题

- 404：确认 `web/index.html` 存在。
- 没有页面地址：确认 Pages 源已切换为 **GitHub Actions**。
- 样式丢失：确认 `web/styles.css` 已提交且路径使用相对路径。
