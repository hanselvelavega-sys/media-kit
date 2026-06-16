#!/usr/bin/env bash
# Ollama (modelo local) reviews the latest git diff → /tmp/.ollama-part.md
# Modelo recomendado: qwen2.5-coder:7b
set -euo pipefail

ROOT="$(git -C "$(dirname "$0")/.." rev-parse --show-toplevel)"
OUT="/tmp/.ollama-part.md"
MODEL="${OLLAMA_MODEL:-qwen2.5-coder:7b}"
cd "$ROOT"

if ! command -v ollama &>/dev/null; then
  echo "## Revisión Ollama — SALTADA (ollama no instalado)" > "$OUT"
  echo "[multi-review] ollama no encontrado, saltando." >&2
  exit 0
fi

if ! ollama list 2>/dev/null | grep -q "${MODEL%%:*}"; then
  echo "## Revisión Ollama — SALTADA (modelo $MODEL no descargado)" > "$OUT"
  echo "[multi-review] Modelo $MODEL no disponible. Ejecuta: ollama pull $MODEL" >&2
  exit 0
fi

DIFF=$(git diff HEAD 2>/dev/null || git diff 2>/dev/null)
if [ -z "$DIFF" ]; then
  echo "## Revisión Ollama — sin cambios" > "$OUT"
  exit 0
fi

PROMPT="Eres un revisor de código experto. Analiza este diff de git y responde SOLO con el siguiente formato markdown, sin texto adicional:

## Revisión Ollama ($MODEL) — $(date '+%H:%M')

### Problemas encontrados
- (bugs concretos; escribe \"Ninguno\" si no hay)

### Mejoras de calidad
- (rendimiento, legibilidad, buenas prácticas)

### Sugerencias opcionales
- (ideas que mejorarían el resultado pero no son urgentes)

DIFF:
$DIFF"

echo "[multi-review] Ollama ($MODEL) revisando..." >&2

RESPONSE=$(ollama run "$MODEL" "$PROMPT" 2>/dev/null)
echo "$RESPONSE" > "$OUT"

echo "[multi-review] Ollama completó la revisión." >&2
