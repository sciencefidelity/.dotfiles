{ config, pkgs, ... }:

let
  root_pass = config.root_pass;
  username = config.username;
  user_pass = config.user_pass;
in
{
  imports = [ ./config.nix ];

  environment = {
    pathsToLink = [ "/share/zsh" ];

    shells = with pkgs; [ zsh ];

    systemPackages = with pkgs; [
      autoconf
      automake
      clang
      coreutils
      curl
      gcc
      git
      gnumake
      htop
      libtool
      tree
      vim
      wget
      zsh
    ];

    variables = {
      EDITOR = "vim";
    };
  };

  hardware = {
    enableRedistributableFirmware = true;
  };

  i18n = {
    defaultLocale = "en_GB.UTF-8";
  };

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  nixpkgs = {
    config = { allowUnfree = true; };
  };

  programs = {
    zsh.enable = true;
  };

  services = {
    openssh.enable = true;
  };

  system = {
    stateVersion = "24.05";
  };

  time = {
    timeZone = "Europe/London";
  };

  users = {
    defaultUserShell = pkgs.zsh;
    mutableUsers = false;
    users.root = {
      hashedPassword = root_pass;
    };

    users."${username}" = {
      hashedPassword = user_pass;
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };
}
