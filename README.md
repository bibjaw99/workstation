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
- **File Manager:** Nemo
- **Screenshot Tool:** flameshot
- **Fonts:** iosevkaterm nerd font, roboto-condensed
- **Policykit:** mate-polkit
- **Shell:** zshell

# Notes

- [Notes](./notes/notes.md)
- [Arch Installation Process I followed](./notes/archInstalltion.md)

## ⚠️ do not forget to change the settings related to your hardwares in `~/.config/sway/devices.conf` and `~/.config/hypr/devices.conf`

---

## [keybindings](./notes/keymaps.md)

## Installation script :

```sh
curl -s https://raw.githubusercontent.com/bibjaw99/workstation/refs/heads/master/install_scripts/script.sh | bash
```

- Or, clone the repo and run the `install.sh` script

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
├── symlink_configs.sh
└── symlink_files.sh
```

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

### Sway / Hyprland

![Sway and Hyprland](https://github.com/bibjaw99/workstation-screenshots/blob/main/screenshots/sway.png?raw=true)

### waybar themes

- to launch the rofi theme selector, press `mod+shift+s` then `b`

![wabar themes](https://github.com/bibjaw99/workstation-screenshots/blob/main/screenshots/waybarSwitching.gif?raw=true)

### App launcher and power menu: Rofi

![Rofi](https://raw.githubusercontent.com/bibjaw99/workstation-screenshots/refs/heads/main/screenshots/rofi_1.png)

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

## Neovim Text Editor: Grimm Vim: (Not a distro but my own personal config)

#### Installation Guide :

- remove or backup the `nvim` folder from the following directory :
  - `~/.config/nvim`
  - `~/.cache/nvim`
  - `~/.local/share/nvim`
  - `~/.local/state/nvim`

- Now copy my `nvim` config folder in the `~/.config` directory

##### Start Page

![nvim 1](https://raw.githubusercontent.com/bibjaw99/workstation-screenshots/refs/heads/main/screenshots/neovim/1.png)

##### File Tree : mini.files

![nvim 2](https://raw.githubusercontent.com/bibjaw99/workstation-screenshots/refs/heads/main/screenshots/neovim/2.png)

##### LSP Support and Autocompletion support

![nvim 3](https://raw.githubusercontent.com/bibjaw99/workstation-screenshots/refs/heads/main/screenshots/neovim/3.png)

##### Gitsigns plugin for visual git status

![nvim 4](https://raw.githubusercontent.com/bibjaw99/workstation-screenshots/refs/heads/main/screenshots/neovim/4.png)

##### ToggleTerm X Lazygit

![nvim 5](https://raw.githubusercontent.com/bibjaw99/workstation-screenshots/refs/heads/main/screenshots/neovim/5.png)

##### Plugin Manager : Lazy and LSP manager : Mason

![nvim 6](https://raw.githubusercontent.com/bibjaw99/workstation-screenshots/refs/heads/main/screenshots/neovim/6.png)
