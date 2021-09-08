# This is the nix config for Raspberry pi.

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.raspberryPi = {
    enable = true;
    version = 4;
  };
  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  # Required for the Wireless firmware
  hardware.enableRedistributableFirmware = true;

  networking = {
    hostName = "pi"; # Define your hostname
    wireless = {
      enable = true;
    };
  };

  users = {
    defaultUserShell = pkgs.zsh;
    mutableUsers = false;
    users.matt = {
      isNormalUser = true;
      home = "/home/matt";
      description = "Matt Cook";
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
      openssh.authorizedKeys.keys =
        let keys = import /home/matt/.ssh/keys.nix;
        in [ keys.raspi ];
    };
  };

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";

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
    lazygit
    lf
    mosh
    neovim
    nodejs
    nodePackages.esy
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

  # List services that you want to enable:
  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}