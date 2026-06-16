#!/usr/bin/env bash
# Orquestador: lanza Codex + Gemini + Kimi + Ollama en paralelo → .ai-review.md
set -euo pipefail

ROOT="$(git -C "$(dirname "$0")/.." rev-parse --show-toplevel)"
SCRIPTS="$(dirname "$0")"
OUT="$ROOT/.ai-review.md"

cd "$ROOT"

DIFF=$(git diff HEAD 2>/dev/null || git diff 2>/dev/null)
if [ -z "$DIFF" ]; then
  echo "[multi-review] Sin cambios pendientes, saltando revisión." >&2
  exit 0
fi

echo "[multi-review] Lanzando 4 revisores en paralelo..." >&2

rm -f /tmp/.codex-part.md /tmp/.gemini-part.md /tmp/.kimi-part.md /tmp/.ollama-part.md

bash "$SCRIPTS/gemini-review.sh" &  PID_GEMINI=$!
bash "$SCRIPTS/kimi-review.sh"   &  PID_KIMI=$!
bash "$SCRIPTS/ollama-review.sh" &  PID_OLLAMA=$!
bash "$SCRIPTS/codex-review.sh"  &  PID_CODEX=$!

wait $PID_GEMINI  || echo "[multi-review] Gemini: falló o saltado." >&2
wait $PID_KIMI    || echo "[multi-review] Kimi: falló o saltado." >&2
wait $PID_OLLAMA  || echo "[multi-review] Ollama: falló o saltado." >&2
wait $PID_CODEX   || echo "[multi-review] Codex: falló o saltado." >&2

{
  echo "# Revisión Multi-IA — $(date '+%Y-%m-%d %H:%M')"
  echo ""
  echo "> Revisado por: **Codex** (OpenAI) · **Gemini 2.5 Pro** (Google) · **Kimi K2** (Moonshot) · **Ollama** (local)"
  echo ""
  echo "---"
  echo ""
  for PART in /tmp/.gemini-part.md /tmp/.kimi-part.md /tmp/.ollama-part.md /tmp/.codex-part.md; do
    if [ -f "$PART" ] && [ -s "$PART" ]; then
      cat "$PART"
      echo ""
      echo "---"
      echo ""
    fi
  done
} > "$OUT"

echo "[multi-review] ✓ Revisión de 4 IAs consolidada en .ai-review.md" >&2
