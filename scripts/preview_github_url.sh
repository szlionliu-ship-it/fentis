#!/usr/bin/env bash
set -euo pipefail

remote_url="$(git remote get-url origin 2>/dev/null || true)"

if [ -z "$remote_url" ]; then
  echo "未检测到 origin 远程仓库。"
  echo "请先执行：git remote add origin <你的github仓库地址>"
  exit 1
fi

slug=""
if [[ "$remote_url" =~ github.com[:/]([^/]+)/([^/.]+)(\.git)?$ ]]; then
  owner="${BASH_REMATCH[1]}"
  repo="${BASH_REMATCH[2]}"
  slug="${owner}/${repo}"
fi

if [ -z "$slug" ]; then
  echo "origin 不是标准 GitHub 仓库地址：$remote_url"
  exit 1
fi

owner="${slug%/*}"
repo="${slug#*/}"

echo "预估 GitHub Pages 地址："
echo "https://${owner}.github.io/${repo}/"
echo
echo "注意：需先在 GitHub -> Settings -> Pages 选择 GitHub Actions，并完成一次 Actions 发布。"
