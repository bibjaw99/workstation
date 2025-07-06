#!/bin/bash

packages=(
# common system packages
zsh
zsh-syntax-highlighting
zsh-autosuggestions lshw
libnotify
ghostty
pcmanfm
xarchiver
gvfs
gvfs-mtp
gvfs-gphoto2
mtpfs
jmtpfs
ntfs-3g
mate-polkit
xdg-desktop-portal
xdg-user-dirs
networkmanager
network-manager-applet
wget
unzip
unrar
gnome-keyring
gnome-disk-utility
libgnome-keyring
brightnessctl

# xorg-packages
lxappearance-gtk3
xdg-desktop-portal-gtk
xsel
xorg-xrandr
xdotool
picom
nitrogen

# i3-wm
i3-wm
i3lock
dunst
polybar

# dev packages
tmux
neovim
tree-sitter-cli
texlive-binextra
fzf
ripgrep
lazygit
tokei
mingw-w64-gcc
gcc
cmake
yarn
lua
typescript
luarocks
npm
ctags
uthash
libconfig
meson
ninja
python-pip
rust

# utility
imagemagick
python-pillow
rofi-wayland
rofi-emoji-git
plymouth
rate-mirrors-bin
pacman-contrib
eza
starship
zathura
zathura-pdf-poppler
poppler

# sound and media
pavucontrol
pipewire
pipewire-pulse
pipewire-jack
pipewire-alsa
wireplumber
blueman
bluez
bluez-utils
gnome-bluetooth
cmus
feh
mpv

# fonts and UI
ttf-dejavu
ttf-roboto
ttf-jetbrains-mono-nerd
ttf-font-awesome
noto-fonts-emoji
tela-circle-icon-theme-black
materia-gtk-theme

# wayland packages
wayland
xorg-xwayland
waybar
grim
slurp
nwg-look
wl-clipboard

# sway packages
sway
swaync
swaybg
swaylock
xdg-desktop-portal-wlr

# hyprland packages
hyprland
hyprlock
hyprpaper
xdg-desktop-portal-hyprland
mako
)

for package in "${packages[@]}"; do
  installed=$(yay -Qi "$package" 2>/dev/null | awk -F ' *: ' '$1 == "Name" { print $2 }')
  if [[ -z "$installed" ]]; then
    yay -S --noconfirm "$package"
  else
    echo "$package is already installed"
  fi
done
