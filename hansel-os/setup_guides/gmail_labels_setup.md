# Gmail Labels Setup — Hansel-OS

## Por qué necesitas estas labels

El sistema Hansel-OS clasifica automáticamente tus emails con Claude. Para que funcione el auto-label, las labels deben existir primero en Gmail. Este es un proceso de 2 minutos que solo haces una vez.

---

## PASO 1 — Crear las Labels en Gmail

Ve a Gmail → Settings (ícono engranaje) → See all settings → Labels → Create new label.

Crea estas **5 labels** exactamente con estos nombres:

| Label | Color Recomendado | Para qué sirve |
|-------|-------------------|----------------|
| `🎬 Audiciones` | Rojo | Castings, convocatorias, agencias de actuación |
| `🤝 Colaboraciones` | Verde | Marcas para UGC, propuestas de contenido |
| `💪 Coaching` | Azul | Clientes de coaching, sesiones, seguimientos |
| `💳 Facturas` | Naranja | Pagos, facturas, Stripe, cobros |
| `🤖 Hansel-OS` | Morado | Reportes del sistema, notificaciones automáticas |

### Cómo crear cada label:
1. En Gmail, haz clic en el ícono ⚙️ (Settings)
2. Click en "See all settings"
3. Click en pestaña "Labels"
4. Scroll hasta abajo → "Create new label"
5. Escribe el nombre EXACTO (con emoji incluido)
6. Click "Create"
7. Repite para las 5 labels

---

## PASO 2 — Crear Filtros Automáticos (Método Manual)

Si no tienes n8n funcionando aún, puedes crear filtros básicos manualmente.

### Filtro para Audiciones:
1. En Gmail → Settings → Filters → Create a new filter
2. En "Has the words": `audición OR casting OR convocatoria OR "se busca actor" OR "se busca modelo" OR "production" OR "casting call"`
3. Click "Create filter"
4. Selecciona: "Apply the label" → `🎬 Audiciones`
5. También selecciona: "Never send to Spam"
6. Click "Create filter"

### Filtro para Facturas:
1. Nueva regla → Has the words: `factura OR invoice OR "payment" OR stripe OR "pago recibido" OR "receipt"`
2. Apply label: `💳 Facturas`
3. Also: "Never send to Spam"

### Filtro para Hansel-OS (emails del propio sistema):
1. Nueva regla → From: `hanselvelavega@gmail.com` AND Subject: `HANSEL-OS OR CONTENT ENGINE`
2. Apply label: `🤖 Hansel-OS`
3. Also: "Mark as read" (para que no sature el inbox)

---

## PASO 3 — Conectar con n8n (Automático)

Una vez que tengas el workflow `02_gmail_monitor.json` activo en n8n, el sistema:

1. Detecta cada email nuevo en inbox
2. Lo envía a Claude para clasificación
3. Claude responde con: categoría + prioridad + acción
4. n8n aplica la label correcta automáticamente
5. Si es P1, te manda alerta por Telegram

**Este método es más inteligente** que los filtros manuales porque entiende contexto, no solo keywords.

---

## PASO 4 — Configurar Gmail en n8n

1. En n8n → Settings → Credentials → Add Credential
2. Selecciona "Gmail OAuth2 API"
3. Nombre: `Gmail — Hansel-OS`
4. Client ID y Client Secret: crear en Google Cloud Console
   - Ve a console.cloud.google.com
   - Crear proyecto o usar existente
   - Habilitar Gmail API
   - Crear credenciales OAuth2 (tipo: Web application)
   - URI de redirección: la que te da n8n (algo como `https://tu-n8n.com/rest/oauth2-credential/callback`)
5. Autoriza con hanselvelavega@gmail.com

---

## Verificación

**Checklist:**
- [ ] 5 labels creadas en Gmail (con emojis exactos)
- [ ] Filtros manuales para Audiciones y Facturas creados
- [ ] Credencial Gmail configurada en n8n
- [ ] Workflow 02_gmail_monitor.json importado y activo
- [ ] Email de prueba correctamente clasificado

---

## Troubleshooting

**El emoji no se muestra bien en la label:**
Gmail acepta emojis en labels — si ves caracteres raros, prueba copiar el emoji directamente desde este documento.

**n8n no puede aplicar labels:**
Las labels de Gmail tienen IDs internos que n8n necesita. Puedes obtenerlos así:
```
GET https://gmail.googleapis.com/gmail/v1/users/me/labels
```
O desde n8n → usa el nodo Gmail con operación "Get All Labels" para ver los IDs.
