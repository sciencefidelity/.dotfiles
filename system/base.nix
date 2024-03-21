{ config, pkgs, ... }:

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
      hashedPassword = config.root_pass;
    };

    users."${config.user}" = {
      hashedPassword = config.user_pass;
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };
}
