# Textdraw-FPS

Este filterscript implementa um sistema de monitoramento de FPS em tempo real para SA-MP, exibindo a taxa de quadros atual do jogador através de um textdraw elegante e não-intrusivo.

## Idiomas

- Deutsch: [README](translations/Deutsch/README.md)
- English: [README](translations/English/README.md)
- Español: [README](translations/Espanol/README.md)
- Français: [README](translations/Francais/README.md)
- Italiano: [README](translations/Italiano/README.md)
- Polski: [README](translations/Polski/README.md)
- Русский: [README](translations/Русский/README.md)
- Svenska: [README](translations/Svenska/README.md)
- Türkçe: [README](translations/Turkce/README.md)

## Índice

- [Textdraw-FPS](#textdraw-fps)
  - [Idiomas](#idiomas)
  - [Índice](#índice)
  - [Características](#características)
  - [Instalação](#instalação)
  - [Como Funciona](#como-funciona)
  - [Configuração](#configuração)
  - [Resolução de Problemas](#resolução-de-problemas)
  - [Licença](#licença)
    - [Condições:](#condições)

## Características

- Textdraw em tempo real do FPS
- Interface minimalista e não-intrusiva
- Baixo impacto no desempenho
- Altamente configurável
- Fácil instalação e uso

## Instalação

1. Baixe o arquivo [Textdraw-FPS.amx](https://github.com/ocalasans/Textdraw-FPS/raw/refs/heads/main/src/Textdraw-FPS.amx)
2. Copie o arquivo para a pasta `filterscripts` do seu servidor
3. Edite o arquivo `server.cfg`
4. Adicione `Textdraw-FPS` na linha `filterscripts`

**Exemplo de configuração no server.cfg:**
```
filterscripts Textdraw-FPS
```

> [!WARNING]
> Se já existirem outros filterscripts carregados, adicione o Textdraw-FPS após eles.

## Como Funciona

O sistema utiliza uma técnica inteligente para calcular o FPS através do nível de "embriaguez" do jogador (drunk level).

> [!NOTE]
> O método de cálculo do FPS é não-intrusivo e não requer modificações no cliente do jogador.

Aqui está um trecho do código principal:

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
> O sistema atualiza automaticamente a cada 200ms por padrão. Este valor pode ser ajustado nas configurações.

## Configuração

> [!NOTE]
> Todas as configurações podem ser ajustadas editando as constantes no início do arquivo fonte.

Você pode personalizar vários aspectos do sistema modificando as constantes no início do arquivo:

```pawn
// Constants
const DRUNK_RESET_LEVEL = 2000,      // Nível de reset do drunk level
    MIN_FPS_VALUE = 1,               // FPS mínimo válido
    MAX_FPS_VALUE = 300,             // FPS máximo válido
    DISPLAY_UPDATE_INTERVAL = 200;   // Intervalo de atualização em ms

// TextDraw positioning
const Float:TD_POS_X = 1.0,          // Posição X do textdraw
    Float:TD_POS_Y = 137.0;          // Posição Y do textdraw
```

## Resolução de Problemas

> [!WARNING]
> Alguns problemas comuns e suas soluções:

1. **FPS não aparece:**
   - Verifique se o filterscript está carregado corretamente
   - Certifique-se de que não há conflitos com outros sistemas de textdraw

2. **Valores incorretos:**
   - Alguns APKs modificados podem interferir no sistema
   - Certain launchers podem não ser compatíveis

3. **Crash ao conectar:**
   - Verifique se a versão do SA-MP é compatível (0.3.7 ou superior)
   - Certifique-se de que não há conflitos de memória com outros filterscripts

## Licença

Este Filterscript está protegido sob a Licença Apache 2.0, que permite:

- ✔️ Uso comercial e privado
- ✔️ Modificação do código fonte
- ✔️ Distribuição do código
- ✔️ Concessão de patentes

### Condições:

- Manter o aviso de direitos autorais
- Documentar alterações significativas
- Incluir cópia da licença Apache 2.0

Para mais detalhes sobre a licença: http://www.apache.org/licenses/LICENSE-2.0

**Copyright (c) Calasans - Todos os direitos reservados**
