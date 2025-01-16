# Textdraw-FPS

Este filterscript implementa un sistema de monitoreo de FPS en tiempo real para SA-MP, mostrando la tasa de fotogramas actual del jugador a través de un textdraw elegante y no intrusivo.

## Idiomas

- Português: [README](../../)
- Deutsch: [README](../Deutsch/README.md)
- English: [README](../English/README.md)
- Français: [README](../Francais/README.md)
- Italiano: [README](../Italiano/README.md)
- Polski: [README](../Polski/README.md)
- Русский: [README](../Русский/README.md)
- Svenska: [README](../Svenska/README.md)
- Türkçe: [README](../Turkce/README.md)

## Índice

- [Textdraw-FPS](#textdraw-fps)
  - [Idiomas](#idiomas)
  - [Índice](#índice)
  - [Características](#características)
  - [Instalación](#instalación)
  - [Cómo Funciona](#cómo-funciona)
  - [Configuración](#configuración)
  - [Solución de Problemas](#solución-de-problemas)
  - [Licencia](#licencia)
    - [Condiciones:](#condiciones)

## Características

- Textdraw de FPS en tiempo real
- Interfaz minimalista y no intrusiva
- Bajo impacto en el rendimiento
- Altamente configurable
- Fácil instalación y uso

## Instalación

1. Descarga el archivo [Textdraw-FPS.amx](https://github.com/ocalasans/Textdraw-FPS/raw/refs/heads/main/src/Textdraw-FPS.amx)
2. Copia el archivo a la carpeta `filterscripts` de tu servidor
3. Edita el archivo `server.cfg`
4. Añade `Textdraw-FPS` a la línea de `filterscripts`

**Ejemplo de configuración en server.cfg:**
```
filterscripts Textdraw-FPS
```

> [!WARNING]
> Si ya hay otros filterscripts cargados, añade Textdraw-FPS después de ellos.

## Cómo Funciona

El sistema utiliza una técnica inteligente para calcular los FPS a través del nivel de ebriedad del jugador.

> [!NOTE]
> El método de cálculo de FPS es no intrusivo y no requiere modificaciones en el cliente del jugador.

Aquí hay un fragmento del código principal:

```pawn
stock GetPlayerFPS(playerid) {
    new Current_DrunkLevel = GetPlayerDrunkLevel(playerid);
    
    if(Current_DrunkLevel <= 100) {
        SetPlayerDrunkLevel(playerid, DRUNK_RESET_LEVEL);

        return GetPVarInt(playerid, "Last_FPS");
    }
    
    new FPS_Value = GetPVarInt(playerid, "Prev_DrunkLevel") - Current_DrunkLevel;
    
    if(MIN_FPS_VALUE <= FPS_Value <= MAX_FPS_VALUE) {
        SetPVarInt(playerid, "Last_FPS", FPS_Value);

        return FPS_Value;
    }
    
    return GetPVarInt(playerid, "Last_FPS");
}
```

> [!TIP]
> El sistema se actualiza automáticamente cada 200ms por defecto. Este valor puede ajustarse en la configuración.

## Configuración

> [!NOTE]
> Todas las configuraciones pueden ajustarse editando las constantes al inicio del archivo fuente.

Puedes personalizar varios aspectos del sistema modificando las constantes al inicio del archivo:

```pawn
// Constantes
const DRUNK_RESET_LEVEL = 2000,      // Valor de reinicio del nivel de ebriedad
    MIN_FPS_VALUE = 1,               // FPS mínimo válido
    MAX_FPS_VALUE = 300,             // FPS máximo válido
    DISPLAY_UPDATE_INTERVAL = 200;   // Intervalo de actualización en ms

// Posicionamiento del TextDraw
const Float:TD_POS_X = 1.0,          // Posición X del TextDraw
    Float:TD_POS_Y = 137.0;          // Posición Y del TextDraw
```

## Solución de Problemas

> [!WARNING]
> Problemas comunes y sus soluciones:

1. **No se muestran los FPS:**
   - Verifica si el filterscript está cargado correctamente
   - Asegúrate de que no haya conflictos con otros sistemas de textdraw

2. **Valores incorrectos:**
   - Algunos APKs modificados pueden interferir con el sistema
   - Ciertos lanzadores podrían no ser compatibles

3. **Crash al conectar:**
   - Verifica si la versión de SA-MP es compatible (0.3.7 o superior)
   - Asegúrate de que no haya conflictos de memoria con otros filterscripts

## Licencia

Este Filterscript está protegido bajo la Licencia Apache 2.0, que permite:

- ✔️ Uso comercial y privado
- ✔️ Modificación del código fuente
- ✔️ Distribución del código
- ✔️ Concesión de patentes

### Condiciones:

- Mantener el aviso de copyright
- Documentar cambios significativos
- Incluir copia de la licencia Apache 2.0

Para más detalles sobre la licencia: http://www.apache.org/licenses/LICENSE-2.0

**Copyright (c) Calasans - Todos los derechos reservados**