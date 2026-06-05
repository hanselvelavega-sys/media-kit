# Telegram Bot Setup — Hansel-OS

## ¿Qué hace este bot?
El bot es el canal de comunicación entre el sistema Hansel-OS y tú. Te manda:
- Daily Report a las 8am (resultado del scan diario)
- Content Brief a las 12pm (ideas de contenido del día)
- Alertas de errores en tiempo real
- Notificaciones P1 de emails importantes

---

## PASO 1 — Crear el Bot en BotFather

1. Abre Telegram y busca `@BotFather`
2. Envía el comando: `/newbot`
3. Te pedirá un nombre para mostrar → escribe: `Hansel-OS`
4. Te pedirá un username (único) → escribe: `hansel_os_bot` (si no está disponible, prueba `hansel_vela_os_bot` o similar)
5. BotFather te dará un **token** con formato: `7xxxxxxxxx:AAH_xxxxxxxxxxxxxxxxxxxxxxxxxxxx`
6. **Guarda este token** — lo necesitas para todo lo que sigue

---

## PASO 2 — Obtener tu Chat ID

1. Busca tu nuevo bot en Telegram por su username y envíale cualquier mensaje (ej: "hola")
2. Abre este URL en tu navegador (reemplaza TOKEN con tu token real):
   ```
   https://api.telegram.org/bot<TOKEN>/getUpdates
   ```
3. Verás un JSON. Busca: `"chat": {"id": XXXXXXXX}`
4. Ese número es tu **Chat ID** — guárdalo

**Alternativa más fácil:** Busca `@userinfobot` en Telegram y envíale cualquier mensaje. Te dará tu ID directamente.

---

## PASO 3 — Configurar en Make.com

1. Ve a Make.com → tu escenario "🤖 HANSEL-OS — Daily Loop 8am"
2. Haz clic en el módulo de Telegram (si no existe, agrégalo)
3. En la conexión, selecciona "Add" → ingresa tu **Bot Token**
4. En el campo Chat ID, ingresa tu **Chat ID**
5. Guarda y prueba enviando un mensaje de test

---

## PASO 4 — Configurar en n8n

1. En n8n → Settings → Credentials → Add Credential
2. Selecciona "Telegram API"
3. Nombre: `Telegram — Hansel-OS Bot`
4. Access Token: pega tu **Bot Token**
5. Guarda
6. En cada workflow que use Telegram, selecciona esta credencial
7. En el campo Chat ID, pon tu **Chat ID**

---

## PASO 5 — Personalizar el Bot (Opcional)

En BotFather puedes personalizar:
- `/setdescription` → "Sistema autónomo de mejora continua de Hansel Vela"
- `/setabouttext` → "Bot privado de Hansel-OS"  
- `/setuserpic` → Subir foto de perfil del bot
- `/setcommands` → Configurar comandos (para versiones futuras)

---

## Comandos Futuros (Roadmap)

Una vez que el bot esté conectado a n8n, puedes crear webhooks para que responda a comandos:

| Comando | Acción |
|---------|--------|
| `/status` | Estado actual de todos los workflows |
| `/p1` | Ver solo los items P1 del día |
| `/aprobar IMP-001` | Aprobar una mejora pendiente |
| `/rechazar IMP-001` | Rechazar una mejora |
| `/scan` | Ejecutar Daily Scan ahora mismo |
| `/reporte` | Ver el último reporte |

---

## Verificación

Si todo está bien, deberías recibir un mensaje cuando actives los workflows. Para probar ahora mismo, en Make.com ejecuta el escenario manualmente (botón "Run Once").

**Checklist:**
- [ ] Bot creado en BotFather
- [ ] Token guardado de forma segura
- [ ] Chat ID obtenido
- [ ] Credencial configurada en Make.com
- [ ] Credencial configurada en n8n
- [ ] Mensaje de prueba recibido
