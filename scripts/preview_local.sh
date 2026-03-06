#!/usr/bin/env bash
set -euo pipefail

PORT="${1:-4173}"

if ! command -v python3 >/dev/null 2>&1; then
  echo "python3 未安装，无法启动本地预览服务。"
  exit 1
fi

echo "正在启动本地预览：http://127.0.0.1:${PORT}"
echo "按 Ctrl+C 停止预览服务。"
python3 -m http.server "${PORT}" --directory web
