# HANSEL-OS DAILY REPORT
**Fecha:** {{FECHA}}
**Sesión:** {{NUMERO_SESION}}
**Tipo de scan:** {{RAPIDO|PROFUNDO|EMERGENCIA}}

---

## RESUMEN EJECUTIVO
{{RESUMEN_2_3_LINEAS}}

---

## PROBLEMAS ENCONTRADOS

### P1 — Críticos (actuar hoy)
{{#if P1_items}}
{{#each P1_items}}
- [ ] **[{{workflow}}]:** {{problema}} → {{accion_recomendada}}
{{/each}}
{{else}}
Sin problemas P1 hoy.
{{/if}}

### P2 — Altos (esta semana)
{{#if P2_items}}
{{#each P2_items}}
- [ ] **[{{workflow}}]:** {{problema}} → {{accion_recomendada}}
{{/each}}
{{else}}
Sin problemas P2 nuevos.
{{/if}}

### P3 — Medios (este mes)
{{#if P3_items}}
{{#each P3_items}}
- [ ] **[{{workflow}}]:** {{problema}}
{{/each}}
{{else}}
Sin problemas P3 nuevos.
{{/if}}

---

## MEJORAS APLICADAS HOY

| ID | Mejora | Workflow Mejorado | Resultado |
|----|--------|-------------------|-----------|
{{#each mejoras_aplicadas}}
| {{id}} | {{mejora}} | {{workflow}} | {{resultado}} |
{{/each}}
{{#unless mejoras_aplicadas}}
Sin implementaciones hoy.
{{/unless}}

---

## MEJORAS EN PROGRESO

| ID | Mejora | Estado | Próximo paso |
|----|--------|--------|--------------|
{{#each mejoras_en_progreso}}
| {{id}} | {{mejora}} | {{estado}} | {{proximo_paso}} |
{{/each}}

---

## NUEVAS HERRAMIENTAS EVALUADAS

| Herramienta | Para qué | Workflow | Decisión |
|-------------|----------|----------|----------|
{{#each tools_evaluadas}}
| {{nombre}} | {{descripcion}} | {{workflow}} | {{decision}} |
{{/each}}
{{#unless tools_evaluadas}}
Sin nuevas herramientas evaluadas hoy.
{{/unless}}

---

## WATCHLIST — GUARDADAS

| Herramienta | Razón | Se activa cuando... |
|-------------|-------|---------------------|
{{#each watchlist_nuevas}}
| {{nombre}} | {{razon}} | {{trigger}} |
{{/each}}

---

## REQUIEREN TU APROBACIÓN

{{#if approval_requests}}
{{#each approval_requests}}
### [{{id}}] {{titulo}}
**Encontré:** {{descripcion}}
**Mejora:** {{mejora}}
**Riesgo:** {{riesgo}}
**Recomendación:** {{recomendacion}}
{{/each}}
{{else}}
Nada requiere aprobación hoy.
{{/if}}

---

## AUTO-MEJORA DE CLOUDCODE

### Encontré para mejorar CloudCode:
{{cloudcode_encontrado}}

### Upgrades aplicados:
{{cloudcode_aplicado}}

### En sandbox (probando):
{{cloudcode_sandbox}}

### Guardado en watchlist CloudCode:
{{cloudcode_watchlist}}

### Capacidad nueva ganada:
{{cloudcode_capacidad}}

### Riesgos detectados en el sistema:
{{cloudcode_riesgos}}

---

## PRÓXIMO PASO RECOMENDADO

**Ahora mismo (P1):** {{accion_inmediata}}

**Próxima sesión:** {{proxima_sesion}}

**Esta semana:** {{esta_semana}}

---

## MÉTRICAS DEL SISTEMA

| Métrica | Valor |
|---------|-------|
| Workflows activos | {{total_workflows}} |
| P1 abiertos | {{p1_abiertos}} |
| P2 abiertos | {{p2_abiertos}} |
| Mejoras aplicadas (total) | {{total_mejoras}} |
| Items en watchlist | {{total_watchlist}} |
| Score CloudCode | {{cloudcode_score}}/10 |
| Días desde inicio del sistema | {{dias_sistema}} |
| Tokens estimados esta sesión | {{tokens_sesion}} |

---

*Hansel-OS v{{VERSION}} — Sistema autónomo de mejora continua*
*Generado automáticamente por CloudCode*
