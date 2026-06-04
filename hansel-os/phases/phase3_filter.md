# FASE 3 — Relevance Filter
*El filtro que separa lo útil de lo inútil*

## OBJETIVO
Clasificar cada hallazgo de la Fase 2 en una de 4 categorías, usando criterios objetivos basados en los flujos reales de Hansel.

## LAS 4 CATEGORÍAS

### INSTALAR_AHORA
Cumple TODOS:
- [ ] Resuelve un problema activo (detectado en Fase 1)
- [ ] El flujo que mejora existe y está activo HOY en el registry
- [ ] Riesgo bajo: no puede romper nada que ya funciona
- [ ] Hansel puede usarlo sin cambiar radicalmente su workflow
- [ ] El beneficio es visible en menos de 1 semana
- [ ] No requiere setup complejo (o el setup vale la pena claramente)

### PROBAR_SANDBOX
Cumple:
- [ ] Parece útil pero no está 100% verificado
- [ ] O: el riesgo es medio (podría afectar algo que funciona)
- [ ] O: requiere configuración específica que no está documentada
- [ ] O: depende de datos de Hansel que no se tienen aún

### WATCHLIST
Cumple cualquiera de:
- [ ] La herramienta es útil pero Hansel NO está en ese flujo ahora (ej: trading, podcast, ecommerce)
- [ ] Requiere madurez del sistema que aún no se tiene (ej: multi-agente)
- [ ] Es útil pero hay prioridades más importantes ahora
- [ ] Depende de algo que aún no está implementado

Cada item en watchlist DEBE tener un **trigger** específico:
> "Activar cuando Hansel empiece a [flujo_específico]"
> "Activar cuando el sistema lleve [N] días corriendo"
> "Activar cuando [condición_técnica] esté lista"

### DESCARTAR
Cumple cualquiera de:
- [ ] No conecta con NINGÚN flujo activo ni futuro de Hansel
- [ ] Es pura moda sin sustancia técnica verificada
- [ ] Duplica algo que Hansel ya tiene y que funciona bien
- [ ] El costo no justifica el beneficio
- [ ] La herramienta está abandonada o tiene mala reputación

**Regla de descarte:** Siempre documentar POR QUÉ se descarta. Si en el futuro aparece la misma herramienta mejorada, la documentación ayuda a reevaluar rápido.

## CRITERIOS ADICIONALES DE EVALUACIÓN

### El Test de los 7 (para INSTALAR_AHORA y auto-mejoras de CloudCode):
```
1. ¿Esto le sirve a Hansel AHORA?
2. ¿Mejora sus flujos REALES (no hipotéticos)?
3. ¿Ahorra tiempo, tokens, dinero o errores?
4. ¿Mejora calidad de respuestas, edición, memoria, organización, búsqueda o ejecución?
5. ¿Tiene uso a LARGO PLAZO (no solo hoy)?
6. ¿Es SEGURO y no rompe lo que ya funciona?
7. ¿Es mejor aplicarlo ahora, en watchlist o descartar?
```

### El Test de Auto-Mejora de CloudCode (8 criterios):
```
1. ¿Hace a CloudCode más inteligente?
2. ¿Lo hace más autónomo?
3. ¿Lo hace más útil PARA HANSEL?
4. ¿Mejora memoria, búsqueda, planeación o ejecución?
5. ¿Reduce errores o trabajo repetido?
6. ¿No rompe workflows actuales?
7. ¿Puede probarse primero en sandbox?
8. ¿Tiene beneficio real a largo plazo?
```

## OUTPUT DEL FILTRO

Actualizar la herramienta evaluada con:
```json
{
  "clasificacion_final": "INSTALAR_AHORA|PROBAR_SANDBOX|WATCHLIST|DESCARTAR",
  "razon_clasificacion": "Explicación de 1-2 líneas",
  "trigger_watchlist": "Si aplica: qué condición activa esta herramienta",
  "pasa_a_fase4": true,
  "evaluado_en": "2026-06-04"
}
```

## EJEMPLOS CONCRETOS

### Ejemplo 1: Auto-subtítulos para videos
- Hansel edita video diariamente ✓
- Actualmente hace subtítulos a mano ✓
- Herramienta verificada (Whisper, CapCut AI) ✓
- Riesgo bajo ✓
- **→ INSTALAR_AHORA**

### Ejemplo 2: Sistema de trading automático
- Hansel NO está haciendo trading actualmente ✗
- **→ WATCHLIST** con trigger: "Activar cuando Hansel empiece flujo de trading"

### Ejemplo 3: Notion como segundo knowledge base
- Hansel ya tiene Obsidian ✗ (duplicación)
- No hay problema activo que Notion resuelva mejor ✗
- **→ DESCARTAR** — "Hansel ya tiene Obsidian. No añadir segunda herramienta de notas sin razón clara."

### Ejemplo 4: CrewAI framework completo
- Podría mejorar coordinación de agentes ✓
- Pero el sistema base de Hansel-OS tiene solo 1 semana ✗
- Requiere madurez técnica ✗
- **→ WATCHLIST** con trigger: "Activar cuando el sistema lleve 30+ días estable"
