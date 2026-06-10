#!/usr/bin/env bash
# Bake a PMM Sherpa social card from HTML to PNG.
#
# Usage: ./export.sh <html-path> <topic-slug> <format> [variant-suffix]
#   format: 1080sq | 1200x627 | 1080x1350
#
# Example:
#   ./export.sh examples/linkedin-square-mcp-launch.html mcp-launch 1080sq
#   ./export.sh examples/linkedin-square-mcp-launch.html mcp-launch 1080sq v2
#
# Output: open-design/exports/pmmsherpa/YYYY-MM-DD_<slug>_<format>[_<variant>].png
# Renders at 2x device pixel ratio for retina sharpness on LinkedIn.

set -euo pipefail

HTML="${1:?usage: $0 <html> <slug> <format> [variant]}"
SLUG="${2:?usage: $0 <html> <slug> <format> [variant]}"
FORMAT="${3:?usage: $0 <html> <slug> <format> [variant]}"
VARIANT="${4:-}"

case "$FORMAT" in
  1080sq)    W=1080; H=1080 ;;
  1200x627)  W=1200; H=627  ;;
  1080x1350) W=1080; H=1350 ;;
  *) echo "Unknown format: $FORMAT (expected: 1080sq | 1200x627 | 1080x1350)" >&2; exit 1 ;;
esac

# Viewport: card dimensions plus margin for body padding and box-shadow bleed.
VW=$((W + 200))
VH=$((H + 200))

DATE=$(date +%Y-%m-%d)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXPORTS_DIR="$SCRIPT_DIR/../../exports/pmmsherpa"
mkdir -p "$EXPORTS_DIR"

NAME="${DATE}_${SLUG}_${FORMAT}"
[[ -n "$VARIANT" ]] && NAME="${NAME}_${VARIANT}"
OUT="$EXPORTS_DIR/${NAME}.png"

# Resolve HTML to absolute file:// URL.
if [[ "$HTML" != /* ]]; then
  HTML="$(cd "$(dirname "$HTML")" && pwd)/$(basename "$HTML")"
fi

TMP=$(mktemp -d)
RAW="$TMP/raw.png"
trap 'rm -rf "$TMP"' EXIT

CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

"$CHROME" \
  --headless=new \
  --disable-gpu \
  --hide-scrollbars \
  --no-sandbox \
  --force-device-scale-factor=2 \
  --virtual-time-budget=2000 \
  --window-size=${VW},${VH} \
  --screenshot="$RAW" \
  "file://$HTML" 2>/dev/null

# Crop centered to exact card dimensions at 2x.
CW=$((W * 2))
CH=$((H * 2))
sips -c $CH $CW "$RAW" --out "$OUT" >/dev/null

SIZE=$(ls -lh "$OUT" | awk '{print $5}')
echo "✓ ${NAME}.png  (${CW}×${CH}, ${SIZE})"
echo "  $OUT"
