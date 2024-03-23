{ config, ... }:

let
  catppuccin = import ./catppuccin.nix;
  font_size = config.terminal_font_size or 13;
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      inherit (catppuccin) colors;
      cursor = {
        style = {
          shape = "Block";
          blinking = "Never";
        };
        vi_mode_style = {
          shape = "Beam";
          blinking = "Never";
        };
      };
      font = {
        size = font_size;
        normal = {
          family = "MonoLisa Script";
          style = "Regular Italic";
        };
        bold = {
          family = "MonoLisa Script";
          style = "Medium";
        };
        italic = {
          family = "MonoLisa Script";
          style = "Regular Italic";
        };
        bold_italic = {
          family = "MonoLisa Script";
          style = "Medium Italic";
        };
        offset = {
          x = -1;
          y = 1;
        };
        builtin_box_drawing = false;
      };
      window = {
        opacity = 0.9;
        decorations = "none";
        padding = {
          x = 10;
          y = 10;
        };
      };
    };
  };
}