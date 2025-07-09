# Some notes and commands

## set thems and icons for flatpak apps

check theme and icon

```
ls -I "*.*" /usr/share/themes
ls -I "*.*" /usr/share/icons
```

set theme and icon

```
sudo flatpak override --env=GTK_THEME=Materia-dark-compact
sudo flatpak override --env=ICON_THEME=Tela-circle-black-dark
```

flatpak global override configs are in : `cd /var/lib/flatpak/overrides`

---

## xfce minimal install:

1. xfce4-session

2. xfce4-panel

3. xfwm4

4. xfce4-settings

5. xfce4-pulseaudio-plugin

6. xfce4-cpufreq-plugin

7. xcec4-sensors-plugin

---

## commands:

### Set default file manager

```
$ xdg-mime default pcmanfm.desktop inode/directory
$ xdg-user-dirs-update # or xdg-user-dirs-update --force
```

### Ran into an issue related to systemd `a failed ret 0x0`

```
$ sudo nvim /etc/mkinitcpio.conf
# pass parameter in `modules=()`
$ modules = (amdgpu)
$ sudo mkinitcpio -p linux
```

---

## EndeavourOS minimal install (Total around 370 pkgs only)

- DE: No Desktop
- Ticked Packages:
  - Network: networkmanager
  - Package Management (full)
  - EndeavourOS Apps: eos-log-tool, eos-rankmirrors, reflector-simple, Welcome,

## Alacritty Emoji support

```
$ mkdir -p ~/.config/fontconfig/conf.d/
$ cd ~/.config/fontconfig/conf.d/
$ nvim 01-emoji.conf

# add these lines :

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <alias>
    <family>serif</family>
    <prefer>
      <family>Noto Color Emoji</family>
    </prefer>
  </alias>
  <alias>
    <family>sans-serif</family>
    <prefer>
      <family>Noto Color Emoji</family>
    </prefer>
  </alias>
  <alias>
    <family>monospace</family>
    <prefer>
      <family>Noto Color Emoji</family>
    </prefer>
  </alias>
</fontconfig>
```

---

# Artix (runit) exclusive things to do

## basestrap instead of pacstrap :

```
$ basestrap /mnt linux linux-firmware linux-headers base base-devel vim runit elogind-runit grub efibootmgr networkmanager networkmanager-runit dosfstools dbus xdg-utils
```

---

## Post Installation

### Services

- Most of the services are stored in `/etc/runit/sv` and to start a service you need to create a symlink to `/run/runit/service` like the following

  ```
  $ sudo ln -s /etc/runit/sv/[service_name] /run/runit/service # simply remove the  symlink if you want to disable a service.
  ```

  - Important services to enable on first boot :
    1. networkmanager
    2. dbus
    3. elogind
    4. lightdm (optional)

---

### Adding Arch repos

- Before adding arch repos must install the following packages:
  1. artix-archlinux-support
  2. archlinux-keyring
  3. archlinux-mirrorlist

- Artix repos are stored in `/etc/pacman.d/mirrorlist` and arch repos are disabled by default.
- To add arch repos you must follow the rules from the wiki cause the rules may get updated ⚠️ .So always take a look in the wiki before doing so.
- I only feet the necessity of adding the "extra" repo which must be placed under all the artix repos in `/etc/pacman.conf`

  ```
    [system]
    Include = /etc/pacman.d/mirrorlist

    [world]
    Include = /etc/pacman.d/mirrorlist

    [galaxy]
    Include = /etc/pacman.d/mirrorlist

    [lib32]
    Include = /etc/pacman.d/mirrorlist

    [extra]
    Include = /etc/pacman.d/mirrorlist-arch -- # archlinux mirrorlist

  ```

- I created a file in `/etc/pacman.d/` named `mirrorlist-arch` and added repos using "rate-mirrors" package.
  ```
  $ rate-mirrors --allow-root arch | sudo tee /etc/pacman.d/mirrorlist-arch
  ```

---

### Starting window managers with dbus

- The window managers and login managers must start with `dbus-run-session` command, else external drives and trash icon will not show up. e.g.

  ```
  $ exec dbus-run-session i3 -- # in .xinitrc if you use startx to login.
  $ exec dbus-run-session $@  -- # add "dbus-run-session" in /etc/lightdm/Xsession

  ```

---

### PowerOff, Reboot and Suspending :

- Use `loginclt` instead of `systemctl`.

  ```
  $ loginclt poweroff
  $ loginclt reboot
  $ loginclt suspend
  ```

---

# important packages for laptop settings

## Drivers

- xorg
- intel-media-driver
- vulkan-intel
- intel-gmmlib

## i3lock when screen is closed

- xss-lock
- betterlockscreen

For betterlockscreen to work with laptop lid

```
$ sudo systemctl enable betterlockscreen@<user_name>.service
$ sudo nvim /etc/systemd/logind.conf
// uncomment `HandleLidSwitch=suspend`
```

## Bluetooth

- blueman
- bluez
- bluez-utils
- gnome-bluetooth

## Brightnessctl

- brightnessctl

the following file must be created to access brightness control in polybar:

```
sudo nvim /etc/udev/rules.d/backlight.rules
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp video $sys$devpath/brightness", RUN+="/bin/chmod g+w $sys$devpath/brightness"
sudo usermod -aG video $USER
```

## Misc

- lshw
- auto-cpufreq # for optimizing cpu according to usage. The config file must be located in /etc/auto-cpufreq.conf

---

## Important commands

to check bluetooth status:

```
bluetoothctl info
```

## Enable touchpad gestures

- create a file at `/etc/X11/xorg.conf.d/90.touchpad.conf`
- add the following lines :

```
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
EndSection
```

## Set up environment variables

- open `/etc/environment` and add the following lines :

```
QT_QPA_PLATFORMTHEME=gtk3
BROWSER=firefox
EDITOR=nvim
```

## sddm sugar-candy theme

```
$ sudo cp /usr/lib/sddm/sddm.conf.d/default.conf /etc/sddm.conf

$ sudo nvim /etc/sddm.conf

# set the theme to sugar-candy
[Theme]
# Current theme name
Current=sugar-candy
```

## Splash screen : plymouth

```
# check available themes
$ sudo plymouth-set-default-theme -l

# Set a splash theme
$ sudo plymouth-set-default-theme -R solar

$ sudo nvim /etc/mkinitcpio.conf
# add plymouth hook
HOOKS=(base udev plymouth autodetect microcode modconf kms keyboard keymap consolefont block filesystems fsck)
# update:
$ sudo mkinitcpio -p linux
```

## Flags for chromium based borwsers

### files for browsers

- brave-flags.conf
- chrome-flags.conf
- chromium-flags.conf

```
--ignore-gpu-blocklist
--enable-zero-copy
--enable-features=VaapiVideoDecodeLinuxGL
--enable-features=VaapiVideoDecoder,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE
```

> put them in the .config directory

## image preview with sixel

- libsixel
- imagemagick

## Disable gtk rounded corner:

- go to : `.config/gtk-version/gtk.css`

```css
decoration {
  box-shadow: none;
  border-top-left-radius: 0px;
  border-top-right-radius: 0px;
  border-bottom-left-radius: 0px;
  border-bottom-right-radius: 0px;
}

decoration:backdrop {
  box-shadow: none;
}

.titlebar,
.titlebar .background,
.window-frame,
.window-frame:backdrop {
  border-top-left-radius: 0px;
  border-top-right-radius: 0px;
  border-bottom-left-radius: 0px;
  border-bottom-right-radius: 0px;
  box-shadow: none;
}
```

## zen browser

- `zen.urlbar.replace-newtab` - false
- `zen.view.experimental-no-window-controls` - false

## always youtube theatre mode

- go to youtube.com
- run the following code in the console

```
document.cookie = 'wide=1; expires='+new Date('3099').toUTCString()+'; path=/';
```
