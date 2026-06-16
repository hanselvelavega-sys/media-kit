#!/usr/bin/env bash
# Gemini 2.5 Pro (Google) reviews the latest git diff → /tmp/.gemini-part.md
# Usa gemini CLI en modo headless (-p)
set -euo pipefail

ROOT="$(git -C "$(dirname "$0")/.." rev-parse --show-toplevel)"
OUT="/tmp/.gemini-part.md"
cd "$ROOT"

if [ -z "${GEMINI_API_KEY:-}" ]; then
  echo "## Revisión Gemini — SALTADA (falta GEMINI_API_KEY)" > "$OUT"
  echo "[multi-review] GEMINI_API_KEY no configurada, saltando Gemini." >&2
  exit 0
fi

DIFF=$(git diff HEAD 2>/dev/null || git diff 2>/dev/null)
if [ -z "$DIFF" ]; then
  echo "## Revisión Gemini — sin cambios" > "$OUT"
  exit 0
fi

PROMPT="Eres un revisor de código experto enfocado en calidad web (HTML/CSS/JS). Analiza el siguiente diff y escribe una revisión en el archivo /tmp/.gemini-part.md con este formato exacto:

## Revisión Gemini 2.5 Pro — $(date '+%H:%M')

### Problemas encontrados
- (bugs, seguridad, rendimiento; escribe \"Ninguno\" si no hay)

### Mejoras de calidad
- (accesibilidad WCAG, Core Web Vitals, semántica HTML5, CSS)

### Sugerencias opcionales
- (ideas no urgentes)

---
DIFF:
$DIFF"

echo "[multi-review] Gemini 2.5 Pro revisando..." >&2
gemini -p "$PROMPT" --approval-mode yolo -m gemini-2.5-pro
echo "[multi-review] Gemini 2.5 Pro completó la revisión." >&2
