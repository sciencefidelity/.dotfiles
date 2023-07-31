local wezterm = require 'wezterm'

local config = {}

config.font = wezterm.font 'MonoLisa'
config.font_size = 13.0
config.line_height = 1.17
config.freetype_load_target = "Light"
config.freetype_interpreter_version = 40
config.bold_brightens_ansi_colors = "No"
config.color_scheme = "Dracula (Official)"
config.enable_tab_bar = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_max_width = 8
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "INTEGRATED_BUTTONS"
config.initial_cols = 223
config.initial_rows = 52
config.cell_width = 0.9
config.window_padding = {
  left = 19,
  right = 19,
  top = 80,
  bottom = 10,
}
config.default_cursor_style = "SteadyUnderline"
config.animation_fps = 1
config.audible_bell = "Disabled"

return config