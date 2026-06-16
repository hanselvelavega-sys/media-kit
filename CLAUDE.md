# Media Kit — Workflow Multi-IA (5 agentes)

## Arquitectura

Cada vez que Claude edita un archivo, el hook `PostToolUse` lanza 4 revisores en paralelo:

| Agente | Empresa | Fortaleza | Requiere |
|--------|---------|-----------|----------|
| Codex | OpenAI | Bugs, lógica, corrección técnica | `OPENAI_API_KEY` + CLI |
| Gemini 2.5 Pro | Google | Accesibilidad WCAG, Core Web Vitals, SEO | `GEMINI_API_KEY` + CLI |
| Kimi K2 | Moonshot AI | UX, responsive, compatibilidad cross-browser | `MOONSHOT_API_KEY` |
| Ollama (local) | Comunidad | Revisión offline, sin API key | `ollama` instalado + modelo |

Las revisiones se consolidan en `.ai-review.md`.

## Setup rápido (ejecutar una sola vez en tu máquina local)

```bash
bash scripts/setup-keys.sh
```

Instala Ollama, baja el modelo `qwen2.5-coder:7b` y guarda las API keys.

## Variables de entorno

```bash
export OPENAI_API_KEY="sk-..."       # Para Codex
export GEMINI_API_KEY="AIza..."      # Para Gemini 2.5 Pro
export MOONSHOT_API_KEY="sk-..."     # Para Kimi K2
# Ollama no necesita key — corre local
```

Si una key falta, ese revisor se salta automáticamente sin romper el flujo.

## Instrucciones para Claude

**ANTES de dar la tarea por terminada**, siempre:

1. Verificar si existe `.ai-review.md` y fue modificado en los últimos 3 minutos
2. Si existe, leerlo completo
3. Aplicar todos los puntos de "Problemas encontrados" sin preguntar
4. Aplicar los puntos de "Mejoras de calidad" que tengan sentido en contexto
5. Evaluar "Sugerencias opcionales" y aplicar las que aporten sin romper la estética
6. Borrar `.ai-review.md` después de procesarlo

Si `.ai-review.md` no existe o está vacío, continuar normalmente.

## Proyecto

- **Tipo:** Media kit estático — un solo archivo `index.html`
- **Estética:** Luxury dark, negro profundo, dorado `#C9A84C`
- **Fuentes:** Cormorant Garamond, Inter, Montserrat (Google Fonts)
- **Sin frameworks:** HTML5 + CSS3 + JS vanilla puro

## Reglas de estilo de código

- No agregar comentarios a menos que la lógica sea muy no obvia
- No romper la estética luxury — cualquier cambio visual debe mantener el tono oscuro/dorado
- El archivo debe seguir siendo auto-contenido (sin dependencias externas nuevas)
