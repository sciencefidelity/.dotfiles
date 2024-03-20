{ config, lib, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      kitty
    ];
  };

  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Mocha";
    font = {
      name = "inconsolata";
      package = pkgs.inconsolata;
      size = 9;
    };
    extraConfig = ''
      font_family          MonoLisa Regular
      bold_font            MonoLisa Medium
      italic_font          MonoLisa Regular Italic
      bold_italic_font     MonoLisa Medium Italic
      symbol_map           Symbols Nerd Font Mono
      font_size            8.0
      adjust_line_height   118%
      disable_ligatures    never
      window_padding_width 5
      background_opacity   0.9
    '';
  };
}
