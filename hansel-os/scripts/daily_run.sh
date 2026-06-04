#!/bin/bash
# Hansel-OS Daily Run Script
# Orquesta las 7 fases del sistema de mejora continua
# NOTA: Este script documenta la secuencia lógica. CloudCode lo ejecuta via razonamiento,
#       pero puede usarse como referencia para automatizar via Make/n8n en el futuro.

set -e

HANSEL_OS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DATE=$(date +%Y-%m-%d)
SESSION_LOG="$HANSEL_OS_DIR/workflows/audit_log/$DATE.json"

echo "============================================"
echo "  HANSEL-OS Daily Run — $DATE"
echo "============================================"

# ── VERIFICACIONES INICIALES ──────────────────────────────────────────────────

echo ""
echo "[CHECK] Verificando estructura del sistema..."

required_files=(
  "$HANSEL_OS_DIR/core/hansel_profile.json"
  "$HANSEL_OS_DIR/core/system_config.json"
  "$HANSEL_OS_DIR/memory/knowledge_base.md"
  "$HANSEL_OS_DIR/memory/watchlist.json"
  "$HANSEL_OS_DIR/workflows/registry.json"
  "$HANSEL_OS_DIR/self_improvement/capabilities.json"
)

all_ok=true
for file in "${required_files[@]}"; do
  if [ ! -f "$file" ]; then
    echo "  ❌ FALTA: $file"
    all_ok=false
  else
    echo "  ✅ OK: $(basename $file)"
  fi
done

if [ "$all_ok" = false ]; then
  echo ""
  echo "ERROR: Faltan archivos críticos del sistema. Aborting."
  exit 1
fi

# ── FASE 1: DAILY SYSTEM SCAN ─────────────────────────────────────────────────

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  FASE 1: Daily System Scan"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Referencia: hansel-os/phases/phase1_daily_scan.md"
echo ""
echo "Workflows P1 Críticos a revisar:"
# Extraer P1 del registry
node -e "
const fs = require('fs');
const r = JSON.parse(fs.readFileSync('$HANSEL_OS_DIR/workflows/registry.json', 'utf8'));
const p1 = r.summary.P1_criticos;
p1.forEach(w => console.log('  - ' + w));
" 2>/dev/null || python3 -c "
import json
with open('$HANSEL_OS_DIR/workflows/registry.json') as f:
    r = json.load(f)
for w in r['summary']['P1_criticos']:
    print('  - ' + w)
" 2>/dev/null || echo "  (requiere node o python para listar)"

# ── FASE 2: EXTERNAL SEARCH ──────────────────────────────────────────────────

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  FASE 2: External Improvement Search"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Referencia: hansel-os/phases/phase2_external_search.md"
echo ""
echo "Áreas de búsqueda prioritarias (basado en P1 abiertos):"
echo "  1. CRM consolidation + automation"
echo "  2. Make/n8n error monitoring"
echo "  3. Telegram bot for notifications"
echo "  4. Audiciones pipeline automation"
echo "  5. CloudCode self-improvement updates"

# ── FASE 3: RELEVANCE FILTER ─────────────────────────────────────────────────

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  FASE 3: Relevance Filter"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Referencia: hansel-os/phases/phase3_filter.md"
echo "Watchlist actual:"
python3 -c "
import json
with open('$HANSEL_OS_DIR/memory/watchlist.json') as f:
    w = json.load(f)
for item in w['items']:
    print(f\"  [{item['id']}] {item['nombre']} — Trigger: {item['trigger_para_activar']}\")
" 2>/dev/null || echo "  (requiere python3)"

# ── FASE 4: ACTION PLAN ──────────────────────────────────────────────────────

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  FASE 4: Action Plan"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Referencia: hansel-os/phases/phase4_action_plan.md"
echo ""
echo "Planes pendientes:"
python3 -c "
import json
with open('$HANSEL_OS_DIR/memory/decisions.json') as f:
    d = json.load(f)
pendientes = [dec for dec in d['decisions'] if dec['estado'] == 'pendiente']
if pendientes:
    for p in pendientes:
        print(f\"  [{p['id']}] {p['titulo']}\")
else:
    print('  Sin planes pendientes formales (revisar audit log del día)')
" 2>/dev/null

# ── FASE 5: SAFE IMPLEMENTATION ──────────────────────────────────────────────

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  FASE 5: Safe Implementation"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Referencia: hansel-os/phases/phase5_safe_implementation.md"
echo ""
echo "Recordatorio: Crear snapshot git antes de cualquier implementación."
echo "  → git add -A && git commit -m 'snapshot: pre-implementacion [IMP-XXX]'"

# ── FASE 6: MEMORY UPDATE ────────────────────────────────────────────────────

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  FASE 6: Memory + Learning"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Referencia: hansel-os/phases/phase6_memory.md"
echo ""
echo "Archivos de memoria a actualizar al final de la sesión:"
echo "  - hansel-os/memory/knowledge_base.md"
echo "  - hansel-os/memory/watchlist.json (si hay activaciones)"
echo "  - hansel-os/memory/decisions.json"
echo "  - hansel-os/self_improvement/capabilities.json (si hay upgrades)"

# ── FASE 7: DAILY REPORT ─────────────────────────────────────────────────────

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  FASE 7: Daily Report"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Referencia: hansel-os/phases/phase7_daily_report.md"
echo ""
echo "Generar: hansel-os/reports/$DATE.md"
echo "Copiar como: hansel-os/reports/last_report.md"

# ── VERIFICACIÓN FINAL ────────────────────────────────────────────────────────

echo ""
echo "============================================"
echo "  Estado del Sistema — $DATE"
echo "============================================"

# Contar items
watchlist_count=$(python3 -c "
import json
with open('$HANSEL_OS_DIR/memory/watchlist.json') as f:
    w = json.load(f)
print(len(w['items']))
" 2>/dev/null || echo "?")

improvements_count=$(python3 -c "
import json
with open('$HANSEL_OS_DIR/memory/improvements_applied.json') as f:
    i = json.load(f)
print(len(i['improvements']))
" 2>/dev/null || echo "?")

score=$(python3 -c "
import json
with open('$HANSEL_OS_DIR/self_improvement/capabilities.json') as f:
    c = json.load(f)
print(c['score_global']['puntuacion'])
" 2>/dev/null || echo "?")

echo "  Workflows registrados: 16"
echo "  Items en watchlist: $watchlist_count"
echo "  Mejoras aplicadas: $improvements_count"
echo "  Score CloudCode: $score/10"
echo ""
echo "  Sistema Hansel-OS v1.0.0 — Operacional"
echo "============================================"
