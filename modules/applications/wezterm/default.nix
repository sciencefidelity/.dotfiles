{ config, lib, pkgs, ... }:

let
  font_size = toString (config.terminal.fontSize ? 7.5);
  paddingLeft = toString (config.terminal.paddingLeft ? 10);
  paddingRight = toString (config.terminal.paddingRight ? 10);
  paddingTop = toString (config.terminal.paddingTop ? 10);
  paddingBottom = toString (config.terminal.paddingBottom ? 10);
  opacity = toString (config.terminal.opacity ? 1);
in
{
  home.file.options = {
    enable = true;
    target = ".config/wezterm/options.lua";
    text = ''
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
    extraConfig = ''
      ${builtins.readFile ./wezterm.lua}
    '';
  };
}
