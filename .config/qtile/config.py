#########################################
########## Importing Libreries ##########
#########################################

from libqtile import backend, bar, layout, widget, qtile, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

from qtile_extras import widget
from qtile_extras.widget.decorations import PowerLineDecoration

import os
import subprocess

from colors import gruv_mat
from colors import gruvbox

#########################################
#############    hooks     ##############
#########################################

########## Auto Start Programs ##########


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~/.config/autostart/autostart.sh")
    subprocess.Popen([home])


@hook.subscribe.group_window_add
def switchtogroup(group, window):
    group.cmd_toscreen()


#########################################
######### Shortcut Variables ############
#########################################
#### Button Variables ####
mod = "mod4"
alt = "mod1"

########## Powerline from extras ########

arrow_powerlineRight = {
    "decorations": [
        PowerLineDecoration(
            path="arrow_right",
            size=11,
        )
    ]
}
arrow_powerlineLeft = {
    "decorations": [
        PowerLineDecoration(
            path="arrow_left",
            size=11,
        )
    ]
}
rounded_powerlineRight = {
    "decorations": [
        PowerLineDecoration(
            path="rounded_right",
            size=11,
        )
    ]
}
rounded_powerlineLeft = {
    "decorations": [
        PowerLineDecoration(
            path="rouded_left",
            size=11,
        )
    ]
}
slash_powerlineRight = {
    "decorations": [
        PowerLineDecoration(
            path="forward_slash",
            size=11,
        )
    ]
}
slash_powerlineLeft = {
    "decorations": [
        PowerLineDecoration(
            path="back_slash",
            size=11,
        )
    ]
}
######## Applicaton Variables ###########
terminal = guess_terminal()
app_launcher = "rofi -show drun -disable-history -show-icons"
cmd_launcher = "rofi -show run -disable-history"
win_launcher = "rofi -show window -show-icons"
browser = "firefox"
file_manager = "pcmanfm"
screenshot = "flameshot full"
screenshot_gui = "flameshot gui"
lock = "betterlockscreen -l dimblur"

#########################################
############# key Bindings ##############
#########################################

keys = [
    ######### Switch between windows #########
    Key(
        [mod],
        "h",
        lazy.layout.left(),
        desc="Move focus to left",
    ),
    Key(
        [mod],
        "l",
        lazy.layout.right(),
        desc="Move focus to right",
    ),
    Key(
        [mod],
        "j",
        lazy.layout.down(),
        desc="Move focus down",
    ),
    Key(
        [mod],
        "k",
        lazy.layout.up(),
        desc="Move focus up",
    ),
    ######### Toggling Between Active Groups #########
    Key(
        [mod],
        "Tab",
        lazy.screen.next_group(skip_empty=True),
        desc="Toggel next active group",
    ),
    Key(
        [alt],
        "Tab",
        lazy.screen.prev_group(skip_empty=True),
        desc="Toggel previous active group",
    ),
    ######### Moving windows #########
    Key(
        [mod, "shift"],
        "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left",
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key(
        [mod, "shift"],
        "j",
        lazy.layout.shuffle_down(),
        desc="Move window down",
    ),
    Key(
        [mod, "shift"],
        "k",
        lazy.layout.shuffle_up(),
        desc="Move window up",
    ),
    ######### Resizing windows #########
    Key(
        [mod, "control"],
        "h",
        lazy.layout.grow_left(),
        desc="Grow window to the left",
    ),
    Key(
        [mod, "control"],
        "l",
        lazy.layout.grow_right(),
        desc="Grow window to the right",
    ),
    Key(
        [mod, "control"],
        "j",
        lazy.layout.grow_down(),
        desc="Grow window down",
    ),
    Key(
        [mod, "control"],
        "k",
        lazy.layout.grow_up(),
        desc="Grow window up",
    ),
    Key(
        [mod],
        "n",
        lazy.layout.normalize(),
        desc="Reset all window sizes",
    ),
    ######### Actions ##########
    Key(
        [mod, "shift"],
        "q",
        lazy.window.kill(),
        desc="Kill focused window",
    ),
    Key(
        [mod, "shift"],
        "r",
        lazy.reload_config(),
        desc="Reload the config",
    ),
    ######### Toggle Layout #########
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle Full Screen",
    ),
    Key(
        [mod],
        "space",
        lazy.window.toggle_floating(),
        desc="Toggle Floating layout",
    ),
    Key(
        [mod, "shift"],
        "o",
        lazy.next_layout(),
        desc="Toggle between layouts",
    ),
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    ########## Application Shortcts #########
    Key(
        [mod],
        "Return",
        lazy.spawn(terminal),
        desc="Launch terminal",
    ),
    ### Rofi ###
    Key(
        [mod],
        "d",
        lazy.spawn(app_launcher),
        desc="Launch Rofi drun",
    ),
    Key(
        [alt],
        "d",
        lazy.spawn(cmd_launcher),
        desc="Launch Rofi run",
    ),
    Key(
        [alt],
        "w",
        lazy.spawn(win_launcher),
        desc="Launch Rofi Windows",
    ),
    Key(
        [mod, "shift"],
        "e",
        lazy.spawn(os.path.expanduser("~/.config/qtile/scripts/power.sh")),
        desc="Rofi Power Menu",
    ),
    Key(
        [mod, "shift"],
        "x",
        lazy.spawn(lock),
        desc="Betterlockscreen",
    ),
    Key(
        [mod],
        "w",
        lazy.spawn(browser),
        desc="Launch Browser",
    ),
    Key(
        [mod],
        "n",
        lazy.spawn(file_manager),
        desc="Launch File Manager",
    ),
    Key(
        [],
        "Print",
        lazy.spawn(screenshot),
        desc="Screenshot",
    ),
    Key(
        [mod],
        "Print",
        lazy.spawn(screenshot_gui),
        desc="Screenshot",
    ),
]

#########################################
############# Groups/Workspaces #########
#########################################

groups = [
    Group(
        "1",
        label="",
        matches=[Match(wm_class="kitty")],
        layout="monadtall",
    ),
    Group(
        "2",
        label="",
        matches=[Match(wm_class="firefox")],
        layout="monadtall",
    ),
    Group(
        "3",
        label="",
        matches=[Match(wm_class="Code,Anaconda-Navigator")],
        layout="monadtall",
    ),
    Group(
        "4",
        label="",
        matches=[Match(wm_class="Pcmanfm")],
        layout="monadtall",
    ),
    Group(
        "5",
        label="󰍦",
        matches=[Match(wm_class="TelegramDesktop, discord")],
        layout="monadtall",
    ),
    Group(
        "6",
        label="",
        matches=[Match(wm_class="Gimp-2.10,Inkscape,Darktable")],
        layout="monadtall",
    ),
    Group(
        "7",
        label="",
        matches=[Match(wm_class="marktext,Soffice,SimpleScreenRecorder,Atril")],
        layout="monadtall",
    ),
    Group(
        "8",
        label="󰚀",
        matches=[
            Match(wm_class="Lxappearance,Yad,stacer,qBittorrent,Gnome-disks,Nitrogen")
        ],
        layout="monadtall",
    ),
]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name),
                desc="move focused window to group {}".format(i.name),
            ),
        ]
    )

#########################################
############# Window Layouts ###########
#########################################

layouts = [
    layout.MonadTall(
        border_width=2,
        margin=6,
        border_focus=gruv_mat["grey"],
        border_normal=gruv_mat["dark"],
    ),
    layout.Max(
        border_width=2,
        margin=6,
        border_focus=gruv_mat["grey"],
        border_normal=gruv_mat["dark"],
    ),
]

########################################
######### FLOATING LAYOUT ##############
########################################
floating_layout = layout.Floating(
    border_width=2,
    border_focus=gruv_mat["grey"],
    border_normal=gruv_mat["dark"],
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="confirm"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(wm_class="pavucontrol"),
        Match(wm_class="dialog"),
        Match(wm_class="error"),
        Match(wm_class="file_progress"),
        Match(wm_class="notification"),
        Match(wm_class="splash"),
        Match(wm_class="toolbar"),
        Match(wm_class="download"),
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
)

########################################
######### BAR AND WIDGETS ##############
########################################

########### MOUSE CALL BACKS ###########


def open_rofi():
    qtile.cmd_spawn(app_launcher)


######### DEFAULT WIDGET SETTINGS ######

widget_defaults = dict(
    font="FiraCode Nerd Font",
    fontsize=14,
    padding=3,
    foreground=gruv_mat["white"],
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                #########################
                # Widget Configurations #
                #########################
                widget.Image(
                    filename="~/.config/qtile/imgs/arch.png",
                    mouse_callbacks={"Button1": open_rofi},
                    background=gruvbox["yellow"],
                    margin=3,
                ),
                widget.Spacer(
                    length=1,
                    background=gruvbox["yellow"],
                    **arrow_powerlineLeft,
                ),
                widget.GroupBox(
                    font="FiraCode Nerd Font Mono",
                    fontsize=27,
                    padding_x=5,
                    padding_y=5,
                    rounded=False,
                    center_aligned=True,
                    disable_drag=True,
                    borderwidth=3,
                    highlight_method="line",
                    active=gruvbox["cream"],
                    inactive=gruvbox["blue-alt"],
                    highlight_color=gruvbox["dark-grey"],
                    this_current_screen_border=gruvbox["yellow"],
                    this_screen_border=gruv_mat["disabled"],
                    other_screen_border=gruv_mat["red"],
                    other_current_screen_border=gruv_mat["red"],
                    background=gruvbox["dark-grey"],
                    foreground=gruv_mat["disabled"],
                    **arrow_powerlineLeft,
                ),
                widget.Spacer(
                    length=1,
                    background=gruvbox["dark-grey"],
                    **arrow_powerlineLeft,
                ),
                widget.TaskList(
                    margin=0,
                    padding=6,
                    icon_size=0,
                    fontsize=14,
                    borderwidth=1,
                    rounded=False,
                    highlight_method="block",
                    title_width_method="uniform",
                    urgent_alert_methond="border",
                    foreground=gruv_mat["black"],
                    background=gruvbox["cream"],
                    border=gruvbox["cream"],
                    urgent_border=gruv_mat["red-alt"],
                    txt_floating=" ",
                    txt_maximized=" ",
                    txt_minimized=" ",
                ),
                widget.Spacer(
                    length=1,
                    background=gruvbox["cream"],
                    **rounded_powerlineRight,
                ),
                widget.Spacer(
                    length=1,
                    background=gruvbox["dark-grey"],
                    **arrow_powerlineRight,
                ),
                widget.CPU(
                    padding=5,
                    format="  {freq_current}GHz {load_percent}%",
                    foreground=gruvbox["cream"],
                    background=gruvbox["dark-grey"],
                    **slash_powerlineRight,
                ),
                widget.ThermalSensor(
                    padding=5,
                    update_interval=1,
                    format="󰔐 {temp:.0f}{unit}",
                    tag_sensor="Tctl",
                    foreground=gruvbox["cream"],
                    background=gruvbox["blue-alt"],
                    **slash_powerlineRight,
                ),
                widget.Memory(
                    padding=5,
                    format="󰈀 {MemUsed:.0f}{mm}",
                    background=gruvbox["cream"],
                    foreground=gruvbox["dark-grey"],
                    **slash_powerlineRight,
                ),
                widget.Clock(
                    padding=5,
                    format="  %a %d %b %H:%M:%S",
                    foreground=gruvbox["yellow"],
                    background=gruvbox["dark-grey"],
                    **slash_powerlineRight,
                ),
                widget.PulseVolume(
                    fmt="󰕾 {}",
                    foreground=gruvbox["dark"],
                    background=gruvbox["yellow"],
                    padding=10,
                    **slash_powerlineRight,
                ),
                widget.Systray(
                    padding=7,
                    icon_size=15,
                ),
                widget.CurrentLayoutIcon(
                    padding=5,
                    scale=0.5,
                ),
            ],
            ######################
            # BAR CONGIGURATIONS #
            ######################
            30,
            margin=[9, 10, 6, 10],
            border_width=[0, 0, 0, 0],
            background=gruv_mat["dark"],
        ),
    ),
]

#########################################
###### MOUSE SETTINGS / BINDINGS ########
#########################################
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = True
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
