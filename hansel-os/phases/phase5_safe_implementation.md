# FASE 5 — Safe Implementation
*Cómo implementar mejoras sin romper lo que funciona*

## REGLA PRINCIPAL
**"Primero no hagas daño."** Una mejora fallida que rompe un flujo activo es peor que no hacer la mejora.

## ÁRBOL DE DECISIÓN DE IMPLEMENTACIÓN

```
¿Tiene Action Plan aprobado?
├─ NO → Volver a Fase 4
└─ SÍ → Continuar

¿Cuál es el nivel de riesgo?
├─ BAJO → Implementar directamente
├─ MEDIO → Primero sandbox, luego producción con monitoreo
└─ ALTO → Pedir aprobación de Hansel antes de cualquier acción

¿Afecta datos reales de producción?
├─ NO → Continuar
└─ SÍ → Backup obligatorio antes de proceder

¿Afecta flujos P1 (críticos)?
├─ NO → Implementar en cualquier momento
└─ SÍ → Implementar SOLO cuando Hansel no esté en medio de ese flujo
```

## PROTOCOLO PARA RIESGO BAJO

```bash
# 1. Crear snapshot en git antes de cambios
git add -A && git commit -m "snapshot: pre-implementacion [IMP-XXX]"

# 2. Implementar cambio
[ejecutar pasos del Action Plan]

# 3. Verificar cada paso según su criterio de verificación

# 4. Commit con descripción
git commit -m "feat: [descripción] — IMP-XXX"

# 5. Actualizar estado en improvements_applied.json
# 6. Actualizar knowledge_base.md con aprendizajes
# 7. Registrar en daily report
```

## PROTOCOLO PARA RIESGO MEDIO (Sandbox)

```
1. Crear directorio: hansel-os/self_improvement/sandbox/[nombre_mejora]/
2. Documentar en sandbox/README.md:
   - Qué se está probando
   - Inputs de prueba
   - Outputs esperados
   - Criterios de éxito
3. Ejecutar la prueba con datos ficticios o no críticos
4. Documentar resultados en sandbox/results.md
5. Decisión:
   - Si funciona → promover a producción (protocolo riesgo bajo)
   - Si falla → documentar por qué, actualizar upgrade_candidates.json
   - Si inconcluso → más tiempo en sandbox, reportar a Hansel
```

## PROTOCOLO PARA RIESGO ALTO (Requiere Aprobación)

### Formato de mensaje para Hansel (Telegram):
```
HANSEL-OS | APPROVAL REQUEST [IMP-XXX]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ENCONTRÉ: [nombre de la herramienta/cambio]

MEJORA: [qué flujo mejora y cómo, en 1-2 líneas]

RIESGO: [qué puede ir mal específicamente]

REVERSIBLE: [sí/no + cómo revertir]

COSTO: [si hay costo económico]

RECOMENDACIÓN: Implementar / Sandbox primero / Descartar

¿APRUEBAS?
[Sí - implementar ahora]
[Sandbox - probar primero]
[No - descartar]
[Esperar - revisar después]
```

## QUÉ NUNCA TOCAR SIN APROBACIÓN EXPLÍCITA
- Credenciales o API keys
- Datos reales de clientes en CRM
- Configuración de Make/n8n en producción
- Acceso a cuentas de redes sociales
- Facturación o datos financieros
- Eliminación de contenido publicado

## VERIFICACIÓN POST-IMPLEMENTACIÓN

Después de cada implementación, verificar:
```
□ El workflow funciona igual o mejor que antes
□ No hay errores en Make/n8n relacionados
□ Hansel puede acceder a lo que necesita
□ Los datos están intactos
□ El cambio está documentado en git
□ El Action Plan está actualizado con "completado"
□ Se registró en improvements_applied.json
□ Se actualiza capabilities.json si es auto-mejora de CloudCode
```

## ROLLBACK DE EMERGENCIA

Si algo sale mal:
```bash
# Ver último snapshot
git log --oneline -5

# Volver al snapshot pre-implementación
git revert [commit_id]

# O para archivos específicos
git checkout [commit_id] -- [archivo]

# Documentar el fallo
# Actualizar decisions.json con estado "fallido" y lección aprendida
```
