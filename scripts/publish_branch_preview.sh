#!/usr/bin/env bash
set -euo pipefail

# Fallback preview path when GitHub Pages "GitHub Actions" source is unavailable.
# It mirrors web/ into docs/site so you can use Pages -> Deploy from a branch.

if [ ! -d web ]; then
  echo "未找到 web/ 目录。"
  exit 1
fi

mkdir -p docs/site
find docs/site -mindepth 1 -maxdepth 1 -exec rm -rf {} +
cp -R web/. docs/site/

# GitHub Pages 在分支发布模式下，404 页面可提升错误路由体验
if [ -f docs/site/index.html ] && [ ! -f docs/site/404.html ]; then
  cp docs/site/index.html docs/site/404.html
fi

echo "已将 web/ 同步到 docs/site/。"
echo "下一步："
echo "1) git add docs/site"
echo "2) git commit -m 'chore: publish preview via branch source'"
echo "3) git push origin <你的分支>"
echo "4) GitHub -> Settings -> Pages -> Source 选择 'Deploy from a branch'"
echo "5) Branch 选 <你的分支>，Folder 选 /docs/site"
