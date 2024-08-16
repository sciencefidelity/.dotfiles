{ config, pkgs, ... }:

let
  hostname = config.hostname;
  username = config.username;
  description = config.description;
  homeDirectory = "/Users/${username}";
  stateVersion = 4;
in
{
  imports = [
    ./config.nix
    ../../base/config.nix
    ../../modules/applications/iterm
    ../../modules/assets/fonts
    ../../modules/packages/homebrew
    ../../modules/services/skhd
    ../../modules/services/yabai
  ];
  environment = {
    shells = [ pkgs.zsh ];

    systemPackages = with pkgs; [
      coreutils
      curl
      git
      wget
    ];
  };

  networking = {
    hostName = hostname;
  };

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    useDaemon = true;
  };

  nixpkgs = {
    config.allowUnfree = true;
  };

  programs = {
    zsh = {
      enable = true;
    };
  };

  services = {
    nix-daemon.enable = true;
  };

  system = {
    defaults.dock = {
      autohide-delay = 0.1;
      autohide-time-modifier = 0.1;
    };

    activationScripts.keyboard.text = ''
      hidutil property --set '{"CapsLockDelayOverride":0}'
    '';

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };

    stateVersion = stateVersion;
  };

  users = {
    users."${username}" = {
      name = username;
      description = description;
      home = homeDirectory;
      shell = pkgs.zsh;
    };
  };
}
