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
      font_family          Fira Code Regular
      bold_font            Fira Code SemiBold
      italic_font          Fira Code Regular
      bold_italic_font     Fira Code SemiBold
      font_size            ${fontSize}
      adjust_line_height   117%
      adjust_column_width  90%
      window_padding_width 5
      background_opacity   ${opacity}
    '';
  };
}
