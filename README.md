# My workstation configs

- The colorscheme is a combmination of both gruvbox and gruvbox-material in my configs

## **Descriptions:**

- **OS:** Arch Linux
- **Window Manager:** hyprland, swaywm
- **Bar:** waybar
- **Launcher:** rofi
- **Terminal:** ghostty
- **Code Editor** : Neovim
- **Lockscreen:** swaylock
- **File Manager:** pcmanfm
- **Screenshot Tool:** flameshot
- **Fonts:** iosevkaterm nerd font, roboto-condensed
- **Policykit:** mate-polkit
- **Shell:** zshell

## Installation script :

```sh
curl -s https://raw.githubusercontent.com/bibjaw99/workstation/refs/heads/master/install_scripts/script.sh | bash
```

## how the script works :

- all the dotfiles will be stored in a folder called `config_dotfiles` in your `$HOME/.local/share` directory
- then if the config already exists in the `$HOME/.config` directory then it will be backed up in the `$HOME/.config.backup` directory
- then a symlink will be created from `$HOME/.local/share/config_dotfiles` directory to the `$HOME/.config` directory
  - **why this approach instead of using/creating actual directories ? :** it's easy to dump them all togather in the github project folder after making huge changes in multiple app configs
- names of the config directories and config files that needs to be symlinked, must be listed in the respected files in `workstation/install_scripts/config_lists`.
  - check `symlink_configs.sh` and `symlink_files.sh` to understand it better

## folder structure of my install script :

- if you already finished the base arch installation just clone the repo
- run the `$HOME/github/workstation/install_scripts/install.sh` script
- before installing you can check the list of the Packages in the install_scripts directory and modify it according to your likings
  - just go to `/workstation/install_scripts/package_lists` directory to find all the list of packages

```sh
├── config_lists
│   ├── config_dirs.txt
│   └── config_files.txt
├── flatpak_install.sh
├── install.sh
├── package_install.sh
├── package_lists
│   ├── common_pkg_list.txt
│   ├── dev_pkg_list.txt
│   ├── flatpak_pkg_list.txt
│   ├── wayland_pkg_list.txt
│   └── xorg_pkg_list.txt
├── symlink_configs.sh
└── symlink_files.sh
```

# Notes

- [Important Notes](./arch_install/notes/notes.md)
- [Arch Installation Process I followed](./arch_install/notes/archInstalltion.md)

### Drivers:

##### Currently using an ultrabook: HP probook 10 G450, i5 13th gen with iGPU - intel iris xe.

```sh
# amd
xf86-video-amdgpu
xf86-video-ati
amd-ucode
amdvlk

# intel
intel-media-driver
vulkan-intel
intel-gmmlib
```

---

## Gallery

### Sway / Hyprland + waybar

![Sway and Hyprland](./screenshots/swayTab.png)

![Sway and Hyprland](./screenshots/sway.png)

![Sway and Hyprland](./screenshots/waybar_floating.png)

### App launcher and power menu: Rofi

![Rofi](./screenshots/rofi_1.png)
![Rofi](./screenshots/rofi_2.png)

---

## Apps in each workspace

| Workspace Number | Assigned Apps         |
| :--------------: | :-------------------- |
|        1         | Terminal              |
|        2         | Browser               |
|        3         | Development/Coding    |
|        4         | File Manager          |
|        5         | Chat                  |
|        6         | Design tools          |
|        7         | Office tools          |
|        8         | System tools and Misc |

## keymaps : for Hyprland and Sway (AI generated tables please look into the `keymaps.config` files for more details)

- I am using keychords like keybindings.

- **for those who don't know about keychords:** actually it's a way to divide your keymaps into multiple layers. For example , suppose you used to use mod+shift+w to launch your browser and mod+shift+q to quit. Now sometimes , due to mistyping, your current focused windows get killed .... Instead of launching the browser.
- Now after applying keycords like behavior, before launching an app you have to enter the launch mode. Then press mod+shift+w to launch the browser. If you use neovim or emacs , consider this as setting a master or prefix key

### Workspace Management

| Keys                           | Action                                   |
| ------------------------------ | ---------------------------------------- |
| **\$mainMod + \[1-8]**         | Switch to workspace (1–8)                |
| **\$mainMod + SHIFT + \[1-8]** | Move active window to workspace (silent) |
| **\$mainMod + Tab**            | Next workspace                           |
| **Alt + Tab**                  | Previous workspace                       |

---

### Window Management

| Keys                      | Action                |
| ------------------------- | --------------------- |
| **\$mainMod + Space**     | Toggle floating       |
| **\$mainMod + m**         | Toggle fullscreen     |
| **\$mainMod + q**         | Cycle next window     |
| **\$mainMod + SHIFT + n** | Cycle layout next     |
| **\$mainMod + SHIFT + p** | Cycle layout previous |
| **\$mainMod + SHIFT + q** | Kill active window    |
| **\$mainMod + SHIFT + o** | Cycle Layouts         |

---

### Window Focus & Movement

| Keys                            | Action                           |
| ------------------------------- | -------------------------------- |
| **\$mainMod + h/j/k/l**         | Move focus (left/down/up/right)  |
| **\$mainMod + SHIFT + h/j/k/l** | Move window (left/down/up/right) |
| **\$mainMod + Ctrl + h/j/k/l**  | Resize window (±30px)            |

---

### Mouse Bindings

| Keys                | Action        |
| ------------------- | ------------- |
| **\$mainMod + LMB** | Move window   |
| **\$mainMod + RMB** | Resize window |

---

### System & Misc

| Keys                      | Action      |
| ------------------------- | ----------- |
| **\$mainMod + SHIFT + R** | Reload      |
| **\$mainMod + SHIFT + X** | Lock screen |

---

### Submap Trigger keys

| Keys                      | Opens Submap |
| ------------------------- | ------------ |
| **\$mainMod + Return**    | `launch`     |
| **\$mainMod + d**         | `rofi`       |
| **\$mainMod + SHIFT + M** | `notify`     |
| **\$mainMod + SHIFT + S** | `scripts`    |

---

### Submap: Launch

| Keys                   | Action                   |
| ---------------------- | ------------------------ |
| **\$mainMod + Return** | Launch terminal          |
| **\$mainMod + w**      | Launch browser           |
| **\$mainMod + i**      | Launch browser incognito |
| **\$mainMod + n**      | Launch file manager      |
| **\$mainMod + o**      | Launch PDF reader        |
| **\$mainMod + b**      | Launch Bluetooth manager |
| **Print**              | Screenshot full          |
| **\$mainMod + Print**  | Screenshot GUI           |
| **Esc**                | Exit submap              |

---

### Submap: Rofi

| Keys                      | Action               |
| ------------------------- | -------------------- |
| **\$mainMod + d**         | Rofi app launcher    |
| **\$mainMod + SHIFT + d** | Rofi run             |
| **\$mainMod + w**         | Rofi window switcher |
| **\$mainMod + e**         | Rofi emoji picker    |
| **\$mainMod + SHIFT + e** | Power menu script    |
| **Esc**                   | Exit submap          |

---

### Submap: Notify

| Keys          | Action                    |
| ------------- | ------------------------- |
| **M**         | Restore notifications     |
| **SHIFT + m** | Dismiss all notifications |
| **Esc**       | Exit submap               |

---

### Submap: Scripts

| Keys    | Action                    |
| ------- | ------------------------- |
| **t**   | wlsunset                  |
| **w**   | Run background chooser    |
| **b**   | Run Waybar theme switcher |
| **Esc** | Exit submap               |

---

### Brightness & Volume

| Keys                                   | Action              |
| -------------------------------------- | ------------------- |
| **XF86MonBrightnessUp / Down**         | Brightness ±10%     |
| **\$mainMod + F4 / F3**                | Brightness ±5%      |
| **XF86AudioRaiseVolume / LowerVolume** | Volume ±5%          |
| **XF86AudioMute**                      | Toggle audio mute   |
| **XF86AudioMicMute**                   | Toggle mic mute     |
| **\$mainMod + F7 / F6**                | Volume ±5% (pactl)  |
| **\$mainMod + F5**                     | Toggle mute (pactl) |

---

### Media Controls

| Keys                          | Action                |
| ----------------------------- | --------------------- |
| **XF86AudioNext / Prev**      | Next / Previous track |
| **XF86AudioPlay / Pause**     | Play / Pause          |
| **\$mainMod + SHIFT + Right** | Next track            |
| **\$mainMod + SHIFT + Left**  | Previous track        |
| **\$mainMod + SHIFT + Up**    | Play                  |
| **\$mainMod + SHIFT + Down**  | Pause                 |

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

##### File Tree : mini.files

![LSP](./screenshots/neovim/2.png)

##### LSP Support and Autocompletion support

![LSP](./screenshots/neovim/3.png)

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
