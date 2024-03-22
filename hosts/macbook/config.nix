{ config, lib, ... }:

{
  options = with lib; with types; {
    hostname = mkOption { type = str; };
    gh_key = mkOption { type = str; };
    font_size = mkOption { type = numbers.nonnegative; };
    padding_left = mkOption { type = int; };
    padding_right = mkOption { type = int; };
    padding_top = mkOption { type = int; };
    padding_bottom = mkOption { type = int; };
    opacity = mkOption { type = number; };
  };
  config = {
    hostname = "macbook";
    gh_key = "22C1322FB7B3F0B2";
    font_size = 13;
    padding_left = 19;
    padding_right = 19;
    padding_top = 80;
    padding_bottom = 10;
    opacity = 0.9;
  };
}
