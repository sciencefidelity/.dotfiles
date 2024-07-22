{ config, ... }:

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
    extraConfig = /*lua*/ ''
      ${builtins.readFile ./wezterm.lua}
    '';
  };
}
