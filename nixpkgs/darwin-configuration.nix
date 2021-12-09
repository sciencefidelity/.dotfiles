{ config, pkgs, ... }:

{
  users.users.matt = {
    home = "Users/matt";
    description = "Matt Cook";
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    bat
    delta
    emacs
    fzf
    gh
    git
    home-manager
    htop
    lf
    neovim
    ripgrep
    starship
    wget
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];
  environment.shells = [ pkgs.zsh ];

  system.defaults.dock.autohide = true;
  system.defaults.dock.launchanim = false;
  system.defaults.dock.mineffect = "scale";
  system.defaults.dock.orientation = "bottom";
  system.defaults.dock.show-process-indicators = true;
  system.defaults.dock.show-recents = false;
  system.defaults.dock.tilesize = 64;

  services.nix-daemon.enable = true;
  programs.zsh.enable = true;
  system.stateVersion = 4;
}
