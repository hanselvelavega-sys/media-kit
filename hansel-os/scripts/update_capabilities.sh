#!/bin/bash
# Update Capabilities Script
# Muestra el estado actual de capacidades de CloudCode y permite actualizar

HANSEL_OS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CAP_FILE="$HANSEL_OS_DIR/self_improvement/capabilities.json"

echo ""
echo "════════════════════════════════════════════════════"
echo "  CLOUDCODE CAPABILITIES — Estado Actual"
echo "════════════════════════════════════════════════════"
echo ""

python3 -c "
import json
with open('$CAP_FILE') as f:
    c = json.load(f)

cap = c['capacidades_actuales']
score = c['score_global']

print(f\"Score Global: {score['puntuacion']}/10\")
print(f\"Objetivo 30 días: {score['objetivo_30_dias']}/10\")
print(f\"Objetivo 90 días: {score['objetivo_90_dias']}/10\")
print()
print('CAPACIDADES:')
print('─' * 50)

areas = ['memoria', 'busqueda', 'razonamiento', 'ejecucion', 'autonomia', 'optimizacion_tokens', 'calidad', 'coordinacion_multiagente']
for area in areas:
    if area in cap:
        a = cap[area]
        nivel = a['nivel']
        maximo = a['max']
        barra = '█' * nivel + '░' * (maximo - nivel)
        print(f\"{area:30} {barra} {nivel}/{maximo}\")
        print(f\"{'':30} {a['descripcion']}\")
        print()

print()
print('PRÓXIMAS MEJORAS PRIORITARIAS:')
print('─' * 50)
for i, mejora in enumerate(c['proximas_mejoras_prioritarias'], 1):
    estado = '✅' if mejora['estado'] == 'implementado_en_v1.0' else '⏳'
    print(f\"{estado} {i}. [{mejora['area']}] {mejora['mejora']}\")
    print(f\"   Impacto esperado: {mejora['impacto_esperado']} — Esfuerzo: {mejora['esfuerzo']}\")
" 2>/dev/null || echo "(requiere python3 para visualización completa)"

echo ""
echo "════════════════════════════════════════════════════"
echo "Para actualizar: editar hansel-os/self_improvement/capabilities.json"
echo "Luego: git add -A && git commit -m 'chore: update capabilities YYYY-MM-DD'"
echo "════════════════════════════════════════════════════"
