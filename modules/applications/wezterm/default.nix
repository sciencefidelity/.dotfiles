{ config, lib, pkgs, ... }:

let
  font_size = toString (config.font_size or 7.5);
  padding_left = toString (config.padding_left or 10);
  padding_right = toString (config.padding_right or 10);
  padding_top = toString (config.padding_top or 10);
  padding_bottom = toString (config.padding_bottom or 10);
  opacity = toString (config.opacity or 1);
in
{
  home.file.options = {
    enable = true;
    target = ".config/wezterm/options.lua";
    text = ''
      local options = {
        font_size = ${font_size},
        padding_left = ${padding_left},
        padding_right = ${padding_right},
        padding_top = ${padding_top},
        padding_bottom = ${padding_bottom},
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
