{ config, inputs, pkgs, ... }:

let
  fontSize = toString (config.terminal.fontSize or 7.5);
  paddingLeft = toString (config.terminal.paddingLeft or 10);
  paddingRight = toString (config.terminal.paddingRight or 10);
  paddingTop = toString (config.terminal.paddingTop or 10);
  paddingBottom = toString (config.terminal.paddingBottom or 10);
  opacity = toString (config.terminal.opacity or 1);
in
{
  home.file.options = {
    enable = true;

    target = ".config/wezterm/options.lua";
    text = /*lua*/ ''
      local options = {
        font_size = ${fontSize},
        padding_left = ${paddingLeft},
        padding_right = ${paddingRight},
        padding_top = ${paddingTop},
        padding_bottom = ${paddingBottom},
        opacity = ${opacity},
      }
      return options
    '';
  };

  programs.wezterm = {
    enable = true;
    # package = inputs.wezterm.packages.${pkgs.system}.default;
    extraConfig = /*lua*/ ''
      local wezterm = require("wezterm")
      local act = wezterm.action
      local options = require("options")

      return {
        font = wezterm.font_with_fallback({ "MonoLisa Script", "Symbols Nerd Font Mono" }),
        font_size = options.font_size,
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
        -- front_end = "WebGpu",
        enable_wayland = true,
        window_decorations = "INTEGRATED_BUTTONS|RESIZE",
        initial_cols = 223,
        initial_rows = 52,
        window_background_opacity = options.opacity,
        cell_width = 0.9,
        window_padding = {
          left = options.padding_left,
          right = options.padding_right,
          top = options.padding_top,
          bottom = options.padding_bottom,
        },
        keys = {
          { key = "8", mods = "CTRL", action = act.PaneSelect },
          {
            key = "9",
            mods = "CTRL",
            action = act.PaneSelect({
              alphabet = "1234567890",
            }),
          },
          {
            key = "0",
            mods = "CTRL",
            action = act.PaneSelect({
              mode = "SwapWithActive",
            }),
          },
        },
        inactive_pane_hsb = {
          saturation = 1.0,
          brightness = 1.0,
        },
        default_cursor_style = "SteadyUnderline",
        animation_fps = 1,
        audible_bell = "Disabled",
        ssh_domains = {
          {
            name = "io",
            remote_address = "192.168.1.122",
            username = "matt",
            -- ssh_option = {
            --   identityfile = "~/.ssh/io.pub",
            -- },
          },
        },
      }
    '';
  };
}
