{ config, lib, ... }:

{
  options = with lib; with types; {
    hostname = mkOption { type = str; };
    gh_key = mkOption { type = str; };
    terminal = mkOption { type = strMatching "(alacritty|kitty|wezterm)"; };
    terminal_font_size = mkOption { type = numbers.nonnegative; };
  };
  config = {
    hostname = "nixbook";
    gh_key = "0x4C752BECEDAD41CC";
    terminal = "wezterm";
    terminal_font_size = 7.5;
  };
}
