# FASE 6 — Memory + Learning
*Cómo guardar lo aprendido para que el sistema mejore con el tiempo*

## PRINCIPIO CENTRAL
**"Si se aprendió una vez, no se aprende de nuevo."** Cada error, decisión y mejora debe quedarse registrada para que las próximas sesiones partan de un estado más avanzado.

## QUÉ GUARDAR Y DÓNDE

### 1. knowledge_base.md — Aprendizajes Generales
**Qué va aquí:**
- Patrones detectados (positivos y negativos)
- Cómo funciona realmente cada workflow de Hansel
- Preferencias y restricciones descubiertas
- Contexto de negocio importante

**Cuándo actualizar:**
- Cuando se aprende algo nuevo sobre un workflow
- Cuando se detecta un patrón que antes no estaba documentado
- Cuando Hansel corrige un malentendido

**Formato:**
```markdown
### [YYYY-MM-DD] — [Tema del aprendizaje]
**Contexto:** Qué pasó
**Aprendizaje:** Qué se aprendió
**Aplicar cuando:** Cuándo usar este conocimiento
```

### 2. watchlist.json — Items en Espera
**Qué va aquí:**
- Herramientas útiles pero no para ahora
- Ideas guardadas para el futuro
- Flujos futuros de Hansel identificados

**Cuándo actualizar:**
- Al añadir item: incluir trigger de activación
- Al activar item: mover a decisions.json como INSTALAR
- Al revisar watchlist semanalmente: actualizar estado

### 3. decisions.json — Historial de Decisiones
**Qué va aquí:**
- Toda decisión significativa tomada
- Por qué se tomó esa decisión
- Qué resultado tuvo

**Cuándo actualizar:**
- Al tomar cualquier decisión de implementación
- Al descartar una herramienta (con razón documentada)
- Al revisar una decisión pasada

### 4. improvements_applied.json — Mejoras Implementadas
**Qué va aquí:**
- Todo lo que se implementó exitosamente
- Métricas de resultado

**Cuándo actualizar:**
- Inmediatamente después de implementar algo

### 5. upgrade_history.json — Historial de Auto-Mejoras
**Qué va aquí:**
- Cambios al propio sistema CloudCode
- Upgrades a CLAUDE.md, capabilities.json, templates

**Cuándo actualizar:**
- Después de cada upgrade de CloudCode

### 6. capabilities.json — Estado Actual de CloudCode
**Qué va aquí:**
- Niveles de capacidad actualizados
- Mejoras aplicadas y su impacto

**Cuándo actualizar:**
- Después de aplicar cualquier upgrade de CloudCode
- Mensualmente para revisar progreso

## PROTOCOLO DE ACTUALIZACIÓN DE MEMORIA

### Al final de cada sesión:

```
1. ¿Se aprendió algo nuevo sobre Hansel o sus flujos?
   SÍ → Añadir a knowledge_base.md
   
2. ¿Se descartó alguna herramienta?
   SÍ → Añadir a decisions.json con razón

3. ¿Se añadió algo a watchlist?
   SÍ → Verificar que tiene trigger de activación

4. ¿Se implementó algo?
   SÍ → Actualizar improvements_applied.json

5. ¿Se mejoró el propio CloudCode?
   SÍ → Actualizar upgrade_history.json + capabilities.json

6. ¿Hay decisiones pendientes de aprobación de Hansel?
   SÍ → Mantener en decisions.json con estado "pendiente_aprobacion"
```

## ANTI-PATRONES A EVITAR

### Lo que NO debe pasar:
- "Olvidar" que ya se evaluó una herramienta y evaluarla de nuevo
- Guardar información sin estructura (notas sueltas sin schema)
- Actualizar memoria pero no el registry (o viceversa)
- Guardar resultados sin métricas
- Documentar qué pasó pero no POR QUÉ pasó

### Señales de memoria rota:
- CloudCode pregunta algo que ya se respondió en sesiones anteriores
- Se recomienda una herramienta que ya fue descartada
- Se repite análisis de algo que ya está en knowledge_base.md
- Las capabilities.json no reflejan el estado real del sistema

## REVISIÓN PERIÓDICA DE MEMORIA

**Semanal:**
- Revisar watchlist.json — ¿algún trigger se activó?
- Verificar que knowledge_base.md está actualizado

**Mensual:**
- Revisar decisions.json — ¿alguna decisión necesita ser reevaluada?
- Actualizar capabilities.json con estado real
- Archivar reportes de más de 30 días a reports/archive/

**Trimestral:**
- Revisar items en watchlist con más de 90 días — ¿siguen relevantes?
- Evaluar si el score global de capabilities mejoró según objetivos
