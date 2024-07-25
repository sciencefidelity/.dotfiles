{ lib, ... }:

{
  imports = [ ../../base/config.nix ];

  options = with lib; with types; {
    platform = mkOption { type = strMatching "(darwin|linux)"; };
    hostname = mkOption { type = str; };
    git.key = mkOption { type = str; };
    terminal = mkOption { type = strMatching "(alacritty|kitty|wezterm)"; };
    opacity = mkOption { type = number; };
    maxBrightness = mkOption { type = number; };
  };
  config = {
    platform = "linux";
    hostname = "nixbook";
    git.key = "0x4C752BECEDAD41CC";
    terminal = "alacritty";
    opacity = 0.8;
    maxBrightness = 1388;
  };
}
