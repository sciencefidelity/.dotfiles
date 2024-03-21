{ config, lib, pkgs, ... }:

let
  font_size = config.terminal_font_size or 13;
in
{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local font_size = ${toString font_size};
      ${builtins.readFile ./wezterm.lua}
    '';
  };
}
