# nix config for Raspberry pi

{ config, pkgs, lib, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{

  imports =
    [ # the results of the hardware scan, do not change
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
    ];

  boot.loader.raspberryPi = {
    enable = true;
    version = 4;
  };
  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  hardware.enableRedistributableFirmware = true;

  networking = {
    hostName = "pi";
    wireless = {
      enable = false;
    };
  };

  users = {
    defaultUserShell = pkgs.zsh;
    mutableUsers = false;
    users.matt = {
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # enable ‘sudo’ for the user
      initialPassword = "nixos";
      # openssh.authorizedKeys.keys =
      #   let keys = import /home/matt/.ssh/keys.nix;
      #   in [ keys.nixos ];
    };
  };

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";

  home-manager.users.matt = {
    programs.git = {
      enable = true;
      userName = "sciencefidelity";
      userEmail = "32623301+sciencefidelity@users.noreply.github.com";

      signing = {
        key = "9F071448877E6705";
        signByDefault = true;
      };

      aliases = {
        co = "checkout";
        ci = "commit";
        st = "status";
        br = "branch";
        hist = "log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short";
        type = "cat-file -t";
        dump = "cat-file -p";
      };
    };

    programs.htop = {
      enable = true;
    };
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = false;
    autosuggestions.enable = true;
    # dotDir = ".config/zsh";
    shellAliases = {
      sysrs = "sudo nixos-rebuild switch";
      sysup = "sudo nixos-rebuild switch --upgrade";
      sysclean = "sudo nix-collect-garbage -d; and sudo nix-store --optimise";
      ls="exa -F --group-directories-first";
      l="exa -aF --group-directories-first";
      la="exa -laF --group-directories-first --git --git-ignore";
      ll="exa -lF --group-directories-first --git --git-ignore";
      lt="exa -T --git-ignore";
      lr="exa -R --git-ignore";
      df="df -kTh";
      free="free -h";
      du="du -h -c";
      cat = "bat -p";
      grep="rg";
      fd="fdfind";
    };

#     profileExtra = ''
#       if [[ "$TERM" == "xterm-256color" && "$(uname)" == "Linux" ]]; then
#         export TERM=xterm-24bits
#       fi
#
#       autoloag -U compinit
#       zstyle ":completeion:*" menu select
#       zmodload zsh/complist
#       compinit
#       _comp_options+=(globdots)
#     '';
  };

  environment.systemPackages = with pkgs; [
    abduco
    bat
    cabal-install
    deno
    dart
    elmPackages.create-elm-app
    elmPackages.elm
    elmPackages.elm-analyse
    elmPackages.elm-format
    elmPackages.elm-language-server
    elmPackages.elm-live
    elmPackages.elm-review
    elmPackages.elm-test
    emacs
    exa
    fd
    fzf
    libraspberrypi
    lua
    luajit
    luarocks
    ghc
    git
    go
    gopls
    htop
    home-manager
    lazygit
    lf
    mosh
    neovim
    nodejs
    nodePackages.gatsby-cli
    nodePackages.svelte-language-server
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.vue-cli
    nodePackages.vue-language-server
    nodePackages.yarn
    ocamlPackages.js_of_ocaml
    ocamlPackages.js_of_ocaml-ppx
    ocamlPackages.js_of_ocaml-lwt
    raspberrypi-eeprom
    ripgrep
    samba
    sumneko-lua-language-server
    tmux
    wget
    zsh
  ];

  environment.variables = {
    EDITOR = "nvim";
  };

  services.openssh.enable = true;

  system.stateVersion = "21.11";

}

