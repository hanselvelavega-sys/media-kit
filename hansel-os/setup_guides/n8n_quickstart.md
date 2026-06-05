# n8n Quickstart — Hansel-OS

## Por qué n8n (y no Make)

Make tiene 2 slots gratis y cobra por operación. n8n tiene:
- **Precio plano** — ejecuciones ilimitadas
- **Nodos nativos de IA** — LangChain, RAG, vector stores integrados
- **MCP support** — se conecta directo a Claude Code
- **Auto-healing** — detecta errores y avisa automáticamente

---

## OPCIÓN A — n8n Cloud (más fácil, empieza aquí)

1. Ve a n8n.io → Start for free
2. Crea cuenta con hanselvelavega@gmail.com
3. Plan gratuito: 5 workflows activos + 5,000 executions/mes
4. Si necesitas más: plan Starter ~$20/mes

---

## OPCIÓN B — n8n Self-Hosted (más control, cero costo)

### Con Railway.app (gratis hasta $5/mes de uso):
```bash
# 1. Fork el repo de n8n en Railway
# railway.app → New Project → Deploy from Template → busca "n8n"

# Variables de entorno necesarias:
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=hansel
N8N_BASIC_AUTH_PASSWORD=TU_PASSWORD_SEGURO
N8N_HOST=0.0.0.0
N8N_PORT=5678
N8N_PROTOCOL=https
WEBHOOK_URL=https://tu-app.railway.app
GENERIC_TIMEZONE=America/Mexico_City
DB_TYPE=postgresdb  # usar PostgreSQL de Railway
```

### Con VPS (más control):
```bash
# En Ubuntu/Debian:
npm install n8n -g
n8n start

# Con PM2 para que corra siempre:
pm2 start n8n
pm2 startup
pm2 save
```

---

## PASO 1 — Importar los Workflows

Los 4 workflows de Hansel-OS están en `/hansel-os/n8n_workflows/`:

1. En n8n → Workflows → Import from File
2. Importa en este orden:
   - `03_error_monitor.json` (primero — se referencia en los otros)
   - `01_daily_hansel_os_loop.json`
   - `02_gmail_monitor.json`
   - `04_content_engine.json`

---

## PASO 2 — Crear Credenciales

Antes de activar los workflows, configura estas credenciales:

### Anthropic (Claude):
1. Settings → Credentials → Add
2. Tipo: "Anthropic"
3. Nombre: `Anthropic — Hansel-OS`
4. API Key: obtener en console.anthropic.com

### Telegram Bot:
1. Settings → Credentials → Add
2. Tipo: "Telegram API"
3. Nombre: `Telegram — Hansel-OS Bot`
4. Access Token: el token de BotFather (ver telegram_bot_setup.md)

### Gmail:
1. Settings → Credentials → Add
2. Tipo: "Gmail OAuth2"
3. Nombre: `Gmail — Hansel-OS`
4. Seguir el proceso OAuth2 (ver gmail_labels_setup.md)

---

## PASO 3 — Actualizar los Workflows

En cada workflow importado, busca todos los `REEMPLAZAR_CON_...` y actualiza:
- `REEMPLAZAR_CON_TU_CREDENTIAL_ID` → selecciona tu credencial del dropdown
- `REEMPLAZAR_CON_TU_CHAT_ID` → tu Telegram Chat ID (ver telegram_bot_setup.md)

---

## PASO 4 — Configurar Error Workflow

Para que los errores lleguen a Telegram:
1. Abre cada workflow
2. Click en los 3 puntos → Settings
3. En "Error Workflow" → selecciona `🚨 HANSEL-OS — Error Monitor & Alert`
4. Guarda

---

## PASO 5 — Activar en orden

1. Activa primero: `🚨 HANSEL-OS — Error Monitor & Alert`
2. Activa: `📧 HANSEL-OS — Gmail Monitor + Auto-Label`
3. Activa: `🎬 HANSEL-OS — Content Engine 12pm`
4. Activa: `🤖 HANSEL-OS — Daily Loop Trigger`

---

## Pruebas

Para probar sin esperar al horario programado:
- En cualquier workflow → click en "Test Workflow" (o el botón de play triangular)
- Si recibiste mensaje en Telegram ✅ → todo funciona
- Si aparece error → revisa el node que se marcó en rojo

---

## Schedule de Hansel-OS en n8n

| Workflow | Hora | Frecuencia |
|----------|------|------------|
| Daily Loop (Scan + Reporte) | 8:00am | Cada día |
| Content Engine | 12:00pm | Cada día |
| Gmail Monitor | Continuo | Cada 15 min |
| Error Monitor | Continuo | On-demand |

---

## Próximos Workflows a Crear (Semana 2+)

- `05_audiciones_pipeline.json` — auto-ingesta de audiciones al CRM
- `06_cotizaciones_auto.json` — template + seguimiento automático 3/7/14 días
- `07_content_repurpose.json` — repropósito 1 video → 3 formatos
- `08_crm_sync.json` — sincronización Zoho ↔ n8n
