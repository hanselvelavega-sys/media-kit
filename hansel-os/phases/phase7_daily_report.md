# FASE 7 — Daily Report
*Instrucciones para generar el reporte diario*

## OBJETIVO
Producir un reporte conciso, accionable y honesto de lo que el sistema encontró, hizo y recomienda. Hansel debe poder leerlo en menos de 3 minutos y saber exactamente qué pasó y qué sigue.

## CUÁNDO GENERAR
- Al final de cada sesión de trabajo
- Automáticamente como parte del flujo de 7 fases
- Siempre antes de cerrar la sesión

## DÓNDE GUARDAR
- Reporte del día: `hansel-os/reports/YYYY-MM-DD.md`
- Copia como último reporte: `hansel-os/reports/last_report.md`
- Archivos mayores a 30 días: mover a `hansel-os/reports/archive/`

## TEMPLATE DEL REPORTE

```markdown
# HANSEL-OS DAILY REPORT
**Fecha:** [YYYY-MM-DD]
**Sesión:** [número de sesión]
**Duración del scan:** [tiempo aproximado]

---

## RESUMEN EJECUTIVO
[2-3 líneas: qué fue lo más importante del día]

---

## PROBLEMAS ENCONTRADOS

### P1 — Críticos (actuar hoy)
- [ ] **[Workflow]:** [problema específico] → [acción recomendada]
- [ ] ...

### P2 — Altos (esta semana)
- [ ] **[Workflow]:** [problema específico] → [acción recomendada]
- [ ] ...

### P3 — Medios (este mes)
- [ ] **[Workflow]:** [problema específico] → [acción recomendada]
- [ ] ...

---

## MEJORAS APLICADAS HOY

| ID | Mejora | Workflow | Estado |
|----|--------|----------|--------|
| IMP-XXX | Descripción | nombre | completado |

---

## MEJORAS PENDIENTES (en progreso)

| ID | Mejora | Bloqueado por | ETA |
|----|--------|---------------|-----|
| IMP-XXX | Descripción | razón | fecha |

---

## NUEVAS HERRAMIENTAS ÚTILES ENCONTRADAS

| Herramienta | Para qué | Flujo | Clasificación |
|-------------|----------|-------|---------------|
| Nombre | Descripción | workflow | INSTALAR_AHORA |

---

## WATCHLIST — GUARDADAS PARA DESPUÉS

| Herramienta | Razón | Trigger de activación |
|-------------|-------|----------------------|
| Nombre | Por qué esperar | Cuando... |

---

## ITEMS QUE NECESITAN TU APROBACIÓN

[Si hay items → formato detallado de approval request]
[Si no hay → "Nada requiere aprobación hoy."]

---

## AUTO-MEJORA DE CLOUDCODE HOY

### Qué encontré para mejorarme:
- [item 1]

### Qué upgrade apliqué:
- [upgrade aplicado + resultado]

### Qué dejé en prueba (sandbox):
- [item en sandbox + estado]

### Qué guardé en watchlist para CloudCode:
- [item + trigger]

### Capacidad nueva ganada:
- [si aplica]

### Riesgo detectado en el sistema:
- [si aplica]

---

## PRÓXIMO PASO RECOMENDADO

**Acción inmediata (P1):** [qué hacer ahora mismo]
**Próxima sesión:** [qué revisar en la siguiente sesión]
**Esta semana:** [qué completar esta semana]

---

## MÉTRICAS DEL SISTEMA

| Métrica | Valor |
|---------|-------|
| Workflows activos | [N] |
| Workflows con P1 abiertos | [N] |
| Mejoras aplicadas (acumulado) | [N] |
| Items en watchlist | [N] |
| Score CloudCode | [X]/10 |
| Días desde inicio | [N] |

---

*Hansel-OS v1.0.0 — Sistema autónomo de mejora continua*
```

## REGLAS DEL REPORTE

1. **Máximo 1 página en lectura normal.** Si es más largo, está mal resumido.
2. **Solo mencionar lo que tiene evidencia.** Sin especulaciones.
3. **Siempre terminar con "Próximo Paso".** Hansel debe saber qué hacer.
4. **Si no hay nada nuevo, decirlo.** "No se detectaron problemas nuevos hoy" es válido.
5. **Métricas reales.** No inventar números.
6. **Problemas antes que logros.** Hansel necesita saber qué está mal antes que qué está bien.

## FORMATO PARA TELEGRAM (resumen del reporte)

Si se puede enviar a Telegram, usar este formato condensado:
```
HANSEL-OS DAILY [FECHA]
━━━━━━━━━━━━━━━━━━━━━━
🔴 P1: [N problemas críticos]
🟡 P2: [N problemas altos]
✅ Aplicado: [N mejoras hoy]
⏳ Pendiente: [N mejoras en curso]
💡 Nuevas tools: [N encontradas]
📋 Watchlist: [N guardadas]
🤖 CloudCode score: [X]/10

Próximo paso: [1 línea]
━━━━━━━━━━━━━━━━━━━━━━
Ver reporte completo: [link al archivo]
```
