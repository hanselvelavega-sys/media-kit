#!/usr/bin/env bash
# Gemini 2.5 Pro (Google) reviews the latest git diff → /tmp/.gemini-part.md
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

MODEL="gemini-2.5-pro"

PROMPT="Eres un revisor de código experto enfocado en calidad web (HTML/CSS/JS). Analiza el siguiente diff de git y responde SOLO con este formato markdown:

## Revisión Gemini 2.5 Pro — $(date '+%H:%M')

### Problemas encontrados
- (bugs, errores de seguridad, problemas de rendimiento; escribe \"Ninguno\" si no hay)

### Mejoras de calidad
- (accesibilidad WCAG, Core Web Vitals, semántica HTML5, CSS)

### Sugerencias opcionales
- (ideas que mejorarían el resultado pero no son urgentes)

DIFF:
${DIFF}"

PAYLOAD=$(jq -n --arg text "$PROMPT" \
  '{"contents":[{"parts":[{"text":$text}]}],"generationConfig":{"temperature":0.2}}')

RESPONSE=$(curl -s \
  "https://generativelanguage.googleapis.com/v1beta/models/${MODEL}:generateContent?key=${GEMINI_API_KEY}" \
  -H "Content-Type: application/json" \
  -d "$PAYLOAD")

TEXT=$(echo "$RESPONSE" | jq -r '.candidates[0].content.parts[0].text // "Error: sin respuesta de Gemini"')
echo "$TEXT" > "$OUT"
echo "[multi-review] Gemini 2.5 Pro completó la revisión." >&2
