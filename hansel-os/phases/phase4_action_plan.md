# FASE 4 — Action Plan
*Cómo convertir un hallazgo en un plan de acción ejecutable*

## OBJETIVO
Por cada mejora clasificada como `INSTALAR_AHORA` o `PROBAR_SANDBOX`, crear un plan de acción concreto, medible y reversible antes de tocar nada.

## CUÁNDO CREAR UN ACTION PLAN
- Toda mejora `INSTALAR_AHORA` necesita su plan antes de ejecutar
- Toda mejora `PROBAR_SANDBOX` necesita su plan antes de entrar a sandbox
- Para mejoras de CloudCode mismo: siempre, sin excepción

## TEMPLATE DE ACTION PLAN

```json
{
  "id": "IMP-[número secuencial]",
  "fecha": "YYYY-MM-DD",
  "titulo": "Nombre descriptivo de la mejora",
  "categoria": "workflow|self_improvement|integracion|automatizacion|memoria|herramienta",
  "herramienta_o_cambio": "qué se va a instalar/cambiar",
  "workflow_afectado": "nombre del workflow del registry",
  
  "problema_que_resuelve": {
    "descripcion": "Descripción específica del problema",
    "evidencia": "Cómo se detectó el problema",
    "impacto_actual": "Qué le cuesta a Hansel sin esta mejora"
  },
  
  "por_que_sirve_a_hansel": "Conexión directa entre la herramienta y los flujos reales",
  
  "que_flujo_mejora": {
    "workflow": "nombre",
    "mejora_especifica": "De X a Y: de manual a automático / de X min a Y min / etc."
  },
  
  "riesgo": {
    "nivel": "bajo|medio|alto",
    "que_puede_ir_mal": "Lista de riesgos específicos",
    "mitigacion": "Cómo prevenir cada riesgo",
    "es_reversible": true,
    "como_revertir": "Pasos exactos para deshacer"
  },
  
  "pasos": [
    {
      "numero": 1,
      "accion": "Descripción específica",
      "herramienta_usada": "bash/git/make/mcp/etc",
      "tiempo_estimado": "5min",
      "verificacion": "Cómo saber que este paso fue exitoso"
    }
  ],
  
  "resultado_esperado": "Descripción concreta del estado después de la mejora",
  
  "como_medir_exito": {
    "metrica": "Qué se mide",
    "valor_antes": "Estado actual",
    "valor_esperado_despues": "Estado después",
    "como_verificar": "Cómo confirmar el resultado",
    "tiempo_para_medir": "Cuándo revisar si funcionó"
  },
  
  "estado": "pendiente|en_progreso|completado|fallido|cancelado",
  "requiere_aprobacion_hansel": false,
  "motivo_si_requiere_aprobacion": null
}
```

## REGLAS DEL ACTION PLAN

1. **Sin pasos vagos.** "Configurar Gmail" no sirve. "Crear filtro en Gmail con criterio 'from:casting' y añadir label 'Audiciones'" sí sirve.

2. **Cada paso tiene verificación.** Cada paso debe decir cómo sabes que funcionó.

3. **El plan es reversible.** Si no puede explicarse cómo revertirlo, el riesgo sube automáticamente a "alto".

4. **Métricas concretas.** "Mejorar Gmail" no es medible. "Reducir tiempo de clasificación de correos de 15min/día a 2min/día" sí lo es.

5. **Tiempo estimado realista.** Si un paso toma más de 30 min, dividirlo en sub-pasos.

6. **Enlazar con registry.** Siempre referenciar el workflow del registry que se mejora.

## PRIORIZACIÓN DE PLANES

Criterio de orden de ejecución:
1. **P1 primero:** Planes que resuelven problemas P1 del registry
2. **Bajo riesgo primero:** Entre dos P2, ejecutar el de menor riesgo primero
3. **Mayor ROI:** Entre dos del mismo nivel, el que da más valor en menos tiempo
4. **Dependencies:** Si B depende de A, ejecutar A primero

## PLANES ESPECIALES — CloudCode Self-Improvement

Para mejoras del propio sistema, añadir campo extra:
```json
{
  "afecta_a": "CLAUDE.md|capabilities.json|scripts|templates|filtros",
  "impacto_en_autonomia": "alto|medio|bajo|ninguno",
  "impacto_en_calidad": "alto|medio|bajo|ninguno",
  "impacto_en_tokens": "reduce|neutro|aumenta",
  "requiere_validacion_en_sandbox": true,
  "sandbox_path": "hansel-os/self_improvement/sandbox/[nombre]/"
}
```
