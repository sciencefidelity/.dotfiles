local wezterm = require("wezterm")

return {
  font = wezterm.font_with_fallback({ "MonoLisa Script", "Symbols Nerd Font Mono" }),
  font_size = font_size,
  line_height = 1.17,
  freetype_load_target = "Light",
  freetype_interpreter_version = 40,
  bold_brightens_ansi_colors = "No",
  color_scheme = "Catppuccin Mocha",
  enable_tab_bar = false,
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  tab_max_width = 8,
  hide_tab_bar_if_only_one_tab = true,
  window_background_opacity = 0.9,
  cell_width = 0.9,
  window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
  },
}
