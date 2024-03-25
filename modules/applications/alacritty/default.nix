{ config, ... }:

let
  catppuccin = import ./catppuccin.nix;
  fontSize = config.terminal.fontSize or 7.5;
  opacity = config.terminal.opacity or 0.9;
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
        size = fontSize;
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
        opacity = opacity;
        decorations = "none";
        padding = {
          x = 10;
          y = 10;
        };
      };
    };
  };
}
