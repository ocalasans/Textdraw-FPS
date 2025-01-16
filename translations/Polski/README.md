# Textdraw-FPS

Ten filterscript implementuje system monitorowania FPS w czasie rzeczywistym dla SA-MP, wyświetlający aktualną liczbę klatek na sekundę gracza poprzez elegancki i dyskretny textdraw.

## Języki

- Português: [README](../../)
- Deutsch: [README](../Deutsch/README.md)
- English: [README](../English/README.md)
- Español: [README](../Espanol/README.md)
- Français: [README](../Francais/README.md)
- Italiano: [README](../Italiano/README.md)
- Русский: [README](../Русский/README.md)
- Svenska: [README](../Svenska/README.md)
- Türkçe: [README](../Turkce/README.md)

## Spis treści

- [Textdraw-FPS](#textdraw-fps)
  - [Języki](#języki)
  - [Spis treści](#spis-treści)
  - [Funkcje](#funkcje)
  - [Instalacja](#instalacja)
  - [Jak to działa](#jak-to-działa)
  - [Konfiguracja](#konfiguracja)
  - [Rozwiązywanie problemów](#rozwiązywanie-problemów)
  - [Licencja](#licencja)
    - [Warunki:](#warunki)

## Funkcje

- Textdraw FPS w czasie rzeczywistym
- Minimalistyczny i dyskretny interfejs
- Niski wpływ na wydajność
- Wysoka konfigurowalność
- Łatwa instalacja i użytkowanie

## Instalacja

1. Pobierz plik [Textdraw-FPS.amx](https://github.com/ocalasans/Textdraw-FPS/raw/refs/heads/main/src/Textdraw-FPS.amx)
2. Skopiuj plik do folderu `filterscripts` na swoim serwerze
3. Edytuj plik `server.cfg`
4. Dodaj `Textdraw-FPS` do linii `filterscripts`

**Przykładowa konfiguracja w server.cfg:**
```
filterscripts Textdraw-FPS
```

> [!WARNING]
> Jeśli inne filterscripts są już załadowane, dodaj Textdraw-FPS po nich.

## Jak to działa

System wykorzystuje sprytną technikę obliczania FPS poprzez poziom upojenia gracza.

> [!NOTE]
> Metoda obliczania FPS jest nieinwazyjna i nie wymaga modyfikacji klienta gracza.

Oto fragment głównego kodu:

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
> System automatycznie aktualizuje się co 200ms domyślnie. Tę wartość można dostosować w ustawieniach.

## Konfiguracja

> [!NOTE]
> Wszystkie ustawienia można dostosować, edytując stałe na początku pliku źródłowego.

Możesz dostosować różne aspekty systemu, modyfikując stałe na początku pliku:

```pawn
// Stałe
const DRUNK_RESET_LEVEL = 2000,      // Wartość resetu poziomu upojenia
    MIN_FPS_VALUE = 1,               // Minimalna wartość FPS
    MAX_FPS_VALUE = 300,             // Maksymalna wartość FPS
    DISPLAY_UPDATE_INTERVAL = 200;   // Interwał aktualizacji w ms

// Pozycjonowanie TextDraw
const Float:TD_POS_X = 1.0,          // Pozycja X TextDraw
    Float:TD_POS_Y = 137.0;          // Pozycja Y TextDraw
```

## Rozwiązywanie problemów

> [!WARNING]
> Częste problemy i ich rozwiązania:

1. **FPS nie jest wyświetlany:**
   - Sprawdź, czy filterscript jest poprawnie załadowany
   - Upewnij się, że nie ma konfliktów z innymi systemami textdraw

2. **Nieprawidłowe wartości:**
   - Niektóre zmodyfikowane APK mogą zakłócać działanie systemu
   - Niektóre launchery mogą nie być kompatybilne

3. **Crash podczas łączenia:**
   - Sprawdź, czy wersja SA-MP jest kompatybilna (0.3.7 lub wyższa)
   - Upewnij się, że nie ma konfliktów pamięci z innymi filterscripts

## Licencja

Ten Filterscript jest chroniony licencją Apache License 2.0, która zezwala na:

- ✔️ Użytek komercyjny i prywatny
- ✔️ Modyfikację kodu źródłowego
- ✔️ Dystrybucję kodu
- ✔️ Udzielenie patentu

### Warunki:

- Zachowanie informacji o prawach autorskich
- Dokumentowanie istotnych zmian
- Dołączenie kopii licencji Apache 2.0

Więcej szczegółów na temat licencji: http://www.apache.org/licenses/LICENSE-2.0

**Copyright (c) Calasans - Wszelkie prawa zastrzeżone**