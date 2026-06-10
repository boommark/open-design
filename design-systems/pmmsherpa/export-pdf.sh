#!/usr/bin/env bash
# Bake a PMM Sherpa multi-slide HTML carousel to a LinkedIn-ready PDF.
#
# Usage: ./export-pdf.sh <html-path> <topic-slug>
#
# Example:
#   ./export-pdf.sh examples/linkedin-carousel-mcp-launch.html mcp-launch
#
# Output: open-design/exports/pmmsherpa/YYYY-MM-DD_<slug>_carousel.pdf
#
# How it works:
#   The HTML uses `@page { size: 1080px 1080px; margin: 0; }` plus
#   `page-break-after: always` on each `.slide` div. Chrome's --print-to-pdf
#   honors both, so each slide becomes a single PDF page at exact 1080×1080.
#   LinkedIn ingests this directly as a document carousel.

set -euo pipefail

HTML="${1:?usage: $0 <html> <slug>}"
SLUG="${2:?usage: $0 <html> <slug>}"

DATE=$(date +%Y-%m-%d)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXPORTS_DIR="$SCRIPT_DIR/../../exports/pmmsherpa"
mkdir -p "$EXPORTS_DIR"

OUT="$EXPORTS_DIR/${DATE}_${SLUG}_carousel.pdf"

# Resolve HTML to absolute file:// URL.
if [[ "$HTML" != /* ]]; then
  HTML="$(cd "$(dirname "$HTML")" && pwd)/$(basename "$HTML")"
fi

CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

"$CHROME" \
  --headless=new \
  --disable-gpu \
  --no-sandbox \
  --no-pdf-header-footer \
  --virtual-time-budget=4000 \
  --print-to-pdf-no-header \
  --print-to-pdf="$OUT" \
  "file://$HTML" 2>/dev/null

SIZE=$(ls -lh "$OUT" | awk '{print $5}')
PAGES=$(grep -c "/Type /Page" "$OUT" 2>/dev/null || echo "?")
echo "✓ ${DATE}_${SLUG}_carousel.pdf  (${SIZE}, ${PAGES} pages)"
echo "  $OUT"
