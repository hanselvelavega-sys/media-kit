# Knowledge Base — Hansel-OS
*Memoria estructurada del sistema. Se actualiza tras cada sesión.*

---

## META

- **Iniciado:** 2026-06-04
- **Versión:** 1.0.0
- **Última actualización:** 2026-06-04
- **Sesiones registradas:** 1

---

## PERFIL DE HANSEL (Resumen Operativo)

Hansel es creador de contenido UGC, actor/modelo, coach y operador de negocios digitales. Trabaja principalmente en español. Sus flujos más críticos son: audiciones, colaboraciones, edición de video, CRM, cotizaciones y automatización de contenido.

**Prioridades absolutas:** No perder oportunidades de audición. No olvidar seguimientos. Publicar contenido consistentemente. Reducir trabajo manual.

---

## APRENDIZAJES DEL SISTEMA

### 2026-06-04 — Sesión de Inicialización
- El sistema parte desde cero con solo `index.html` en el repo.
- Se detectaron 16 flujos activos inicialmente, ampliado a 21 tras análisis de MCPs conectadas.
- Los pain points más críticos transversales: seguimiento manual, datos duplicados en múltiples CRMs, herramientas subutilizadas.
- **Integración pendiente clave:** Telegram bot para notificaciones del sistema.
- **Gap de memoria crítico:** Obsidian no está conectado a ningún otro sistema — isla.

### 2026-06-04 — Ruflo Descubierto y Clasificado
- **Ruflo = ruvnet/ruflo** en GitHub (57,800+ estrellas, el meta-harness de agentes más adoptado para Claude Code en 2026).
- Antes se llamaba **Claude Flow** — renombrado en enero 2026.
- NO es un sistema de gestión de Hansel. Es un **motor de multi-agentes** que se instala sobre Claude Code.
- **Capacidades clave:** swarm de 100+ agentes especializados, memoria vectorial HNSW (150x más rápida), self-learning, RAG, 314 MCP tools, topologías de coordinación (hierarchical/mesh/ring/star).
- **Relación con Hansel-OS:** Ruflo ES el motor que puede convertir a Hansel-OS de single-agent a multi-agent. Hansel-OS pone la lógica y memoria; Ruflo ejecuta en paralelo con múltiples agentes especializados.
- **Estado actual:** Instalado pero probablemente subutilizado — no integrado al flujo de Hansel-OS.
- **Acción futura:** Auditar configuración actual de Ruflo de Hansel. Diseñar integración. Esto pasa a P1 crítico.

### 2026-06-04 — Alerta: 4 CRMs Activos Detectados
- Por MCPs conectadas se detectó **HubSpot** además de Zoho + Apollo + Close.
- Total: **4 CRMs** con datos probablemente fragmentados.
- Estrategia recomendada: Zoho = fuente de verdad (contactos/deals), Apollo = solo prospección, Close = secuencias activas de ventas, HubSpot = confirmar si es para email marketing o duplicado.
- **Esta es la prioridad #1 de consolidación.**

### 2026-06-04 — Alerta: 2 Sistemas de Notas Detectados
- Notion MCP conectado + Obsidian activo = posible duplicación.
- Definir: Notion para docs colaborativos y bases de datos, Obsidian para conocimiento personal profundo.
- **Requiere confirmación de Hansel.**

---

## PATRONES DETECTADOS

### Patrones Positivos (mantener)
*(Vacío en inicio — se llenará con el tiempo)*

### Patrones Negativos (a eliminar)
- **Duplicación CRM (CRÍTICO):** 4 CRMs activos: Zoho + Apollo + Close + HubSpot. Decisión: Zoho = fuente de verdad, Apollo = solo prospección, Close = eliminar, HubSpot = confirmar uso.
- **Automatización duplicada:** Make + n8n haciendo cosas similares. Consolidar a n8n como motor IA-nativo. Make solo para flows que ya funcionan.
- **Seguimiento manual:** La mayoría de flujos de ventas/colaboraciones depende de recordar manualmente.
- **Obsidian como isla:** Rico en notas pero no conectado a flujos operativos.
- **Ruflo subutilizado:** El motor multi-agente más poderoso disponible no está integrado al sistema.

### Patrones de Tokens (optimización)
*(Se llenará tras analizar uso en sesiones)*

---

## HERRAMIENTAS EVALUADAS

### Aprobadas e Instaladas
| Herramienta | Fecha | Flujo | Resultado |
|-------------|-------|-------|-----------|
| *(vacío — primera sesión)* | | | |

### En Sandbox
| Herramienta | Fecha | Estado | Notas |
|-------------|-------|--------|-------|
| *(vacío)* | | | |

### Descartadas
| Herramienta | Fecha | Razón | Revisar_si |
|-------------|-------|-------|-----------|
| *(vacío)* | | | |

---

## CONOCIMIENTO POR DOMINIO

### Automatización (n8n / Make)
- Hansel tiene flujos en Make Y n8n. Sin documentación centralizada.
- **Próxima acción:** Mapear todos los scenarios en Make + workflows en n8n. Identificar cuáles están activos, cuáles fallaron, cuáles están duplicados.

### CRM
- Usa: Zoho CRM (principal), Apollo (prospección), Close CRM (ventas).
- **Problema:** Datos probablemente dispersos. Necesita definir un CRM primario.
- **Recomendación inicial:** Zoho como fuente de verdad + Apollo solo para prospección + Close para secuencias de ventas activas.

### Contenido y Video
- Plataformas: TikTok, Instagram Reels, YouTube Shorts.
- Herramientas de edición: CapCut (mobile), Premiere (desktop).
- **Gap:** Sin flujo de repropósito automatizado. Cada pieza se edita desde cero.

### Obsidian
- Existe como vault personal pero está desconectado.
- **Oportunidad:** Conectar a Make para auto-capturar notas de reuniones, ideas de contenido, seguimientos de clientes.

### Gmail
- **Gap:** No hay filtros ni etiquetas estructuradas. Inbox sin sistema.
- **Oportunidad:** Zapier/Make para clasificar automáticamente: audiciones, colaboraciones, facturas, coaching.

---

## MEJORAS DEL PROPIO CLOUDCODE

### Mejoras Aplicadas
| Fecha | Mejora | Impacto | Medición |
|-------|--------|---------|----------|
| 2026-06-04 | Estructura base de CLAUDE.md con protocolo de inicio | +Contexto en cada sesión | Sesiones con menos preguntas repetidas |

### Mejoras en Prueba
*(vacío)*

### Mejoras en Watchlist
*(vacío)*

---

## GLOSARIO DEL SISTEMA

- **UGC:** User Generated Content (contenido de marca creado por Hansel para empresas)
- **Audición:** Casting o proceso de selección para actuación/modelaje
- **Ruflo:** Sistema/plataforma propio de Hansel (detalles a confirmar)
- **Fuga:** Pérdida de tiempo, dinero o energía sin retorno
- **Sandbox:** Ambiente de prueba aislado antes de producción
- **Watchlist:** Lista de herramientas/ideas útiles pero no urgentes ahora

---

*Este archivo se actualiza automáticamente. No editar manualmente.*
