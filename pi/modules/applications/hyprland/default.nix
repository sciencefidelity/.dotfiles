{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      ${builtins.readFile ./mocha.conf}
      ${builtins.readFile ./hyprland.conf}
    '';
    systemd.extraCommands = [
      "swww init"
    ];
  };
}
