#!/usr/bin/env bash
# Kimi K2 (Moonshot AI) reviews the latest git diff → /tmp/.kimi-part.md
# API compatible con OpenAI — modelo más potente disponible: kimi-k2
set -euo pipefail

ROOT="$(git -C "$(dirname "$0")/.." rev-parse --show-toplevel)"
OUT="/tmp/.kimi-part.md"
cd "$ROOT"

if [ -z "${MOONSHOT_API_KEY:-}" ]; then
  echo "## Revisión Kimi — SALTADA (falta MOONSHOT_API_KEY)" > "$OUT"
  echo "[multi-review] MOONSHOT_API_KEY no configurada, saltando Kimi." >&2
  exit 0
fi

DIFF=$(git diff HEAD 2>/dev/null || git diff 2>/dev/null)
if [ -z "$DIFF" ]; then
  echo "## Revisión Kimi — sin cambios" > "$OUT"
  exit 0
fi

MODEL="kimi-k2"

PROMPT="Eres un revisor de código experto con foco en experiencia de usuario y diseño front-end. Analiza el siguiente diff de git y responde SOLO con este formato markdown:

## Revisión Kimi K2 (Moonshot) — $(date '+%H:%M')

### Problemas encontrados
- (bugs, errores de lógica, problemas de compatibilidad; escribe \"Ninguno\" si no hay)

### Mejoras de calidad
- (UX, diseño responsive, animaciones, compatibilidad cross-browser)

### Sugerencias opcionales
- (ideas no urgentes que mejorarían la experiencia)

DIFF:
${DIFF}"

PAYLOAD=$(jq -n \
  --arg model "$MODEL" \
  --arg content "$PROMPT" \
  '{"model":$model,"messages":[{"role":"user","content":$content}],"temperature":0.2}')

RESPONSE=$(curl -s https://api.moonshot.cn/v1/chat/completions \
  -H "Authorization: Bearer ${MOONSHOT_API_KEY}" \
  -H "Content-Type: application/json" \
  -d "$PAYLOAD")

TEXT=$(echo "$RESPONSE" | jq -r '.choices[0].message.content // "Error: sin respuesta de Kimi"')
echo "$TEXT" > "$OUT"
echo "[multi-review] Kimi K2 completó la revisión." >&2
