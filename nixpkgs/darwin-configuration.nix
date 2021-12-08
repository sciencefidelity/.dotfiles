{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    zsh
  ];

  services.nix-daemon.enable = true;

  programs.zsh.enable = true;
  system.stateVersion = 4;
}
