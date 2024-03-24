{ config, lib, ... }:

{
  options = with lib; with types; {
    hostname = mkOption { type = str; };
    git.key = mkOption { type = str; };
    terminal = mkOption { type = strMatching "(alacritty|kitty|wezterm)"; };
    opacity = mkOption { type = number; };
  };
  config = {
    hostname = "nixbook";
    git.key = "0x4C752BECEDAD41CC";
    terminal = "wezterm";
    opacity = 0.9;
  };
}
