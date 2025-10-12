# programs and pacakages

## wm : sway

- sway
- hyprland
- waybar
- swaybg,waypaper
- swaync + libnotify
- swaylock
- grim , slurp
- rofi-wayland
- xdg-desktop-portal-wlr
- nwg-look
- fuzzel

## xdg-desktop-portal-wlr in swaywm

add the following line in sway config

```bash
exec "dbus-update-activation-environment --systemd --all "
exec "dbus-update-activation-environment --systemd XDG_CURRENT_DESKTOP=sway "
```

create a file in `.config/xdg-desktop-portal/portals.conf` and add the following line

```
[preferred]
default=wlr
```

## bemoji with fuzzel

```sh
BEMOJI_PICKER_CMD="fuzzel -d" bemoji
```
