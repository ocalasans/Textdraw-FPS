# Textdraw-FPS

Bu filterscript, SA-MP için zarif ve rahatsız etmeyen bir textdraw aracılığıyla oyuncunun mevcut kare hızını görüntüleyen gerçek zamanlı bir FPS izleme sistemi uygular.

## Diller

- Português: [README](../../)
- Deutsch: [README](../Deutsch/README.md)
- English: [README](../English/README.md)
- Español: [README](../Espanol/README.md)
- Français: [README](../Francais/README.md)
- Italiano: [README](../Italiano/README.md)
- Polski: [README](../Polski/README.md)
- Русский: [README](../Русский/README.md)
- Svenska: [README](../Svenska/README.md)

## İçindekiler

- [Textdraw-FPS](#textdraw-fps)
  - [Diller](#diller)
  - [İçindekiler](#i̇çindekiler)
  - [Özellikler](#özellikler)
  - [Kurulum](#kurulum)
  - [Nasıl Çalışır](#nasıl-çalışır)
  - [Yapılandırma](#yapılandırma)
  - [Sorun Giderme](#sorun-giderme)
  - [Lisans](#lisans)
    - [Koşullar:](#koşullar)

## Özellikler

- Gerçek zamanlı FPS textdraw
- Minimalist ve rahatsız etmeyen arayüz
- Düşük performans etkisi
- Yüksek düzeyde özelleştirilebilir
- Kolay kurulum ve kullanım

## Kurulum

1. [Textdraw-FPS.amx](https://github.com/ocalasans/Textdraw-FPS/raw/refs/heads/main/src/Textdraw-FPS.amx) dosyasını indirin
2. Dosyayı sunucunuzun `filterscripts` klasörüne kopyalayın
3. `server.cfg` dosyasını düzenleyin
4. `filterscripts` satırına `Textdraw-FPS` ekleyin

**server.cfg'de örnek yapılandırma:**
```
filterscripts Textdraw-FPS
```

> [!WARNING]
> Eğer başka filterscript'ler zaten yüklüyse, Textdraw-FPS'i onlardan sonra ekleyin.

## Nasıl Çalışır

Sistem, oyuncunun sarhoşluk seviyesi üzerinden FPS'i hesaplamak için akıllı bir teknik kullanır.

> [!NOTE]
> FPS hesaplama yöntemi rahatsız edici değildir ve oyuncunun istemcisinde değişiklik gerektirmez.

İşte ana kodun bir parçası:

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
> Sistem varsayılan olarak her 200ms'de bir otomatik olarak güncellenir. Bu değer ayarlarda düzenlenebilir.

## Yapılandırma

> [!NOTE]
> Tüm ayarlar kaynak dosyanın başındaki sabitleri düzenleyerek ayarlanabilir.

Dosyanın başındaki sabitleri değiştirerek sistemin çeşitli yönlerini özelleştirebilirsiniz:

```pawn
// Sabitler
const DRUNK_RESET_LEVEL = 2000,      // Sarhoşluk seviyesi sıfırlama değeri
    MIN_FPS_VALUE = 1,               // Minimum geçerli FPS
    MAX_FPS_VALUE = 300,             // Maksimum geçerli FPS
    DISPLAY_UPDATE_INTERVAL = 200;   // Güncelleme aralığı (ms cinsinden)

// TextDraw konumlandırma
const Float:TD_POS_X = 1.0,          // TextDraw X konumu
    Float:TD_POS_Y = 137.0;          // TextDraw Y konumu
```

## Sorun Giderme

> [!WARNING]
> Yaygın sorunlar ve çözümleri:

1. **FPS görüntülenmiyor:**
   - Filterscript'in doğru şekilde yüklendiğini kontrol edin
   - Diğer textdraw sistemleriyle çakışma olmadığından emin olun

2. **Yanlış değerler:**
   - Bazı değiştirilmiş APK'lar sistemi etkileyebilir
   - Bazı başlatıcılar uyumlu olmayabilir

3. **Bağlanırken çökme:**
   - SA-MP sürümünün uyumlu olduğunu kontrol edin (0.3.7 veya üstü)
   - Diğer filterscript'lerle bellek çakışması olmadığından emin olun

## Lisans

Bu Filterscript, aşağıdakilere izin veren Apache License 2.0 altında korunmaktadır:

- ✔️ Ticari ve özel kullanım
- ✔️ Kaynak kodu değiştirme
- ✔️ Kod dağıtımı
- ✔️ Patent hakkı

### Koşullar:

- Telif hakkı bildirimini koruyun
- Önemli değişiklikleri belgeleyin
- Apache 2.0 lisansının bir kopyasını ekleyin

Lisans hakkında daha fazla bilgi için: http://www.apache.org/licenses/LICENSE-2.0

**Copyright (c) Calasans - Tüm hakları saklıdır**