{ lib, ... }:

{
  imports = [ ../../base/config.nix ];

  options = with lib; with types; {
    platform = mkOption { type = strMatching "(darwin|linux)"; };
    hostname = mkOption { type = str; };
    git.key = mkOption { type = str; };
    terminal = {
      fontSize = mkOption { type = number; };
      paddingLeft = mkOption { type = int; };
      paddingRight = mkOption { type = int; };
      paddingTop = mkOption { type = int; };
      paddingBottom = mkOption { type = int; };
      opacity = mkOption { type = number; };
    };
  };
  config = {
    platform = "darwin";
    hostname = "ceres";
    git.key = "8EB15C0F";
    terminal = {
      fontSize = 13;
      paddingLeft = 19;
      paddingRight = 19;
      paddingTop = 80;
      paddingBottom = 10;
      opacity = 0.9;
    };
  };
}
