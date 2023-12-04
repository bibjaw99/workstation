# My workstation configs

- The colorscheme is a combmination of both gruvbox and gruvbox-material in my configs

## Package List

- [Here](./arch_install/)
- [Important Notes and Notes related to Artix](./arch_install/notes.md)

### **Descriptions:**

- **OS:** Arch Linux
- **Window Manager:** i3,qtile
- **Bar:** polybar
- **Launcher:** rofi
- **Compositor:** picom-allusive (active fork of picom-pijulius)
- **Terminal:** Kitty,wezterm,alacritty
- **Lockscreen:** i3lock
- **File Manager:** pcmanfm
- **Fonts:** roboto-condensed (for rofi and polybar), font-awesome (for rofi and polybar), monospace, jetbrainsmono, jetbrainsmono nerd fonts, firacode nerd font (for terminal,qtile bar)
- **Policykit:** mate-polkit

---

## Scripts you need to make executable:

- .config/autostart/autostart.sh
- .config/i3/scripts/power.sh
- .config/qtile/scripts/power.sh
- .config/polybar/i3_bar.sh

---

## Apps in each workspace

| Workspace Number |   Assigned Apps    |
| :--------------: | :----------------: |
|        1         |      Terminal      |
|        2         |      Browser       |
|        3         | Development/Coding |
|        4         |    File Manager    |
|        5         |        Chat        |
|        6         |    Design tools    |
|        7         |    Office tools    |
|        8         |    System tools    |

---

## Screenshots

### i3-wm

![i3_poly](https://github.com/bibjaw99/workstation/blob/master/screenshots/i3.png?raw=true)

### App launcher: Rofi

![rofi](https://github.com/bibjaw99/workstation/blob/master/screenshots/rofi.png?raw=true)

### Animations: picom-pijulius

![ezgif com-video-to-gif](https://github.com/bibjaw99/workstation/assets/134938208/a2be6ec7-0188-434c-b15a-0548c21f8791)

## Keybindings For i3

|    Keybindings    |        Actions        |
| :---------------: | :-------------------: |
|       mod+t       |      Tiling Mode      |
|       mod+e       |       Tab Mode        |
|       mod+s       |     Stacking Mode     |
|       mod+d       |       rofi drun       |
|       alt+d       |       rofi run        |
|       alt+w       |     rofi windows      |
|       alt+m       |      rofi emoji       |
|    mod+Shift+e    |      Power Menu       |
|    mod+return     |    Kitty terminal     |
|    mod+Shift+q    |    Kills a window     |
| mod+ctrl+vim keys |     resize window     |
|       mod+z       |      horizontal       |
|       mod+a       |       vertical        |
|       mod+m       |   toggle fullscreen   |
|     mod+space     |    floating window    |
|       mod+q       | focus floating window |
|       mod+p       |     focus parent      |
|       mod+w       |        firefox        |
|       mod+n       |        pcmanfm        |

---

### Neovim

![nvim](https://github.com/bibjaw99/workstation/blob/master/screenshots/codex.png?raw=true)

#### Neovim File tree

```
.
├── init.lua
├── lazy-lock.json
└── lua
    └── habib
        ├── core
        │   ├── init.lua
        │   ├── keymaps.lua
        │   ├── lazy.lua
        │   └── options.lua
        └── plugins
            ├── autopairs.lua
            ├── bufferline.lua
            ├── cmp.lua
            ├── colorizer.lua
            ├── colorscheme.lua
            ├── comment.lua
            ├── dashboard.lua
            ├── dressing.lua
            ├── gitsigns.lua
            ├── indent.lua
            ├── lsp
            │   ├── lspconfig.lua
            │   ├── lsp_saga.lua
            │   ├── mason.lua
            │   └── null_ls.lua
            ├── lualine.lua
            ├── notify.lua
            ├── nvim-tree.lua
            ├── tagbar.lua
            ├── telescope.lua
            ├── toggleterm.lua
            ├── treesitter.lua
            ├── utils.lua
            └── whichkey.lua
```

### Qtile ⚠️ (No longer maintained)

![qtile](https://github.com/bibjaw99/workstation/blob/master/screenshots/qtile.png?raw=true)

## Keybindings For Qtile

| Keybindings |         Actions         |
| :---------: | :---------------------: |
|    mod+d    |        rofi drun        |
|    alt+d    |        rofi rum         |
|    alt+d    |      rofi windows       |
| mod+Shift+e |       Power Menu        |
| mod+Shift+o |     toggle layouts      |
| mod+Shift+x |    Betterlockscreen     |
| mod+return  |     Kitty terminal      |
| mod+Shift+q |     Kills a window      |
|  mod+ctrl   | resize window(vim keys) |
|    mod+m    |    toggle fullscreen    |
|  mod+space  |     floating window     |
|    mod+w    |         firefox         |
|    mod+n    |         pcmanfm         |
|   mod+Tab   |    next active group    |
|   alt+tab   |  previous active group  |

---
