{ config, lib, pkgs, ... }:

let
  username = config.username;
  homeDirectory = "/Users/${config.username}";
  stateVersion = "24.05";
in
{
  imports = [
    ../../system/config.nix
    ../../modules/applications/wezterm
    ../../modules/languages/clojure
    ../../modules/languages/elixir
    ../../modules/languages/go
    ../../modules/languages/java
    ../../modules/languages/lua
    ../../modules/languages/nix
    ../../modules/languages/rust
    ../../modules/languages/zig
    ../../modules/programs/eza
    ../../modules/programs/git
    ../../modules/programs/karabiner
    ../../modules/programs/neovim
    ../../modules/programs/zsh
  ];

  home = {
    homeDirectory = homeDirectory;

    packages = with pkgs; [
      fd
      gnupg
      lf
      neofetch
      # nixd
      nixpkgs-fmt
      p7zip
      pinentry_mac
      prettierd
      ripgrep
      # unrar-free
      unzip
    ];

    stateVersion = stateVersion;

    username = username;
  };

  programs = {
    home-manager.enable = true;
  };
}