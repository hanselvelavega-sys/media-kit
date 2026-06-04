# FASE 2 — External Improvement Search
*Instrucciones para buscar mejoras externas de forma inteligente y estructurada*

## OBJETIVO
Buscar nuevas herramientas, skills, agentes, frameworks, templates o métodos que puedan mejorar el sistema de Hansel O el propio CloudCode. Sin instalación indiscriminada. Sin moda. Solo lo que conecta con flujos reales.

## CUÁNDO BUSCAR
- Cuando la Fase 1 detecta un problema sin solución obvia
- Una vez por semana (búsqueda proactiva de novedades)
- Cuando Hansel menciona una necesidad específica
- Cuando el Self-Improvement Engine identifica una debilidad de CloudCode

## ÁREAS DE BÚSQUEDA PRIORITARIAS

### Para Workflows de Hansel:
1. **Automatización:** n8n updates, Make templates, Zapier integrations, workflow builders
2. **Memoria/Contexto:** Obsidian plugins, knowledge graphs, RAG systems, note automation
3. **Edición de Video:** CapCut automation, AI subtitles, hook templates, repurposing tools
4. **Contenido UGC:** UGC platforms, brand marketplaces, content automation stacks
5. **CRM/Ventas:** CRM automation, proposal tools, follow-up sequences, deal tracking
6. **Productividad:** Gmail automation, Calendar optimization, Drive organization
7. **Analytics:** Social media analytics, unified dashboards, content performance tracking

### Para el propio CloudCode (Self-Improvement):
1. **Agentes y Frameworks:** AutoGPT, CrewAI, LangGraph, MetaGPT, OpenDevin, SWE-agent updates
2. **Memoria:** Memory systems, knowledge base architectures, context management
3. **Búsqueda:** Deep search methods, query optimization, source verification
4. **Razonamiento:** Chain-of-thought improvements, planning frameworks, decision trees
5. **Tokens:** Prompt compression, context optimization, caching strategies
6. **Evaluación:** Quality rubrics, output scoring, feedback loops

## PROTOCOLO DE BÚSQUEDA

### Query Strategy (Fanout Method):
Para cada tema, hacer 3 tipos de búsqueda:

**Búsqueda 1 — Específica (problema conocido):**
```
"[herramienta_específica] automation [año]"
"best [tipo_herramienta] for [caso_uso] 2025 2026"
```

**Búsqueda 2 — Comparativa:**
```
"[herramienta_actual] vs [alternativa] comparison"
"alternatives to [herramienta_actual]"
```

**Búsqueda 3 — Tendencias:**
```
"new [área] tools [año]"
"[área] automation trends 2026"
```

### Verificación de Resultados:
Antes de recomendar una herramienta, verificar:
- [ ] ¿Está activamente mantenida? (últimos commits/updates < 6 meses)
- [ ] ¿Tiene usuarios reales? (reviews, testimonios, casos de uso)
- [ ] ¿Es gratuita o el costo es razonable para Hansel?
- [ ] ¿Hay integración con Make/n8n disponible?
- [ ] ¿Hay documentación en español o inglés accesible?

## OUTPUT DE BÚSQUEDA

Para cada herramienta encontrada, documentar:
```json
{
  "nombre": "Herramienta X",
  "url": "https://...",
  "tipo": "skill|herramienta|agente|framework|template|metodo",
  "que_hace": "descripcion de 1 linea",
  "caso_de_uso_hansel": "cómo mejora un flujo específico de Hansel",
  "flujo_que_mejora": "nombre del workflow del registry",
  "costo": "gratis|freemium|precio/mes",
  "mantenida_activamente": true,
  "integracion_make_n8n": true,
  "pasa_a_fase3": true,
  "notas_de_investigacion": "..."
}
```

## REGLAS DE BÚSQUEDA

1. **Buscar con propósito.** Siempre partir de un problema detectado en Fase 1.
2. **No más de 3 búsquedas por tema.** Sintetizar, no acumular infinitamente.
3. **Verificar antes de recomendar.** No recomendar herramientas no verificadas.
4. **Conectar con workflow real.** Si no hay un workflow al que conectar, va a watchlist.
5. **Incluir comparación.** Siempre comparar contra lo que Hansel ya usa.
6. **Para self-improvement:** Primero verificar que los sistemas propios (CrewAI, etc.) son realmente mejores en algo concreto, no solo más populares.
