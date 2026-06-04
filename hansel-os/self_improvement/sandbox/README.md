# Sandbox — Self-Improvement Engine

Este directorio es el ambiente de prueba del Self-Improvement Engine.

## Estructura por experimento

```
sandbox/
└── [nombre-del-upgrade]/
    ├── README.md           # Qué se está probando y por qué
    ├── test_input.md       # Datos de entrada del experimento
    ├── expected_output.md  # Qué debería producir si funciona
    ├── actual_output.md    # Qué produjo realmente
    └── results.md          # Análisis: ¿funcionó? ¿promover a producción?
```

## Criterios para promover a producción

Un experimento en sandbox puede promoverse a producción cuando:

1. El output real coincide con el esperado (o lo supera)
2. No hay efectos secundarios negativos detectados
3. El beneficio es medible y verificable
4. Se documentó en `upgrade_history.json` con resultado "exitoso"
5. Se puede revertir con git si algo sale mal

## Experimentos activos

*(Ninguno aún — primer día del sistema)*

## Experimentos completados

*(Ninguno aún)*

## Cómo añadir un experimento

1. Crear subdirectorio con nombre descriptivo (ej: `tiered-context-loading/`)
2. Completar los 5 archivos del template
3. Referenciar en `upgrade_candidates.json` con `estado: "en_sandbox"`
4. Ejecutar el experimento y documentar en `actual_output.md`
5. Analizar en `results.md` y decidir: promover / continuar probando / descartar
