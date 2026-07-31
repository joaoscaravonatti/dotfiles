-- Migrated from hyprland.conf to Hyprland's native Lua config (0.55+).
-- This file is NOT active. Hyprland still uses hyprland.conf until you
-- rename this to hyprland.lua (or move hyprland.conf away).
-- See https://wiki.hypr.land/Configuring/Start/

------------------
--  MONITORS   --
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

-- Two monitors setup
-- hl.monitor({ output = "eDP-1", mode = "1920x1080", position = "0x0", scale = 1 })
-- hl.monitor({ output = "HDMI-A-1", mode = "2560x1080", position = "-2560x0", scale = 1 })

-- Only external monitor
hl.monitor({ output = "eDP-1", disabled = true })
hl.monitor({ output = "HDMI-A-1", mode = "2560x1080", position = "0x0", scale = 1 })

-------------------
--  MY PROGRAMS  --
-------------------

-- Set programs that you use
local terminal      = "wezterm"
local fileManager   = "nautilus"
local menu          = "~/.config/rofi/launcher.sh"
local clipboardmenu = "~/.config/rofi/clipboard.sh"
local powermenu     = "~/.config/rofi/power.sh"
local passwordsmenu = "~/.config/rofi/passwords.sh"
local browser       = "brave"
local lockScreen    = "hyprlock"
local printScreen        = 'grim -g "$(slurp -d)" - | wl-copy'
local printScreenAndEdit = 'grim -g "$(slurp)" - | swappy -f -'
local extractText        = "~/.config/rofi/extract-text.sh"

------------------
--  AUTOSTART   --
------------------

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")  -- Stores only text data
    hl.exec_cmd("wl-paste --type image --watch cliphist store") -- Stores only image data
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("~/.config/hypr/notify-low-battery.sh")
    hl.exec_cmd("awww img ~/Pictures/Wallpapers/arch.jpeg")
end)
-- hl.exec_cmd("~/.config/hypr/awww.sh")

------------------------------
--  ENVIRONMENT VARIABLES   --
------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

hl.config({
    cursor = {
        no_hardware_cursors = false,
    },

    debug = {
        disable_logs = false,
    },
})

---------------------
--  LOOK AND FEEL  --
---------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,

        border_size = 2,

        -- See the wiki for info about colors
        col = {
            active_border   = { colors = { "rgba(c0caf5ff)", "rgba(b4f9f8ff)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding = 3,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        -- See https://wiki.hypr.land/Configuring/Basics/Variables/ for shadow
        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a, -- rgba(1a1a1aee)
        },

        -- See https://wiki.hypr.land/Configuring/Basics/Variables/ for blur
        blur = {
            enabled = true,
            size    = 6,
            passes  = 2,
            popups  = false,
        },
    },

    animations = {
        enabled = true,
    },
})

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows",          enabled = true, speed = 5, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 5, bezier = "default",  style = "slide" })
hl.animation({ leaf = "border",           enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle",      enabled = true, speed = 8,  bezier = "default" })
hl.animation({ leaf = "fade",             enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 6,  bezier = "default", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3,  bezier = "default", style = "slidevert" })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },

    -- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
    master = {
        new_status = "master",
    },

    -- See https://wiki.hypr.land/Configuring/Basics/Variables/ for misc
    misc = {
        force_default_wallpaper = -1,             -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true,           -- If true disables the random hyprland logo / anime girl background. :(
        font_family             = "MesloLGS NF",
    },
})

----------------
--   INPUT    --
----------------

-- See https://wiki.hypr.land/Configuring/Basics/Variables/ for input
hl.config({
    input = {
        kb_layout  = "us,br",
        kb_variant = "",
        kb_model   = "",
        kb_options = "grp:win_space_toggle",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll      = true,
            scroll_factor       = 0.2,
            disable_while_typing = true,
        },
    },
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

-------------------
--  KEYBINDINGS  --
-------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Custom
hl.bind(mainMod .. " + w", hl.dsp.exec_cmd("waybar"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd(clipboardmenu))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd(passwordsmenu))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind("Print", hl.dsp.exec_cmd(printScreen))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(printScreenAndEdit))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd(extractText))
hl.bind(mainMod .. " + ALT + h", hl.dsp.workspace.move({ monitor = "-1" }))
hl.bind(mainMod .. " + ALT + Left", hl.dsp.workspace.move({ monitor = "-1" }))
hl.bind(mainMod .. " + ALT + l", hl.dsp.workspace.move({ monitor = "+1" }))
hl.bind(mainMod .. " + ALT + Right", hl.dsp.workspace.move({ monitor = "+1" }))
hl.bind(mainMod .. " + grave", hl.dsp.focus({ workspace = "empty" }))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(powermenu))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()) -- dwindle
hl.bind(mainMod .. " + J", hl.dsp.window.pseudo()) -- dwindle

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + Left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + H",     hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + L",     hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + Up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + Down",  hl.dsp.focus({ direction = "down" }))

-- Move window to left or right
hl.bind(mainMod .. " + SHIFT + Left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + H",     hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + L",     hl.dsp.window.move({ direction = "right" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + SHIFT + grave", hl.dsp.window.move({ workspace = "empty" }))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Navigate through existing workspaces with mainMod + TAB
hl.bind(mainMod .. " + Tab",       hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume",   hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",   hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),  { locked = true, repeating = true })
hl.bind("XF86AudioMute",          hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",       hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",    hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",  hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

-------------------------------
--  WINDOWS AND WORKSPACES   --
-------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example windowrule v1
-- hl.window_rule({ match = { class = "^kitty$" }, float = true })

-- Layer rules
hl.layer_rule({ match = { namespace = "waybar" }, blur = true })
hl.layer_rule({ match = { namespace = "rofi" }, blur = true })
hl.layer_rule({ match = { namespace = "selection" }, blur = false })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, blur = false })
