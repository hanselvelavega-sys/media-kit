#!/usr/bin/env bash
# Runs Codex to review the latest changes Claude made, saves output to .codex-review.md
set -euo pipefail

REVIEW_FILE="$(git -C "$(dirname "$0")/.." rev-parse --show-toplevel)/.codex-review.md"
ROOT="$(git -C "$(dirname "$0")/.." rev-parse --show-toplevel)"

cd "$ROOT"

DIFF=$(git diff HEAD 2>/dev/null || git diff 2>/dev/null)

if [ -z "$DIFF" ]; then
  echo "[codex-review] No hay cambios pendientes, saltando revisión." >&2
  exit 0
fi

PROMPT="Eres un revisor de código experto. Analiza este diff de git y escribe tus sugerencias de mejora en el archivo .codex-review.md usando este formato exacto:

## Revisión Codex — $(date '+%Y-%m-%d %H:%M')

### Problemas encontrados
- (lista de bugs o errores concretos, si los hay)

### Mejoras de calidad
- (accesibilidad, rendimiento, semántica HTML, CSS)

### Sugerencias opcionales
- (ideas que mejorarían el resultado pero no son urgentes)

---
DIFF:
$DIFF"

echo "[codex-review] Llamando a Codex para revisar los cambios..." >&2
codex --approval-mode full-auto "$PROMPT"
echo "[codex-review] Revisión guardada en .codex-review.md" >&2
