-- Keybindings

local home        = os.getenv("HOME")
local terminal    = "kitty"
local fileManager = "nautilus"
local menu        = "wofi --show drun"
local firefox     = "firefox"
local mainMod     = "SUPER"

-- General
hl.bind(mainMod .. " + return",       hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C",            hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + M",    hl.dsp.exit())
hl.bind(mainMod .. " + E",            hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V",            hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + space",        hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + J",            hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F",            hl.dsp.exec_cmd(firefox))
hl.bind(mainMod .. " + L",            hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + M",            hl.dsp.exec_cmd("spotify"))

-- Screenshot
hl.bind(mainMod .. " + SHIFT + p",    hl.dsp.exec_cmd("hyprshot -m region -o " .. home .. "/Pictures/Screenshots"))

-- Move focus
hl.bind(mainMod .. " + left",         hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right",        hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up",           hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down",         hl.dsp.focus({ direction = "d" }))

-- Switch workspaces
hl.bind(mainMod .. " + 1",            hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2",            hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3",            hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4",            hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5",            hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6",            hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7",            hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8",            hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9",            hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0",            hl.dsp.focus({ workspace = 10 }))

-- Move window to workspace
hl.bind(mainMod .. " + SHIFT + 1",    hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2",    hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3",    hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4",    hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5",    hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6",    hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7",    hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8",    hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9",    hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0",    hl.dsp.window.move({ workspace = 10 }))

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S",            hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S",    hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces with mouse wheel
hl.bind(mainMod .. " + mouse_down",   hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",     hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mouse
hl.bind(mainMod .. " + mouse:272",    hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273",    hl.dsp.window.resize(), { mouse = true })

-- Volume and brightness
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),  { repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),        { repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                   { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                   { repeating = true })

-- Media keys (work on lockscreen)
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),        { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),    { locked = true })

-- Refresh rate
hl.bind(mainMod .. " + ALT + F1", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/set-refresh.sh 60"))
hl.bind(mainMod .. " + ALT + F2", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/set-refresh.sh 165"))

-- GPU switching (reboot required)
hl.bind(mainMod .. " + ALT + F3", hl.dsp.exec_cmd('sudo envycontrol -s integrated && notify-send "GPU" "Switched to Intel Arc - reboot to apply"'))
hl.bind(mainMod .. " + ALT + F4", hl.dsp.exec_cmd('sudo envycontrol -s hybrid && notify-send "GPU" "Switched to Hybrid - reboot to apply"'))
hl.bind(mainMod .. " + ALT + F5", hl.dsp.exec_cmd('sudo envycontrol -s nvidia && notify-send "GPU" "Switched to Nvidia - reboot to apply"'))

-- Reload config
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))
