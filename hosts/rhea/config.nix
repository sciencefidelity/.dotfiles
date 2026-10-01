{ lib, ... }:

{
  imports = [ ../../base/config.nix ];

  options = with lib; with types; {
    hostname = mkOption { type = str; };
    git.key = mkOption { type = str; };
    terminal = {
      opacity = mkOption { type = number; };
      fontSize = mkOption { type = number; };
      paddingTop = mkOption { type = number; };
      paddingRight = mkOption { type = number; };
      paddingBottom = mkOption { type = number; };
      paddingLeft = mkOption { type = number; };
    };
    maxBrightness = mkOption {
      type = number;
    };
  };
  config = {
    hostname = "rhea";
    git.key = "EDAD41CC";
    terminal = {
      opacity = 0.9;
      fontSize = 9.5;
      paddingTop = 15;
      paddingRight = 20;
      paddingBottom = 15;
      paddingLeft = 20;
    };
    maxBrightness = 1388;
  };
}
