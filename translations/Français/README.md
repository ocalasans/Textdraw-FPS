# Textdraw-FPS

Ce filterscript implémente un système de surveillance FPS en temps réel pour SA-MP, affichant le taux de rafraîchissement actuel du joueur via un textdraw élégant et non intrusif.

## Langues

- Português: [README](../../)
- Deutsch: [README](../Deutsch/README.md)
- English: [README](../English/README.md)
- Español: [README](../Espanol/README.md)
- Italiano: [README](../Italiano/README.md)
- Polski: [README](../Polski/README.md)
- Русский: [README](../Русский/README.md)
- Svenska: [README](../Svenska/README.md)
- Türkçe: [README](../Turkce/README.md)

## Index

- [Textdraw-FPS](#textdraw-fps)
  - [Langues](#langues)
  - [Index](#index)
  - [Caractéristiques](#caractéristiques)
  - [Installation](#installation)
  - [Fonctionnement](#fonctionnement)
  - [Configuration](#configuration)
  - [Dépannage](#dépannage)
  - [Licence](#licence)
    - [Conditions:](#conditions)

## Caractéristiques

- Textdraw FPS en temps réel
- Interface minimaliste et non intrusive
- Impact minimal sur les performances
- Hautement configurable
- Installation et utilisation faciles

## Installation

1. Téléchargez le fichier [Textdraw-FPS.amx](https://github.com/ocalasans/Textdraw-FPS/raw/refs/heads/main/src/Textdraw-FPS.amx)
2. Copiez le fichier dans le dossier `filterscripts` de votre serveur
3. Modifiez le fichier `server.cfg`
4. Ajoutez `Textdraw-FPS` à la ligne `filterscripts`

**Exemple de configuration dans server.cfg:**
```
filterscripts Textdraw-FPS
```

> [!WARNING]
> Si d'autres filterscripts sont déjà chargés, ajoutez Textdraw-FPS après ceux-ci.

## Fonctionnement

Le système utilise une technique intelligente pour calculer les FPS à travers le niveau d'ivresse du joueur.

> [!NOTE]
> La méthode de calcul des FPS est non intrusive et ne nécessite pas de modifications du client du joueur.

Voici un extrait du code principal:

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
> Le système se met à jour automatiquement toutes les 200ms par défaut. Cette valeur peut être ajustée dans les paramètres.

## Configuration

> [!NOTE]
> Tous les paramètres peuvent être ajustés en modifiant les constantes au début du fichier source.

Vous pouvez personnaliser divers aspects du système en modifiant les constantes au début du fichier:

```pawn
// Constantes
const DRUNK_RESET_LEVEL = 2000,      // Valeur de réinitialisation du niveau d'ivresse
    MIN_FPS_VALUE = 1,               // FPS minimum valide
    MAX_FPS_VALUE = 300,             // FPS maximum valide
    DISPLAY_UPDATE_INTERVAL = 200;   // Intervalle de mise à jour en ms

// Positionnement du TextDraw
const Float:TD_POS_X = 1.0,          // Position X du TextDraw
    Float:TD_POS_Y = 137.0;          // Position Y du TextDraw
```

## Dépannage

> [!WARNING]
> Problèmes courants et leurs solutions:

1. **Les FPS ne s'affichent pas:**
   - Vérifiez si le filterscript est correctement chargé
   - Assurez-vous qu'il n'y a pas de conflits avec d'autres systèmes de textdraw

2. **Valeurs incorrectes:**
   - Certains APK modifiés peuvent interférer avec le système
   - Certains lanceurs peuvent ne pas être compatibles

3. **Crash lors de la connexion:**
   - Vérifiez si la version de SA-MP est compatible (0.3.7 ou supérieure)
   - Assurez-vous qu'il n'y a pas de conflits de mémoire avec d'autres filterscripts

## Licence

Ce Filterscript est protégé sous la licence Apache 2.0, qui permet:

- ✔️ Utilisation commerciale et privée
- ✔️ Modification du code source
- ✔️ Distribution du code
- ✔️ Octroi de brevet

### Conditions:

- Conserver la mention de copyright
- Documenter les changements significatifs
- Inclure une copie de la licence Apache 2.0

Pour plus de détails sur la licence: http://www.apache.org/licenses/LICENSE-2.0

**Copyright (c) Calasans - Tous droits réservés**