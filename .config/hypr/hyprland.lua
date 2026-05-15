require("keybindings")
require("lookandfeel")

-- Monitors
hl.monitor({ output = "DP-3",    mode = "2560x1440@144", position = "auto-center-down", scale = 1 })
hl.monitor({ output = "HDMI-A-1", mode = "3840x2160@60",  position = "auto-center-up",   scale = 1.5 })

-- Programs
local terminal    = "kitty"
local fileManager = "nautilus"
local menu        = "wofi --show drun"
local firefox     = "firefox"

-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("ds-inhibit")
    hl.exec_cmd("bash -c 'while ! busctl --user list 2>/dev/null | grep -q StatusNotifierWatcher; do sleep 1; done; protonvpn-app'")
    hl.exec_cmd("bash -c 'while ! busctl --user list 2>/dev/null | grep -q StatusNotifierWatcher; do sleep 1; done; trayscale --hide-window'")
end)

-- Environment variables
hl.env("XCURSOR_SIZE",        "24")
hl.env("XCURSOR_THEME",       "Moga-Neon-Orange")
hl.env("XDG_MENU_PREFIX",     "arch-")
hl.env("QT_QPA_PLATFORMTHEME","qt6ct")
hl.env("QT_QPA_PLATFORM",     "wayland")
hl.env("QT_SCALE_FACTOR",     "1.5")
hl.env("FILEMANAGER",         "nautilus")

-- XWayland
hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

-- Input
hl.config({
    input = {
        kb_layout    = "us",
        follow_mouse = 1,
        sensitivity  = 0,
        accel_profile = "flat",
        touchpad = {
            natural_scroll     = true,
            tap_to_click       = false,
            clickfinger_behavior = true,
            scroll_factor      = 0.3,
        },
    },
})

-- 3-finger horizontal swipe to switch workspaces
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Per-device config
hl.device({ name = "gxtp7936:00-27c6:0123", sensitivity = 0 })

-- Window rules
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })
hl.window_rule({ match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false }, no_focus = true })
