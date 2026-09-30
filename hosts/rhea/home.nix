{ config, pkgs, ... }:

let
  username = config.username;
  homeDirectory = "/home/${username}";
  stateVersion = config.stateVersion;
in
{
  imports = [
    ./config.nix
    ../../base/home.nix
    ../../modules/applications/wezterm
  ];

  home = {
    inherit username homeDirectory stateVersion;

    packages = with pkgs; [
      adwaita-icon-theme
    ];
  };


  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";

    systemd.enable = true;

    extraConfig = builtins.readFile ./hyprland.lua;
  };
}
