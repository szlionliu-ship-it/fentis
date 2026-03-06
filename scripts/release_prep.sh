#!/usr/bin/env bash
set -euo pipefail

printf '[1/4] Lint basic files...\n'
[ -f web/index.html ] && [ -f web/styles.css ] && [ -f deploy/nginx.conf ]

printf '[2/4] Build container image...\n'
docker build -t fentis-web:release . >/tmp/fentis_docker_build.log

printf '[3/4] Start stack...\n'
docker compose up -d >/tmp/fentis_compose_up.log

printf '[4/4] Health check...\n'
code="$(curl -s -o /tmp/fentis_health.txt -w '%{http_code}' http://127.0.0.1:8080/healthz)"
if [ "$code" != "200" ]; then
  echo "Health check failed: HTTP $code"
  cat /tmp/fentis_health.txt
  exit 1
fi

echo 'Release preparation checks passed.'
