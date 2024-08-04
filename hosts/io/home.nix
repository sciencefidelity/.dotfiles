{ ... }:

{
  imports = [
    ./config.nix
    ../../base/home.nix
    ../../modules/applications/hyprland
    ../../modules/applications/alacritty
    ../../modules/applications/wezterm
  ];
}
