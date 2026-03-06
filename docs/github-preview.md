# 如何在 GitHub 里预览网站（GitHub Pages）

如果你在 **Settings -> Pages** 看不到 **GitHub Actions** 选项，不是你操作错了，通常是仓库权限/套餐/组织策略限制。

下面给你两条可用路径：

## 路径 A：GitHub Actions（有该选项时）

1. 打开仓库 -> **Settings** -> **Pages**。
2. 在 **Build and deployment** 里选择 **Source: GitHub Actions**。
3. push 到 `work` / `main` / `master`，或在 **Actions** 手动运行 `Deploy static site to GitHub Pages`。
4. 在 Actions 的 `deploy` 任务里查看 `page_url`。

## 路径 B：Deploy from a branch（没有 Actions 选项时）

1. 在本地执行：

```bash
./scripts/publish_branch_preview.sh
```

2. 提交并推送 `docs/site`：

```bash
git add docs/site
git commit -m "chore: publish preview via branch source"
git push origin <你的分支>
```

3. 打开 GitHub -> **Settings** -> **Pages**：
   - Source 选择 **Deploy from a branch**
   - Branch 选择你的分支（如 `main`）
   - Folder 选择 `/docs/site`

4. 保存后等待 1~3 分钟，打开 Pages 地址预览。

## 命令行快速推断预览地址

```bash
./scripts/preview_github_url.sh
```

通常地址形如：

- `https://<你的GitHub用户名>.github.io/<仓库名>/`

## 看不到 GitHub Actions 选项的常见原因

- 仓库在组织下，组织策略禁用了 Pages Actions 发布。
- 仓库可见性/套餐限制导致 Actions 发布入口不显示。
- 仓库是 Fork 且未开启对应 Pages 权限。

## 常见问题

- 404：确认 `index.html` 在你选择的发布目录下（`web/` 或 `docs/site/`）。
- 样式丢失：确认 `styles.css` 已提交且使用相对路径。


## 404 回退页（已内置）

仓库已提供 `web/404.html`，分支发布脚本会同步到 `docs/site/404.html`。
这样在访问错误路径时，访客会看到可返回首页的提示页。
