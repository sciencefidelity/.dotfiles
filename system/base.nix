{ config, pkgs, ... }:

let
  stateVersion = config.stateVersion;
  rootPassword = config.rootPassword;
  username = config.username;
  password = config.password;
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
    ];

    variables = {
      EDITOR = "vim";
    };
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
    git.enable = true;
    zsh.enable = true;
  };

  services = {
    openssh.enable = true;
  };

  system = {
    stateVersion = stateVersion;
  };

  time = {
    timeZone = "Europe/London";
  };

  users = {
    defaultUserShell = pkgs.zsh;
    mutableUsers = false;
    users.root = {
      hashedPassword = rootPassword;
    };

    users."${username}" = {
      hashedPassword = password;
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };
}
