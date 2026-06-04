# FASE 1 — Daily System Scan
*Instrucciones detalladas para el escaneo diario de workflows*

## OBJETIVO
Detectar proactivamente qué está fallando, qué es lento, qué repite errores, qué gasta tokens de más, qué olvida contexto, qué puede organizarse mejor y qué puede automatizarse en los workflows de Hansel.

## CUÁNDO EJECUTAR
- Al inicio de cada sesión de trabajo
- Si han pasado más de 24h desde el último scan
- Cuando Hansel menciona un problema en algún flujo
- Como respuesta a un error detectado en Make/n8n

## INPUTS NECESARIOS
1. `hansel-os/workflows/registry.json` — workflows a revisar
2. `hansel-os/memory/knowledge_base.md` — contexto acumulado
3. `hansel-os/workflows/audit_log/` — logs de scans anteriores
4. Cualquier información fresca que Hansel haya mencionado en la sesión

## PROCESO

### Paso 1: Carga de Context
Leer el registro de workflows. Identificar qué categoría de scan hacer:
- **Scan rápido** (inicio de sesión normal): verificar estados, errores recientes, P1 críticos
- **Scan profundo** (lunes semanal): análisis completo de todos los workflows
- **Scan de emergencia** (Hansel reporta problema): enfocarse en el workflow afectado

### Paso 2: Revisión por Flujo
Para cada workflow activo, evaluar:

```
WORKFLOW: [nombre]
Estado: [activo/con_problemas/inactivo/desconocido]
Último issue conocido: [si existe]
Pain points activos: [lista del registry]
Nuevos problemas detectados: [basado en contexto de sesión]
Nivel de automatización: [0-10]
Prioridad de mejora: [P1/P2/P3/P4]
```

### Paso 3: Detección de Señales de Alerta
Buscar estas señales en la conversación con Hansel y en los datos disponibles:

| Señal | Síntoma | Categoría |
|-------|---------|-----------|
| "no recuerdo" / "perdí" | Falta de memoria | P1 |
| "tuve que hacerlo manual" | Automatización rota | P2 |
| "me tomó mucho tiempo" | Cuello de botella | P2 |
| "se duplicó" / "hay dos" | Duplicación | P3 |
| "no me llegó" | Integración rota | P1 |
| "olvidé seguir" | Falta de seguimiento | P1 |
| error en Make/n8n | Automatización fallida | P1 |
| "no sirve" / "no funciona" | Sistema roto | P1 |

### Paso 4: Análisis de Tokens y Eficiencia
Revisar si en sesiones anteriores:
- Se hicieron búsquedas redundantes
- Se repitió contexto que ya estaba documentado
- Se usaron prompts más largos de lo necesario
- Se pidió la misma información más de una vez

### Paso 5: Generación de Hallazgos

Formato estándar de hallazgo:
```json
{
  "id": "SCAN-YYYYMMDD-001",
  "workflow": "nombre_workflow",
  "tipo": "error|cuello_de_botella|duplicacion|falta_memoria|prompt_debil|integracion_rota|repeticion_manual",
  "descripcion": "Qué exactamente está mal",
  "evidencia": "Cómo se detectó",
  "impacto": "Qué le cuesta a Hansel (tiempo/dinero/errores/oportunidades)",
  "prioridad": "P1|P2|P3|P4",
  "accion_recomendada": "Qué hacer al respecto",
  "fase_siguiente": "2_buscar_solucion|4_plan_directo|5_implementar_directo"
}
```

## OUTPUT
Guardar en `hansel-os/workflows/audit_log/YYYY-MM-DD.json`:
```json
{
  "fecha": "YYYY-MM-DD",
  "tipo_scan": "rapido|profundo|emergencia",
  "workflows_revisados": ["lista"],
  "hallazgos": [/* array de hallazgos */],
  "resumen": "2-3 lineas de qué encontró",
  "prioridades_del_dia": ["P1_issue_1", "P1_issue_2"],
  "pasa_a_fase2": ["items que necesitan búsqueda externa"],
  "pasa_a_fase4": ["items que tienen solución clara"],
  "pasa_a_fase5": ["items listos para implementar directamente"]
}
```

## CRITERIOS DE PRIORIDAD

| Prioridad | Definición | Tiempo de respuesta |
|-----------|-----------|---------------------|
| P1 | Rompe flujo activo o hace perder oportunidades | Hoy |
| P2 | Degrada calidad o eficiencia significativamente | Esta semana |
| P3 | Ineficiencia menor o mejora potencial | Este mes |
| P4 | Optimización nice-to-have | Backlog |

## REGLAS DEL SCAN

1. **No inventar problemas.** Solo reportar lo que hay evidencia real.
2. **Priorizar P1 siempre.** No saltar a P3 si hay P1 sin resolver.
3. **Ser específico.** "Gmail no funciona" no sirve. "Los correos de casting de las últimas 2 semanas no están en ninguna etiqueta y uno se perdió" sí sirve.
4. **Conectar con flujo real.** Cada hallazgo debe conectar con un workflow del registry.
5. **Actualizar el registry.** Si se descubre nueva información sobre un workflow, actualizar `registry.json`.
