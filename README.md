# My workstation configs

- The colorscheme is a combmination of both gruvbox and gruvbox-material in my configs

## **Descriptions:**

- **OS:** Arch Linux
- **Window Manager:** i3,swaywm,hyprland
- **Bar:** polybar,waybar
- **Launcher:** rofi,fuzzel
- **Compositor:** picom
- **Terminal:** alacritty,wezterm,kitty,foot
- **Code Editor** : Neovim
- **Lockscreen:** i3lock,swaylock
- **File Manager:** pcmanfm
- **Fonts:** jetbrainsmono nerd font, roboto-condensed, font-awesome (No longer using Iosevka , since jetbrainsmono just works with any terminal)
- **Policykit:** mate-polkit

# Notes ⚠️

[Important Notes](./arch_install/notes/notes.md)

[Wayland Notes](./arch_install/notes/wayland_notes.md)

[Arch Installation Process I followed](./arch_install/notes/archInstalltion.md)

Packages I used in my System:

##### Currently using an ultrabook: HP probook 10 G450, i5 13th gen with iGPU - intel iris xe.

- [Drivers](./arch_install/scripts/drivers.sh)
- [System Packages](./arch_install/scripts/system_packages.sh)
- [GUI Apps](./arch_install/scripts/applications.sh)

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

## Gallery

### i3wm + polybar

![Floating Polybar](./screenshots/i3.png)

### Sway / Hyprland + waybar

![Sway and Hyprland](./screenshots/sway.png)

![Sway and Hyprland](./screenshots/waybar_floating.png)

### App launcher and power menu: Rofi

![Rofi](./screenshots/rofi_1.png)
![Rofi](./screenshots/rofi_2.png)

## Keybindings For i3 and sway

|    Keybindings    |        Actions        |
| :---------------: | :-------------------: |
|       mod+t       |      Tiling Mode      |
|       mod+e       |       Tab Mode        |
|       mod+u       |     Select Parent     |
|       mod+i       |     Select Child      |
|       mod+d       |       rofi drun       |
|       alt+d       |       rofi run        |
|       alt+w       |     rofi windows      |
|       alt+y       |      rofi emoji       |
|       mod+m       |   toggle fullscreen   |
|    mod+Shift+e    |      Power Menu       |
|    mod+return     |       terminal        |
|    mod+Shift+q    |    Kills a window     |
| mod+ctrl+vim keys |     resize window     |
|       mod+z       |      horizontal       |
|       mod+a       |       vertical        |
|     mod+space     |    floating window    |
|       mod+q       | focus floating window |
|       mod+w       |        firefox        |
|       mod+n       |        pcmanfm        |
|    mod+Shift+b    |        blueman        |
|    mod+Shift+n    |        swaync         |

---

## Neovim: Grimm Vim:

#### Not a distro but my own personal config ⚠️

##### Keymaps:

- All the keymaps can be found in the `.config/nvim/lua/grimmvim/core/keymaps.lua` file.
- Keymaps for `substitute.nvim` is in its plugin file: `.config/nvim/lua/grimmvim/plugins/substitute.lua`
- Press `<leader>fk` to find available keymaps.

### Neovim Gallery :

##### Start Page

![alpha.nvim](./screenshots/neovim/1.png)

##### LSP Support

![LSP](./screenshots/neovim/2.png)

##### Markdown

![Render Markdown](./screenshots/neovim/3.png)

##### Gitsigns plugin for visual git status

![Gitsigns](./screenshots/neovim/4.png)

##### ToggleTerm X Lazygit

![ToggleTerm](./screenshots/neovim/5.png)

##### Plugin Manager : Lazy and LSP manager : Mason

![Lsp and Plugin Managers](./screenshots/neovim/6.png)

#### Installation Guide :

- remove or backup the `nvim` folder from the following directory :

  - `~/.config/nvim`
  - `~/.cache/nvim`
  - `~/.local/share/nvim`
  - `~/.local/state/nvim`

- Now copy my `nvim` config folder in the `~/.config` directory

#### Neovim File tree

```
.
├── init.lua
└── lua
    └── grimmvim
        ├── core
        │   ├── init.lua
        │   ├── keymaps.lua
        │   ├── lazy.lua
        │   └── options.lua
        └── plugins
            ├── alpha.lua
            ├── autopairs.lua
            ├── cmp.lua
            ├── colorizer.lua
            ├── colorscheme.lua
            ├── comments.lua
            ├── dressing.lua
            ├── gitsigns.lua
            ├── indent.lua
            ├── lsp
            │   ├── formatting.lua
            │   ├── lspconfig.lua
            │   ├── lspsaga.lua
            │   └── mason.lua
            ├── lualine.lua
            ├── luasnip.lua
            ├── markdown.lua
            ├── notify.lua
            ├── nvimtree.lua
            ├── oil.lua
            ├── search.lua
            ├── session.lua
            ├── substitute.lua
            ├── surround.lua
            ├── tagbar.lua
            ├── toggleTerm.lua
            ├── treesitter.lua
            ├── undotree.lua
            ├── utilities.lua
            └── whichkey.lua
```
