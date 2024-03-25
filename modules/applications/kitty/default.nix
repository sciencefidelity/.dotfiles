{ config, lib, pkgs, ... }:

let
  fontSize = (toString config.terminal.fontSize or 7.5);
  opacity = (toString config.terminal.opacity or 1);
in
{
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Mocha";
    extraConfig = ''
      font_family          MonoLisa Script Regular
      bold_font            MonoLisa Script Medium
      italic_font          MonoLisa Script Regular Italic
      bold_italic_font     MonoLisa Script Medium Italic
      font_size            ${fontSize}
      adjust_line_height   117%
      adjust_column_width  90%
      window_padding_width 5
      background_opacity   ${opacity}
    '';
  };
}
