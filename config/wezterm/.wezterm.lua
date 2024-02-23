local wezterm = require "wezterm"

return {
  font = wezterm.font_with_fallback { "MonoLisa Custom", "Symbols Nerd Font Mono" },
  font_size = 13.0,
  line_height = 1.17,
  freetype_load_target = "Light",
  freetype_interpreter_version = 40,
  bold_brightens_ansi_colors = "No",
  -- color_scheme = "Dracula (Official)",
  color_scheme = "Catppuccin Mocha",
  enable_tab_bar = false,
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  tab_max_width = 8,
  hide_tab_bar_if_only_one_tab = true,
  window_decorations = "INTEGRATED_BUTTONS",
  initial_cols = 223,
  initial_rows = 52,
  cell_width = 0.9,
  window_padding = {
    left = 19,
    right = 19,
    top = 80,
    bottom = 10,
  },
  inactive_pane_hsb = {
    saturation = 1.0,
    brightness = 1.0,
  },
  default_cursor_style = "SteadyUnderline",
  animation_fps = 1,
  audible_bell = "Disabled",
}
