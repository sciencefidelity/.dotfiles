{ config, ... }:

let
  username = config.username;
  homeDirectory = "/home/${username}";
  stateVersion = config.stateVersion;
in
{
  imports = [
    ./config.nix
    ../../base/home.nix
    ../../modules/applications/hyprland
    ../../modules/applications/wezterm
    ../../modules/programs/direnv
  ];

  home = {
    username = username;
    homeDirectory = homeDirectory;
    stateVersion = stateVersion;
  };
}
