#!/usr/bin/env bash
# Instala Ollama + modelo de código, y configura las API keys de las 4 IAs
set -euo pipefail

echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║   Setup Multi-IA: Codex + Gemini + Kimi + Ollama  ║"
echo "╚══════════════════════════════════════════════╝"
echo ""

# ── 1. Instalar Ollama ────────────────────────────────────────────────────────
if command -v ollama &>/dev/null; then
  echo "✓ Ollama ya instalado: $(ollama --version)"
else
  echo "→ Instalando Ollama..."
  curl -fsSL https://ollama.com/install.sh | sh
  echo "✓ Ollama instalado."
fi

# ── 2. Bajar modelo de código ─────────────────────────────────────────────────
MODEL="${OLLAMA_MODEL:-qwen2.5-coder:7b}"
if ollama list 2>/dev/null | grep -q "${MODEL%%:*}"; then
  echo "✓ Modelo $MODEL ya disponible."
else
  echo "→ Descargando modelo $MODEL (~4 GB, puede tardar)..."
  ollama pull "$MODEL"
  echo "✓ Modelo $MODEL listo."
fi

echo ""

# ── 3. API Keys ───────────────────────────────────────────────────────────────
echo "Ingresa tus API keys (Enter para saltar si ya están configuradas):"
echo ""
read -rp "  OpenAI  (Codex)   → sk-...    : " OPENAI_KEY
read -rp "  Gemini  (Google)  → AIza...   : " GEMINI_KEY
read -rp "  Moonshot (Kimi)   → sk-...    : " MOONSHOT_KEY

for RC in "$HOME/.bashrc" "$HOME/.zshrc"; do
  if [ -f "$RC" ]; then
    sed -i '/OPENAI_API_KEY\|GEMINI_API_KEY\|MOONSHOT_API_KEY/d' "$RC"
    {
      echo ""
      echo "# Multi-IA: Claude + Codex + Gemini + Kimi + Ollama"
      [ -n "$OPENAI_KEY"   ] && echo "export OPENAI_API_KEY=\"$OPENAI_KEY\""
      [ -n "$GEMINI_KEY"   ] && echo "export GEMINI_API_KEY=\"$GEMINI_KEY\""
      [ -n "$MOONSHOT_KEY" ] && echo "export MOONSHOT_API_KEY=\"$MOONSHOT_KEY\""
    } >> "$RC"
    echo "✓ Keys guardadas en $RC"
  fi
done

[ -n "$OPENAI_KEY"   ] && export OPENAI_API_KEY="$OPENAI_KEY"
[ -n "$GEMINI_KEY"   ] && export GEMINI_API_KEY="$GEMINI_KEY"
[ -n "$MOONSHOT_KEY" ] && export MOONSHOT_API_KEY="$MOONSHOT_KEY"

echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║   ✓ Todo configurado. Las 4 IAs están listas  ║"
echo "╚══════════════════════════════════════════════╝"
echo ""
echo "  Ejecuta 'source ~/.zshrc' y ya está."
echo ""
