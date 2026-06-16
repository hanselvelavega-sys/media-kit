#!/usr/bin/env bash
# Configura las API keys de las 3 IAs en ~/.bashrc y ~/.zshrc
set -euo pipefail

echo ""
echo "=== Configuración de API Keys para Multi-IA ==="
echo ""

read -rp "OpenAI API Key  (para Codex)   → sk-... : " OPENAI_KEY
read -rp "Gemini API Key  (para Gemini)  → AIza...: " GEMINI_KEY
read -rp "Moonshot API Key (para Kimi)   → sk-... : " MOONSHOT_KEY

for RC in "$HOME/.bashrc" "$HOME/.zshrc"; do
  if [ -f "$RC" ]; then
    # Eliminar entradas anteriores
    sed -i '/OPENAI_API_KEY\|GEMINI_API_KEY\|MOONSHOT_API_KEY/d' "$RC"
    {
      echo ""
      echo "# Multi-IA: Claude + Codex + Gemini + Kimi"
      echo "export OPENAI_API_KEY=\"$OPENAI_KEY\""
      echo "export GEMINI_API_KEY=\"$GEMINI_KEY\""
      echo "export MOONSHOT_API_KEY=\"$MOONSHOT_KEY\""
    } >> "$RC"
    echo "✓ Keys agregadas a $RC"
  fi
done

export OPENAI_API_KEY="$OPENAI_KEY"
export GEMINI_API_KEY="$GEMINI_KEY"
export MOONSHOT_API_KEY="$MOONSHOT_KEY"

echo ""
echo "✓ Todo configurado. Abre una nueva terminal o ejecuta: source ~/.zshrc"
echo ""
