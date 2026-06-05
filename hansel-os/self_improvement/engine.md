# Self-Improvement Engine
*El módulo que hace que CloudCode evolucione*

## IDENTIDAD DEL MÓDULO

El Self-Improvement Engine no es un proceso separado. Es una capa de meta-cognición que corre encima de todo lo demás. Su pregunta permanente es: **"¿Cómo puede CloudCode hacer esto mejor la próxima vez?"**

## ARQUITECTURA

```
                    ┌─────────────────────────────────────┐
                    │      SELF-IMPROVEMENT ENGINE        │
                    │                                     │
┌─────────────┐     │  ┌──────────┐    ┌──────────────┐  │
│  Daily Scan │────▶│  │ Weakness │    │   External   │  │
│  (Fase 1)  │     │  │ Detector │    │   Research   │  │
└─────────────┘     │  └────┬─────┘    └──────┬───────┘  │
                    │       │                  │          │
┌─────────────┐     │  ┌────▼──────────────────▼──────┐  │
│  Execution  │────▶│  │     Upgrade Evaluator        │  │
│  (Fase 5)  │     │  │  (Self-Improvement Filter)   │  │
└─────────────┘     │  └─────────────┬────────────────┘  │
                    │                │                    │
                    │  ┌─────────────▼────────────────┐  │
                    │  │    Upgrade Candidates DB      │  │
                    │  │    upgrade_candidates.json    │  │
                    │  └─────────────┬────────────────┘  │
                    │                │                    │
                    │    ┌───────────┴──────────┐         │
                    │    │      Sandbox         │         │
                    │    │  (test environment)  │         │
                    │    └───────────┬──────────┘         │
                    │                │                    │
                    │  ┌─────────────▼────────────────┐  │
                    │  │    Safe Application to        │  │
                    │  │    CLAUDE.md / System Files   │  │
                    │  └─────────────┬────────────────┘  │
                    │                │                    │
                    │  ┌─────────────▼────────────────┐  │
                    │  │    upgrade_history.json       │  │
                    │  │    + capabilities.json        │  │
                    │  └──────────────────────────────┘  │
                    └─────────────────────────────────────┘
```

## LAS 8 TAREAS DEL ENGINE

### TAREA 1: Buscar Mejoras para CloudCode

**Fuentes de búsqueda:**
- GitHub releases de Claude Code / Anthropic SDK
- Papers de agentes IA (arxiv, papers with code)
- Frameworks populares: LangChain, LangGraph, CrewAI, AutoGPT, OpenDevin, MetaGPT
- Posts de HackerNews, Reddit r/LocalLLaMA, Twitter/X sobre agentes
- Blogs técnicos: Simon Willison, Eugene Yan, Lilian Weng

**Queries de búsqueda base:**
```
"AI agent self-improvement 2026"
"LLM memory systems production"
"Claude Code tips tricks advanced"
"multi-agent coordination patterns"
"prompt optimization techniques LLM"
"AI agent evaluation frameworks"
"context window management LLM"
"agentic AI workflow automation"
```

**Frecuencia:** Semanal (búsqueda profunda), Diaria (monitoreo de novedades críticas)

---

### TAREA 2: Comparar contra Sistemas Externos

**Sistemas a comparar:**

| Sistema | URL | Fortaleza Principal | ¿Qué podemos adaptar? |
|---------|-----|--------------------|-----------------------|
| CrewAI | github.com/joaomdmoura/crewAI | Roles de agentes, task delegation | Patrones de roles especializados |
| LangGraph | github.com/langchain-ai/langgraph | State machines para agentes | Manejo de estado entre sesiones |
| AutoGPT | github.com/Significant-Gravitas/AutoGPT | Loop autónomo de tareas | Protocolo de auto-revisión |
| OpenDevin | github.com/OpenDevin/OpenDevin | Ejecución de código autónoma | Verificación post-ejecución |
| SWE-agent | github.com/princeton-nlp/SWE-agent | Debug de código sistemático | Estrategia de diagnóstico |
| MetaGPT | github.com/geekan/MetaGPT | Roles de equipo de software | Documentación automática |

**Proceso de comparación:**
1. ¿Qué hace que yo no hago?
2. ¿Lo que hace es relevante para Hansel?
3. ¿Puedo adaptar la técnica sin instalar el framework completo?
4. ¿El beneficio justifica la complejidad?

---

### TAREA 3: Detectar Debilidades Internas

**Señales de debilidad activa:**
- Hansel pregunta algo que ya se respondió → falla de memoria
- Se repite el mismo error → falla de aprendizaje
- Se usan 50+ tokens en algo que podría hacerse en 10 → ineficiencia
- Se tarda más de lo necesario en encontrar un archivo → falla de búsqueda
- Se pide información que está en knowledge_base.md → falla de carga de contexto
- Un plan falla porque no se consideró un riesgo obvio → falla de razonamiento
- Se da una respuesta incorrecta sobre algo de Hansel → falla de contexto

**Métricas de debilidad (auto-evaluación post-sesión):**
```
¿Pregunté algo ya documentado? [sí/no]
¿Repetí trabajo de sesión anterior? [sí/no]
¿Hay errores en lo que implementé? [sí/no]
¿El reporte fue claro y accionable? [sí/no]
¿Tomé decisiones correctas sin pedir permiso? [sí/no]
¿Hubo algo que debí hacer pero no hice? [descripción]
```

---

### TAREA 4: Proponer Upgrades

Cada upgrade propuesto va a `upgrade_candidates.json` con:
- Debilidad que corrige
- Cómo la corrige específicamente
- Clasificación: CRITICA/UTIL/EXPERIMENTAL/IRRELEVANTE
- Cómo probar en sandbox
- Cómo medir si funcionó

---

### TAREA 5: Probar en Sandbox

**Estructura de sandbox:**
```
hansel-os/self_improvement/sandbox/
├── [nombre-upgrade]/
│   ├── README.md          # Qué se está probando
│   ├── test_input.md      # Input de prueba
│   ├── expected_output.md # Output esperado
│   ├── actual_output.md   # Output real obtenido
│   └── results.md         # Análisis de resultados
```

**Criterios de éxito en sandbox:**
- El upgrade hace lo que prometió
- No rompe nada del sistema actual
- El beneficio es medible
- Puede implementarse sin efectos secundarios

---

### TAREA 6: Implementar Upgrades Seguros

Los upgrades clasificados como CRITICA o UTIL que pasan el sandbox se aplican a:
- `CLAUDE.md` — cambios en comportamiento/protocolo
- `hansel-os/core/system_config.json` — cambios de configuración
- `hansel-os/self_improvement/capabilities.json` — actualización de estado
- `hansel-os/phases/` — mejoras a instrucciones de fases
- `hansel-os/filters/` — mejoras a filtros de decisión

**Siempre con:**
1. Commit de snapshot antes
2. Documentación del cambio
3. Verificación post-implementación

---

### TAREA 7: Guardar Memoria de Upgrades

Después de cada upgrade (exitoso o fallido):

```json
{
  "id": "UH-XXX",
  "fecha": "YYYY-MM-DD",
  "upgrade": "nombre",
  "resultado": "exitoso|fallido|inconcluso",
  "que_funciono": "...",
  "que_no_funciono": "...",
  "leccion_aprendida": "...",
  "impacto_en_capabilities": "..."
}
```

**Regla de oro:** Un upgrade fallido que está documentado vale más que un éxito que no se documentó. Los fallos enseñan más.

---

### TAREA 8: Reportar Diariamente

Sección en el Daily Report:
```
## AUTO-MEJORA DE CLOUDCODE HOY

### Encontré:
- [N] posibles upgrades para CloudCode
- [lista de los más relevantes]

### Apliqué:
- [upgrade aplicado] → [resultado]

### En sandbox:
- [upgrade en prueba] → [estado actual]

### Watchlist CloudCode:
- [upgrade guardado] → [trigger]

### Capacidad ganada:
- [si aplica] → +[N] puntos en [área]

### Riesgo detectado:
- [si aplica]
```

## HOJA DE RUTA DE EVOLUCIÓN

### Mes 1 (Fundamentos)
- [x] Estructura base de memoria
- [x] Protocolo de inicio de sesión
- [x] Filtros de decisión explícitos
- [ ] Token budget tracking
- [ ] Deep Research protocol
- [ ] Quality rubrics

### Mes 2 (Eficiencia)
- [ ] Tiered context loading (probado en sandbox)
- [ ] Telegram bot de notificaciones
- [ ] Monitoring de Make/n8n
- [ ] CRM unificado

### Mes 3 (Autonomía)
- [ ] Sesiones programadas (via Make/n8n)
- [ ] Feedback loop automático de calidad
- [ ] Primeros experimentos multi-agente

### Mes 4+ (Inteligencia)
- [ ] Búsqueda semántica en knowledge base
- [ ] Multi-agent coordinado para tareas complejas
- [ ] Aprendizaje continuo estructurado
