{ config, lib, ... }:

{
  options = with lib; with types; {
    hostname = mkOption { type = str; };
    git.key = mkOption { type = str; };
    terminal = {
      fontSize = mkOption { type = numbers.nonnegative; };
      paddingLeft = mkOption { type = int; };
      paddingRight = mkOption { type = int; };
      paddingTop = mkOption { type = int; };
      paddingBottom = mkOption { type = int; };
      opacity = mkOption { type = number; };
    };
  };
  config = {
    hostname = "macbook";
    git.key = "22C1322FB7B3F0B2";
    terminal = {
      font_size = 13;
      padding_left = 19;
      padding_right = 19;
      padding_top = 80;
      padding_bottom = 10;
      opacity = 0.9;
    }
  };
}
