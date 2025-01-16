# Textdraw-FPS

This filterscript implements a real-time FPS monitoring system for SA-MP, displaying the player's current frame rate through an elegant and non-intrusive textdraw.

## Languages

- Português: [README](../../)
- Deutsch: [README](../Deutsch/README.md)
- Español: [README](../Espanol/README.md)
- Français: [README](../Francais/README.md)
- Italiano: [README](../Italiano/README.md)
- Polski: [README](../Polski/README.md)
- Русский: [README](../Русский/README.md)
- Svenska: [README](../Svenska/README.md)
- Türkçe: [README](../Turkce/README.md)

## Index

- [Textdraw-FPS](#textdraw-fps)
  - [Languages](#languages)
  - [Index](#index)
  - [Features](#features)
  - [Installation](#installation)
  - [How It Works](#how-it-works)
  - [Configuration](#configuration)
  - [Troubleshooting](#troubleshooting)
  - [License](#license)
    - [Conditions:](#conditions)

## Features

- Real-time FPS textdraw
- Minimalist and non-intrusive interface
- Low performance impact
- Highly configurable
- Easy installation and use

## Installation

1. Download the [Textdraw-FPS.amx](https://github.com/ocalasans/Textdraw-FPS/raw/refs/heads/main/src/Textdraw-FPS.amx) file
2. Copy the file to your server's `filterscripts` folder
3. Edit the `server.cfg` file
4. Add `Textdraw-FPS` to the `filterscripts` line

**Example configuration in server.cfg:**
```
filterscripts Textdraw-FPS
```

> [!WARNING]
> If other filterscripts are already loaded, add Textdraw-FPS after them.

## How It Works

The system uses a smart technique to calculate FPS through the player's drunk level.

> [!NOTE]
> The FPS calculation method is non-intrusive and doesn't require modifications to the player's client.

Here's a snippet of the main code:

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
> The system automatically updates every 200ms by default. This value can be adjusted in the settings.

## Configuration

> [!NOTE]
> All settings can be adjusted by editing the constants at the beginning of the source file.

You can customize various aspects of the system by modifying the constants at the beginning of the file:

```pawn
// Constants
const DRUNK_RESET_LEVEL = 2000,      // Drunk level reset value
    MIN_FPS_VALUE = 1,               // Minimum valid FPS
    MAX_FPS_VALUE = 300,             // Maximum valid FPS
    DISPLAY_UPDATE_INTERVAL = 200;   // Update interval in ms

// TextDraw positioning
const Float:TD_POS_X = 1.0,          // TextDraw X position
    Float:TD_POS_Y = 137.0;          // TextDraw Y position
```

## Troubleshooting

> [!WARNING]
> Common problems and their solutions:

1. **FPS not showing:**
   - Check if the filterscript is loaded correctly
   - Make sure there are no conflicts with other textdraw systems

2. **Incorrect values:**
   - Some modified APKs may interfere with the system
   - Certain launchers might not be compatible

3. **Crash when connecting:**
   - Check if the SA-MP version is compatible (0.3.7 or higher)
   - Make sure there are no memory conflicts with other filterscripts

## License

This Filterscript is protected under the Apache License 2.0, which allows:

- ✔️ Commercial and private use
- ✔️ Source code modification
- ✔️ Code distribution
- ✔️ Patent grant

### Conditions:

- Maintain copyright notice
- Document significant changes
- Include copy of Apache 2.0 license

For more details about the license: http://www.apache.org/licenses/LICENSE-2.0

**Copyright (c) Calasans - All rights reserved**