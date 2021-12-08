{ config, pkgs, ... }:

{
  users.users.matt = {
    home = "Users/matt";
    description = "Matt Cook";
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    zsh
  ];
  environment.shells = [ pkgs.zsh ];

  programs.nix-index.enable = true;

  system.defaults.dock.autohide = true;
  system.defaults.dock.launchanim = false;
  system.defaults.dock.mineffect = "scale";
  system.defaults.dock.orientation = "bottom";
  system.defaults.dock.show-process-indicators = true;
  system.defaults.dock.show-recents = false;
  system.defaults.dock.tilesize = 64;

  services.nix-daemon.enable = false;
  nix.useDaemon = false;
  programs.zsh.enable = true;
  system.stateVersion = 4;
}
