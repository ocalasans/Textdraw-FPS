# Textdraw-FPS

Dieses Filterscript implementiert ein Echtzeit-FPS-Überwachungssystem für SA-MP, das die aktuelle Bildrate des Spielers durch ein elegantes und nicht-störendes Textdraw anzeigt.

## Sprachen

- Português: [README](../../)
- English: [README](../English/README.md)
- Español: [README](../Espanol/README.md)
- Français: [README](../Francais/README.md)
- Italiano: [README](../Italiano/README.md)
- Polski: [README](../Polski/README.md)
- Русский: [README](../Русский/README.md)
- Svenska: [README](../Svenska/README.md)
- Türkçe: [README](../Turkce/README.md)

## Inhaltsverzeichnis

- [Textdraw-FPS](#textdraw-fps)
  - [Sprachen](#sprachen)
  - [Inhaltsverzeichnis](#inhaltsverzeichnis)
  - [Funktionen](#funktionen)
  - [Installation](#installation)
  - [Funktionsweise](#funktionsweise)
  - [Konfiguration](#konfiguration)
  - [Fehlerbehebung](#fehlerbehebung)
  - [Lizenz](#lizenz)
    - [Bedingungen:](#bedingungen)

## Funktionen

- Echtzeit-FPS-Textdraw
- Minimalistische und nicht-störende Benutzeroberfläche
- Geringe Leistungsauswirkung
- Hochgradig konfigurierbar
- Einfache Installation und Verwendung

## Installation

1. Laden Sie die [Textdraw-FPS.amx](https://github.com/ocalasans/Textdraw-FPS/raw/refs/heads/main/src/Textdraw-FPS.amx) Datei herunter
2. Kopieren Sie die Datei in den `filterscripts` Ordner Ihres Servers
3. Bearbeiten Sie die `server.cfg` Datei
4. Fügen Sie `Textdraw-FPS` zur `filterscripts` Zeile hinzu

**Beispielkonfiguration in server.cfg:**
```
filterscripts Textdraw-FPS
```

> [!WARNING]
> Wenn bereits andere Filterscripts geladen sind, fügen Sie Textdraw-FPS nach diesen hinzu.

## Funktionsweise

Das System verwendet eine intelligente Technik zur Berechnung der FPS über den Betrunkenheitsgrad des Spielers.

> [!NOTE]
> Die FPS-Berechnungsmethode ist nicht-invasiv und erfordert keine Änderungen am Client des Spielers.

Hier ist ein Ausschnitt des Hauptcodes:

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
> Das System aktualisiert sich standardmäßig automatisch alle 200ms. Dieser Wert kann in den Einstellungen angepasst werden.

## Konfiguration

> [!NOTE]
> Alle Einstellungen können durch Bearbeiten der Konstanten am Anfang der Quelldatei angepasst werden.

Sie können verschiedene Aspekte des Systems durch Ändern der Konstanten am Anfang der Datei anpassen:

```pawn
// Konstanten
const DRUNK_RESET_LEVEL = 2000,      // Betrunkenheitsgrad-Rücksetzwert
    MIN_FPS_VALUE = 1,               // Minimale gültige FPS
    MAX_FPS_VALUE = 300,             // Maximale gültige FPS
    DISPLAY_UPDATE_INTERVAL = 200;   // Aktualisierungsintervall in ms

// TextDraw-Positionierung
const Float:TD_POS_X = 1.0,          // TextDraw X-Position
    Float:TD_POS_Y = 137.0;          // TextDraw Y-Position
```

## Fehlerbehebung

> [!WARNING]
> Häufige Probleme und ihre Lösungen:

1. **FPS werden nicht angezeigt:**
   - Überprüfen Sie, ob das Filterscript korrekt geladen ist
   - Stellen Sie sicher, dass es keine Konflikte mit anderen Textdraw-Systemen gibt

2. **Falsche Werte:**
   - Einige modifizierte APKs können das System stören
   - Bestimmte Launcher sind möglicherweise nicht kompatibel

3. **Absturz beim Verbinden:**
   - Überprüfen Sie, ob die SA-MP-Version kompatibel ist (0.3.7 oder höher)
   - Stellen Sie sicher, dass es keine Speicherkonflikte mit anderen Filterscripts gibt

## Lizenz

Dieses Filterscript ist unter der Apache License 2.0 geschützt, die Folgendes erlaubt:

- ✔️ Kommerzielle und private Nutzung
- ✔️ Änderung des Quellcodes
- ✔️ Codeverteilung
- ✔️ Patentgewährung

### Bedingungen:

- Urheberrechtshinweis beibehalten
- Wesentliche Änderungen dokumentieren
- Kopie der Apache 2.0 Lizenz beifügen

Weitere Details zur Lizenz: http://www.apache.org/licenses/LICENSE-2.0

**Copyright (c) Calasans - Alle Rechte vorbehalten**