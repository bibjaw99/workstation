# My workstation configs

## **Descriptions:**

- **OS:** Arch Linux
- **Window Manager:** Sway, Hyprland
- **Bar:** waybar
- **Launcher:** rofi
- **Terminal:** Foot
- **File Manager:** Pcmanfm
- **Primary Browser:** firefox-developer-edition
- **Code Editor** : Neovim
- **Lockscreen:** swaylock
- **Screenshot Tool:** Grim & Satty
- **Fonts:** iosevkaterm nerd font, roboto-condensed, jetbrainsmono nerd font
- **Policykit:** mate-polkit
- **Shell:** zshell

# Notes

> ⚠️ do not forget to change the settings related to your hardwares in `~/.local/share/config_dotfiles/config/sway/devices.conf` or `~/.local/share/config_dotfiles/config/hypr/devices.conf`

> please check the `varibles.conf` file of each window manager config directory at the beginning

> store your bookmarks in "$HOME/.local/share/bookmarks/" directory in `.txt` files to make the bookmark script work

## environment variables

```sh
QT_QPA_PLATFORMTHEME=gtk3
BROWSER=firefox-developer-edition
EDITOR=nvim
TERMINAL=footclient
```

---

## Installation script :

```sh
mkdir -p "$HOME/workstationdots"
[ -d "$HOME/workstationdots/workstation" ] || git clone --depth 1 https://github.com/bibjaw99/workstation "$HOME/workstationdots/workstation"
bash "$HOME/workstationdots/workstation/install_scripts/install.sh"
```

- Or, clone the repo and run the `install.sh` script

## how the script works :

- all the dotfiles will be stored in a folder called `config_dotfiles` in your `$HOME/.local/share` directory
- then if the config already exists in the `$HOME/.config` directory then it will be backed up in the `$HOME/.config.backup` directory
- then a symlink will be created from `$HOME/.local/share/config_dotfiles` directory to the `$HOME/.config` directory
  - **why this approach instead of using/creating actual directories ? :** it's easy to dump them all togather in the project folder after making huge changes in multiple app configs
- names of the config directories and config files that needs to be symlinked, must be listed in the respected files in `workstation/install_scripts/config_lists`.
  - check `symlink_configs.sh` and `symlink_files.sh` to understand it better

## folder structure of my install script :

- if you already finished the base arch installation just clone the repo
- run the `$HOME/workstationdots/workstation/install_scripts/install.sh` script
- before installing you can check the list of the Packages in the install_scripts directory and modify it according to your likings
  - just go to `/workstation/install_scripts/package_lists` directory to find all the list of packages

```sh
.
├── package_lists
│   ├── common_pkg_list.txt
│   ├── dev_pkg_list.txt
│   ├── flatpak_pkg_list.txt
│   ├── gui_pkg_list.txt
│   └── wayland_pkg_list.txt
├── config_lists
│   ├── config_dirs.txt
│   └── config_files.txt
├── install.sh
├── package_install.sh
├── symlink_configs.sh
├── symlink_files.sh
├── enable_services.sh
```

> flatpak install script is optional, so you have to run it manually

---

## Gallery

### Sway

![Sway](https://github.com/bibjaw99/workstation-misc/blob/main/screenshots/sway.png?raw=true)

### waybar themes

- to launch the rofi theme selector, press `mod+shift+s` then `b`

![wabar themes](https://github.com/bibjaw99/workstation-misc/blob/main/screenshots/waybarSwitching.gif?raw=true)

### App launcher and power menu: Rofi

![Rofi](https://raw.githubusercontent.com/bibjaw99/workstation-misc/refs/heads/main/screenshots/rofi_1.png)

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

---

## keymaps

- swaywm : [swaywm keymaps](./config_dotfiles/config/sway/keymaps.conf)
- hyprland : [hyprland keymaps](./config_dotfiles/config/hypr/keymaps.conf)

---

## Neovim Text Editor: Grimm Vim: (Not a distro but my own personal config)

#### Installation Guide :

- remove or backup the `nvim` folder from the following directory :
  - `~/.config/nvim`
  - `~/.cache/nvim`
  - `~/.local/share/nvim`
  - `~/.local/state/nvim`

- Now copy my `nvim` config folder in the `~/.config` directory

##### Start Page

![nvim 1](https://raw.githubusercontent.com/bibjaw99/workstation-misc/refs/heads/main/screenshots/neovim/1.png)

##### File Tree : mini.files

![nvim 2](https://raw.githubusercontent.com/bibjaw99/workstation-misc/refs/heads/main/screenshots/neovim/2.png)

##### Fuzzy Finder: Snacks.nvim

![nvim 6](https://raw.githubusercontent.com/bibjaw99/workstation-misc/refs/heads/main/screenshots/neovim/6.png)

##### LSP Support and Autocompletion support

![nvim 3](https://raw.githubusercontent.com/bibjaw99/workstation-misc/refs/heads/main/screenshots/neovim/3.png)

##### Gitsigns plugin for visual git status

![nvim 4](https://raw.githubusercontent.com/bibjaw99/workstation-misc/refs/heads/main/screenshots/neovim/4.png)

##### Plugin Manager : Lazy and LSP manager : Mason

![nvim 5](https://raw.githubusercontent.com/bibjaw99/workstation-misc/refs/heads/main/screenshots/neovim/5.png)
