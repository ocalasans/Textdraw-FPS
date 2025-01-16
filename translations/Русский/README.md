# Textdraw-FPS

Этот filterscript реализует систему мониторинга FPS в реальном времени для SA-MP, отображая текущую частоту кадров игрока через элегантный и ненавязчивый textdraw.

## Языки

- Português: [README](../../)
- Deutsch: [README](../Deutsch/README.md)
- English: [README](../English/README.md)
- Español: [README](../Espanol/README.md)
- Français: [README](../Francais/README.md)
- Italiano: [README](../Italiano/README.md)
- Polski: [README](../Polski/README.md)
- Svenska: [README](../Svenska/README.md)
- Türkçe: [README](../Turkce/README.md)

## Оглавление

- [Textdraw-FPS](#textdraw-fps)
  - [Языки](#языки)
  - [Оглавление](#оглавление)
  - [Особенности](#особенности)
  - [Установка](#установка)
  - [Как это работает](#как-это-работает)
  - [Настройка](#настройка)
  - [Устранение неполадок](#устранение-неполадок)
  - [Лицензия](#лицензия)
    - [Условия:](#условия)

## Особенности

- Textdraw FPS в реальном времени
- Минималистичный и ненавязчивый интерфейс
- Низкое влияние на производительность
- Широкие возможности настройки
- Простая установка и использование

## Установка

1. Скачайте файл [Textdraw-FPS.amx](https://github.com/ocalasans/Textdraw-FPS/raw/refs/heads/main/src/Textdraw-FPS.amx)
2. Скопируйте файл в папку `filterscripts` вашего сервера
3. Отредактируйте файл `server.cfg`
4. Добавьте `Textdraw-FPS` в строку `filterscripts`

**Пример конфигурации в server.cfg:**
```
filterscripts Textdraw-FPS
```

> [!WARNING]
> Если другие filterscripts уже загружены, добавьте Textdraw-FPS после них.

## Как это работает

Система использует умную технику для расчета FPS через уровень опьянения игрока.

> [!NOTE]
> Метод расчета FPS является ненавязчивым и не требует модификаций клиента игрока.

Вот фрагмент основного кода:

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
> Система автоматически обновляется каждые 200мс по умолчанию. Это значение может быть настроено в настройках.

## Настройка

> [!NOTE]
> Все настройки можно изменить, отредактировав константы в начале исходного файла.

Вы можете настроить различные аспекты системы, изменив константы в начале файла:

```pawn
// Константы
const DRUNK_RESET_LEVEL = 2000,      // Значение сброса уровня опьянения
    MIN_FPS_VALUE = 1,               // Минимальное допустимое значение FPS
    MAX_FPS_VALUE = 300,             // Максимальное допустимое значение FPS
    DISPLAY_UPDATE_INTERVAL = 200;   // Интервал обновления в мс

// Позиционирование TextDraw
const Float:TD_POS_X = 1.0,          // Позиция TextDraw по X
    Float:TD_POS_Y = 137.0;          // Позиция TextDraw по Y
```

## Устранение неполадок

> [!WARNING]
> Распространенные проблемы и их решения:

1. **FPS не отображается:**
   - Проверьте, правильно ли загружен filterscript
   - Убедитесь, что нет конфликтов с другими системами textdraw

2. **Неправильные значения:**
   - Некоторые модифицированные APK могут мешать работе системы
   - Определенные лаунчеры могут быть несовместимы

3. **Краш при подключении:**
   - Проверьте, совместима ли версия SA-MP (0.3.7 или выше)
   - Убедитесь, что нет конфликтов памяти с другими filterscripts

## Лицензия

Этот Filterscript защищен лицензией Apache License 2.0, которая разрешает:

- ✔️ Коммерческое и частное использование
- ✔️ Модификацию исходного кода
- ✔️ Распространение кода
- ✔️ Патентную защиту

### Условия:

- Сохранение уведомления об авторских правах
- Документирование значительных изменений
- Включение копии лицензии Apache 2.0

Для получения дополнительной информации о лицензии: http://www.apache.org/licenses/LICENSE-2.0

**Copyright (c) Calasans - Все права защищены**