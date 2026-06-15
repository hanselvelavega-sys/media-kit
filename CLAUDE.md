# Media Kit — Workflow Dual-Agente

## Cómo funciona la integración Claude + Codex

Cada vez que Claude edita un archivo, el hook `PostToolUse` llama automáticamente a Codex CLI.
Codex revisa el diff y escribe sus sugerencias en `.codex-review.md`.

## Instrucciones para Claude

**ANTES de dar la tarea por terminada**, siempre:

1. Verificar si existe `.codex-review.md` y fue modificado en los últimos 2 minutos
2. Si existe, leerlo completo
3. Aplicar los puntos de "Problemas encontrados" sin preguntar
4. Aplicar los puntos de "Mejoras de calidad" si tienen sentido en contexto
5. Ignorar o justificar brevemente los "Sugerencias opcionales" que no apliquen
6. Borrar `.codex-review.md` después de procesarlo (para que no se acumule)

Si `.codex-review.md` no existe o está vacío, continuar normalmente.

## Proyecto

- **Tipo:** Media kit estático — un solo archivo `index.html`
- **Estética:** Luxury dark, negro profundo, dorado `#C9A84C`
- **Fuentes:** Cormorant Garamond, Inter, Montserrat (Google Fonts)
- **Sin frameworks:** HTML5 + CSS3 + JS vanilla puro

## Reglas de estilo de código

- No agregar comentarios a menos que la lógica sea muy no obvia
- No romper la estética luxury — cualquier cambio visual debe mantener el tono oscuro/dorado
- El archivo debe seguir siendo auto-contenido (sin dependencias externas nuevas)
