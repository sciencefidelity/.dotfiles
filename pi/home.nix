{ config, pkgs, ... }:

{
  imports = [
    ./programs/bat.nix
    ./programs/git.nix
    ./programs/gpg.nix
    ./programs/nvim.nix
    ./programs/sh.nix
    ./programs/starship.nix
  ];

  home = {
    username = "matt";
    homeDirectory = "/home/matt";
    stateVersion = "23.11";

    packages = with pkgs; [
      bat
      clang-tools
      delta
      eza
      fd
      gh
      gnupg
      lazygit
      luajit
      lua-language-server
      neovim-unwrapped
      # nixd
      nixpkgs-fmt
      pinentry-curses
      ripgrep
      starship
      stylua
      zsh-autosuggestions
      zsh-syntax-highlighting
    ];

    file = { };

    sessionVariables = {
      EDITOR = "nvim";
      KEYTIMEOUT = "1";
      COLORTERM = "truecolor";
      VISUAL = "$EDITOR";
    };
  };

  programs.home-manager.enable = true;

  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
      enableZshIntegration = true;
      pinentryPackage = pkgs.pinentry-curses;
    };
  };
}
