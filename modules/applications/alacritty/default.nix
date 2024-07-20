{ config, ... }:

let
  catppuccin = import ./catppuccin.nix;
  # fontSize = config.terminal.fontSize or 7.5;
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
        size = 8;
        normal = {
          family = "Fira Code";
          style = "Light";
        };
        bold = {
          family = "Fira Code";
          style = "Medium";
        };
        italic = {
          family = "Fira Code";
          style = "Light";
        };
        bold_italic = {
          family = "Fira Code";
          style = "Medium";
        };
        # normal = {
        #   family = "MonoLisa Script";
        #   style = "Regular Italic";
        # };
        # bold = {
        #   family = "MonoLisa Script";
        #   style = "Medium";
        # };
        # italic = {
        #   family = "MonoLisa Script";
        #   style = "Regular Italic";
        # };
        # bold_italic = {
        #   family = "MonoLisa Script";
        #   style = "Medium Italic";
        # };
        offset = {
          x = 0;
          y = 3;
        };
        builtin_box_drawing = false;
      };
      window = {
        opacity = opacity;
        decorations = "none";
        padding = {
          x = 7;
          y = 7;
        };
      };
    };
  };
}
