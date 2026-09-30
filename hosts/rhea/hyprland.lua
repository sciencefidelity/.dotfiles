local terminal = "wezterm"
local mod = "SUPER"

hl.monitor({
  output = "desc:Apple Computer Inc Color LCD",
  mode = "preferred",
  position = "0x0",
  scale = 1.6,
})

hl.env("XCURSOR_THEME", "Adwaita")
hl.env("XCURSOR_SIZE", "18")

hl.config({
  general = {
    gaps_in = 4,
    gaps_out = 8,
    border_size = 0,
    allow_tearing = false,
    layout = "dwindle",
  },

  decoration = {
    rounding = 12,
    blur = {
      enabled = false,
    },
  },

  animations = {
    enabled = false,
  },

  dwindle = {
    preserve_split = true,
  },

  master = {
    new_status = "master",
  },

  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,
  },

  input = {
    kb_layout = "gb",
    kb_variant = "mac",
    kb_options = "caps:ctrl_modifier",

    repeat_delay = 210,
    repeat_rate = 40,
    follow_mouse = 0,

    touchpad = {
      disable_while_typing = true,
      clickfinger_behavior = true,
      tap_to_click = false,
      natural_scroll = true,
    },
  },
})

hl.device({
  name = "bcm5974",
  accel_profile = "adaptive",
  natural_scroll = true,
  sensitivity = 0,
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})

hl.on(
  "hyprland.start",
  function() hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP") end
)

hl.on(
  "hyprland.start",
  function() hl.exec_cmd("swaybg -i /home/matt/.dotfiles/assets/wallpaper/evening-sky.png -m fill") end
)

hl.bind(mod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + Q", hl.dsp.window.close())

hl.bind(mod .. " + O", hl.dsp.exec_cmd("OBSIDIAN_USE_WAYLAND=1 obsidian --ozone-platform-hint=auto"))

hl.bind(mod .. " + B", hl.dsp.exec_cmd("firefox"))
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + P", hl.dsp.window.pseudo())
hl.bind(mod .. " + R", hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = 1 }))

hl.bind(mod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "d" }))

for i = 1, 7 do
  local key = tostring(i)

  hl.bind(
    mod .. " + " .. key,
    hl.dsp.focus({
      workspace = i,
    })
  )

  hl.bind(
    mod .. " + SHIFT + " .. key,
    hl.dsp.window.move({
      workspace = i,
    })
  )
end

hl.bind(
  mod .. " + mouse_down",
  hl.dsp.focus({
    workspace = "e+1",
  })
)

hl.bind(
  mod .. " + mouse_up",
  hl.dsp.focus({
    workspace = "e-1",
  })
)

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
