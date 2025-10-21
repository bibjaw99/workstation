## keymaps : Sway (AI generated tables please look into the `keymaps.config` files for more details)

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

| Keys                      | Action                                          |
| ------------------------- | ----------------------------------------------- |
| **\$mainMod + Space**     | Toggle floating                                 |
| **\$mainMod + m**         | Toggle fullscreen                               |
| **\$mainMod + q**         | focus next/floating window                      |
| **\$mainMod + SHIFT + n** | Cycle window next                               |
| **\$mainMod + SHIFT + p** | Cycle window previous                           |
| **\$mainMod + SHIFT + q** | Kill active window                              |
| **\$mainMod + SHIFT + o** | Cycle Layouts : `tabbed, vertical , horizontal` |

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

### Submap/mode Trigger keys

| Keys                      | Opens Submap                     |
| ------------------------- | -------------------------------- |
| **\$mainMod + Return**    | `launch`                         |
| **\$mainMod + d**         | `rofi`                           |
| **\$mainMod + SHIFT + S** | `scripts`                        |
| **\$mainMod + SHIFT + M** | `notify`                         |
| **\$mainMod + SHIFT + u** | `swap` : window swapping in sway |

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
