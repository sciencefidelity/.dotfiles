{ config, lib, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      kitty
    ];
  };

  programs.kitty = {
    enable = true;
    theme = "Catppuccin Mocha";
  };
}
