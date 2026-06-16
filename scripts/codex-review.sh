#!/usr/bin/env bash
# Codex (OpenAI) reviews the latest git diff → /tmp/.codex-part.md
set -euo pipefail

ROOT="$(git -C "$(dirname "$0")/.." rev-parse --show-toplevel)"
OUT="/tmp/.codex-part.md"
cd "$ROOT"

DIFF=$(git diff HEAD 2>/dev/null || git diff 2>/dev/null)
[ -z "$DIFF" ] && { echo "# Codex: sin cambios" > "$OUT"; exit 0; }

PROMPT="Eres un revisor de código senior. Analiza este diff y escribe una revisión en el archivo /tmp/.codex-part.md con este formato:

## Revisión Codex (OpenAI) — $(date '+%H:%M')

### Problemas encontrados
- (bugs, errores concretos; escribe \"Ninguno\" si no hay)

### Mejoras de calidad
- (accesibilidad, rendimiento, semántica)

### Sugerencias opcionales
- (ideas no urgentes)

---
DIFF A REVISAR:
$DIFF"

echo "[multi-review] Codex revisando..." >&2
codex --approval-mode full-auto "$PROMPT"
