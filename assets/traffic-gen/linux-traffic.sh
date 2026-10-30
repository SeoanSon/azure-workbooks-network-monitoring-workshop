#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   HUB_IP=10.10.2.4 ./linux-traffic.sh
# Optional:
#   ITERATIONS=20 SLEEP_SEC=2 HUB_HTTPS_PORT=443 HUB_HTTP_PORT=80 ./linux-traffic.sh

HUB_IP="${HUB_IP:-}"
ITERATIONS="${ITERATIONS:-20}"
SLEEP_SEC="${SLEEP_SEC:-2}"
HUB_HTTPS_PORT="${HUB_HTTPS_PORT:-443}"
HUB_HTTP_PORT="${HUB_HTTP_PORT:-80}"

if [[ -z "${HUB_IP}" ]]; then
  echo "HUB_IP is required. Example: HUB_IP=10.10.2.4 ./linux-traffic.sh"
  exit 1
fi

echo "[1/4] Generate allow traffic to hub ${HUB_IP}:${HUB_HTTPS_PORT}"
for i in $(seq 1 "${ITERATIONS}"); do
  timeout 3 bash -c "echo > /dev/tcp/${HUB_IP}/${HUB_HTTPS_PORT}" || true
  sleep "${SLEEP_SEC}"
done

echo "[2/4] Generate deny traffic to hub ${HUB_IP}:${HUB_HTTP_PORT}"
for i in $(seq 1 "${ITERATIONS}"); do
  timeout 3 bash -c "echo > /dev/tcp/${HUB_IP}/${HUB_HTTP_PORT}" || true
  sleep "${SLEEP_SEC}"
done

echo "[3/4] Generate allow app traffic to allowed FQDN"
for i in $(seq 1 "${ITERATIONS}"); do
  curl -sk --max-time 5 https://www.microsoft.com >/dev/null || true
  sleep "${SLEEP_SEC}"
done

echo "[4/4] Generate likely-deny app traffic to non-allowed FQDN"
for i in $(seq 1 "${ITERATIONS}"); do
  curl -sk --max-time 5 https://example.org >/dev/null || true
  sleep "${SLEEP_SEC}"
done

echo "Traffic generation completed."

