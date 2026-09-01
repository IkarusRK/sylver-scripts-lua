# Sylver Scripts Lua - FiveM Collection

Colecao de scripts Lua para servidores GTA RP / FiveM com foco em performance e qualidade visual.

![FiveM](https://img.shields.io/badge/FiveM-Scripts-red?style=for-the-badge)
![Lua](https://img.shields.io/badge/Lua-5.4-blue?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

---

## Scripts Inclusos

| Script | Descricao | Resmon |
|--------|-----------|--------|
| `sylver_hud` | HUD customizado com status, minimap e notificacoes | 0.01 ms |
| `sylver_garage3d` | Garagem com preview 3D e tuning in-game | 0.02 ms |
| `sylver_notify` | Sistema de notificacoes estilizadas | 0.00 ms |
| `sylver_progressbar` | Barra de progresso animada para acoes | 0.01 ms |

---

## Instalacao Rapida

```bash
# Clone o repositorio
git clone https://github.com/IkarusRK/sylver-scripts-lua

# Mova a pasta desejada para seu resources/
cp -r sylver-scripts-lua/sylver_hud [seu-servidor]/resources/[scripts]/

# Adicione ao server.cfg
ensure sylver_hud
```

---

## Estrutura

```
sylver-scripts-lua/
+-- hud/
¦   +-- cl_hud.lua
¦   +-- sv_hud.lua
¦   +-- fxmanifest.lua
+-- garage3d/
¦   +-- cl_garage.lua
¦   +-- sv_garage.lua
¦   +-- fxmanifest.lua
+-- utilities/
    +-- progressbar.lua
    +-- notify.lua
```

---

## Licenca

MIT (c) IkarusRK
