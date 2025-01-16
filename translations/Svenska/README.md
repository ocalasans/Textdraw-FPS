# Textdraw-FPS

Detta filterscript implementerar ett FPS-övervakningssystem i realtid för SA-MP, som visar spelarens aktuella bildfrekvens genom en elegant och diskret textdraw.

## Språk

- Português: [README](../../)
- Deutsch: [README](../Deutsch/README.md)
- English: [README](../English/README.md)
- Español: [README](../Espanol/README.md)
- Français: [README](../Francais/README.md)
- Italiano: [README](../Italiano/README.md)
- Polski: [README](../Polski/README.md)
- Русский: [README](../Русский/README.md)
- Türkçe: [README](../Turkce/README.md)

## Index

- [Textdraw-FPS](#textdraw-fps)
  - [Språk](#språk)
  - [Index](#index)
  - [Funktioner](#funktioner)
  - [Installation](#installation)
  - [Hur det fungerar](#hur-det-fungerar)
  - [Konfiguration](#konfiguration)
  - [Felsökning](#felsökning)
  - [Licens](#licens)
    - [Villkor:](#villkor)

## Funktioner

- Textdraw med FPS i realtid
- Minimalistiskt och diskret gränssnitt
- Låg prestandapåverkan
- Mycket konfigurerbar
- Enkel installation och användning

## Installation

1. Ladda ner [Textdraw-FPS.amx](https://github.com/ocalasans/Textdraw-FPS/raw/refs/heads/main/src/Textdraw-FPS.amx) filen
2. Kopiera filen till din servers `filterscripts` mapp
3. Redigera `server.cfg` filen
4. Lägg till `Textdraw-FPS` i `filterscripts` raden

**Exempel på konfiguration i server.cfg:**
```
filterscripts Textdraw-FPS
```

> [!WARNING]
> Om andra filterscripts redan är laddade, lägg till Textdraw-FPS efter dem.

## Hur det fungerar

Systemet använder en smart teknik för att beräkna FPS genom spelarens berusningsnivå.

> [!NOTE]
> FPS-beräkningsmetoden är diskret och kräver inga ändringar i spelarens klient.

Här är ett utdrag av huvudkoden:

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
> Systemet uppdateras automatiskt var 200:e millisekund som standard. Detta värde kan justeras i inställningarna.

## Konfiguration

> [!NOTE]
> Alla inställningar kan justeras genom att redigera konstanterna i början av källfilen.

Du kan anpassa olika aspekter av systemet genom att modifiera konstanterna i början av filen:

```pawn
// Konstanter
const DRUNK_RESET_LEVEL = 2000,      // Återställningsvärde för berusningsnivå
    MIN_FPS_VALUE = 1,               // Minimum giltigt FPS
    MAX_FPS_VALUE = 300,             // Maximum giltigt FPS
    DISPLAY_UPDATE_INTERVAL = 200;   // Uppdateringsintervall i ms

// TextDraw positionering
const Float:TD_POS_X = 1.0,          // TextDraw X position
    Float:TD_POS_Y = 137.0;          // TextDraw Y position
```

## Felsökning

> [!WARNING]
> Vanliga problem och deras lösningar:

1. **FPS visas inte:**
   - Kontrollera att filterscript är korrekt laddat
   - Se till att det inte finns några konflikter med andra textdraw-system

2. **Felaktiga värden:**
   - Vissa modifierade APK:er kan störa systemet
   - Vissa startprogram kanske inte är kompatibla

3. **Krasch vid anslutning:**
   - Kontrollera att SA-MP-versionen är kompatibel (0.3.7 eller högre)
   - Se till att det inte finns några minneskonflikter med andra filterscripts

## Licens

Detta Filterscript är skyddat under Apache License 2.0, som tillåter:

- ✔️ Kommersiell och privat användning
- ✔️ Modifiering av källkod
- ✔️ Distribution av kod
- ✔️ Patentbeviljning

### Villkor:

- Behåll upphovsrättsmeddelande
- Dokumentera betydande ändringar
- Inkludera kopia av Apache 2.0-licensen

För mer information om licensen: http://www.apache.org/licenses/LICENSE-2.0

**Copyright (c) Calasans - Alla rättigheter förbehållna**