#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NAME="playback-speed-controller"
VERSION=$(grep -m1 '"version"' "$ROOT_DIR/manifest.json" | sed -E 's/.*"version"\s*:\s*"([^"]+)".*/\1/')
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
OUT_NAME="${NAME}-${VERSION}-${TIMESTAMP}.zip"

cd "$ROOT_DIR"

ZIP_INPUTS=(
  "manifest.json"
  "inject.css"
  "inject.js"
  "options.css"
  "options.html"
  "options.js"
  "popup.css"
  "popup.html"
  "popup.js"
  "shadow.css"
  "icons"
)

zip -r "$OUT_NAME" "${ZIP_INPUTS[@]}"

echo "Created $OUT_NAME"
