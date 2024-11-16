{ lib, ... }:

{
  imports = [ ../../base/config.nix ];

  options = with lib; with types; {
    platform = mkOption { type = strMatching "(darwin|linux)"; };
    hostname = mkOption { type = str; };
    git.key = mkOption { type = str; };
    terminal = {
      app = mkOption { type = strMatching "(alacritty|kitty|wezterm)"; };
      opacity = mkOption { type = number; };
    };
    hypr = {
      borderSize = mkOption { type = number; };
      gapsIn = mkOption { type = number; };
      gapsOut = mkOption { type = number; };
      rounding = mkOption { type = number; };
    };
    maxBrightness = mkOption {
      type = number;
    };
  };
  config = {
    platform = "linux";
    hostname = "rhea";
    git.key = "EDAD41CC";
    terminal = {
      app = "alacritty";
      opacity = 0.8;
    };
    hypr = {
      borderSize = 1;
      gapsIn = 2.5;
      gapsOut = 5;
      rounding = 5;
    };
    maxBrightness = 1388;
  };
}
