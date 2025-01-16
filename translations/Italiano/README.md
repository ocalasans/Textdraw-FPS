# Textdraw-FPS

Questo filterscript implementa un sistema di monitoraggio FPS in tempo reale per SA-MP, mostrando il frame rate attuale del giocatore attraverso un textdraw elegante e non intrusivo.

## Lingue

- Português: [README](../../)
- Deutsch: [README](../Deutsch/README.md)
- English: [README](../English/README.md)
- Español: [README](../Espanol/README.md)
- Français: [README](../Francais/README.md)
- Polski: [README](../Polski/README.md)
- Русский: [README](../Русский/README.md)
- Svenska: [README](../Svenska/README.md)
- Türkçe: [README](../Turkce/README.md)

## Indice

- [Textdraw-FPS](#textdraw-fps)
  - [Lingue](#lingue)
  - [Indice](#indice)
  - [Caratteristiche](#caratteristiche)
  - [Installazione](#installazione)
  - [Come Funziona](#come-funziona)
  - [Configurazione](#configurazione)
  - [Risoluzione dei Problemi](#risoluzione-dei-problemi)
  - [Licenza](#licenza)
    - [Condizioni:](#condizioni)

## Caratteristiche

- Textdraw FPS in tempo reale
- Interfaccia minimalista e non intrusiva
- Basso impatto sulle prestazioni
- Altamente configurabile
- Facile installazione e utilizzo

## Installazione

1. Scarica il file [Textdraw-FPS.amx](https://github.com/ocalasans/Textdraw-FPS/raw/refs/heads/main/src/Textdraw-FPS.amx)
2. Copia il file nella cartella `filterscripts` del tuo server
3. Modifica il file `server.cfg`
4. Aggiungi `Textdraw-FPS` alla riga `filterscripts`

**Esempio di configurazione in server.cfg:**
```
filterscripts Textdraw-FPS
```

> [!WARNING]
> Se sono già caricati altri filterscripts, aggiungi Textdraw-FPS dopo di essi.

## Come Funziona

Il sistema utilizza una tecnica intelligente per calcolare gli FPS attraverso il livello di ubriachezza del giocatore.

> [!NOTE]
> Il metodo di calcolo degli FPS è non intrusivo e non richiede modifiche al client del giocatore.

Ecco uno snippet del codice principale:

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
> Il sistema si aggiorna automaticamente ogni 200ms per impostazione predefinita. Questo valore può essere regolato nelle impostazioni.

## Configurazione

> [!NOTE]
> Tutte le impostazioni possono essere regolate modificando le costanti all'inizio del file sorgente.

Puoi personalizzare vari aspetti del sistema modificando le costanti all'inizio del file:

```pawn
// Costanti
const DRUNK_RESET_LEVEL = 2000,      // Valore di reset del livello di ubriachezza
    MIN_FPS_VALUE = 1,               // FPS minimo valido
    MAX_FPS_VALUE = 300,             // FPS massimo valido
    DISPLAY_UPDATE_INTERVAL = 200;   // Intervallo di aggiornamento in ms

// Posizionamento TextDraw
const Float:TD_POS_X = 1.0,          // Posizione X del TextDraw
    Float:TD_POS_Y = 137.0;          // Posizione Y del TextDraw
```

## Risoluzione dei Problemi

> [!WARNING]
> Problemi comuni e loro soluzioni:

1. **FPS non visualizzati:**
   - Controlla se il filterscript è caricato correttamente
   - Assicurati che non ci siano conflitti con altri sistemi textdraw

2. **Valori incorretti:**
   - Alcuni APK modificati potrebbero interferire con il sistema
   - Alcuni launcher potrebbero non essere compatibili

3. **Crash durante la connessione:**
   - Verifica se la versione di SA-MP è compatibile (0.3.7 o superiore)
   - Assicurati che non ci siano conflitti di memoria con altri filterscripts

## Licenza

Questo Filterscript è protetto dalla Licenza Apache 2.0, che permette:

- ✔️ Uso commerciale e privato
- ✔️ Modifica del codice sorgente
- ✔️ Distribuzione del codice
- ✔️ Concessione del brevetto

### Condizioni:

- Mantenere l'avviso di copyright
- Documentare le modifiche significative
- Includere una copia della licenza Apache 2.0

Per maggiori dettagli sulla licenza: http://www.apache.org/licenses/LICENSE-2.0

**Copyright (c) Calasans - Tutti i diritti riservati**