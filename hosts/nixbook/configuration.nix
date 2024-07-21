{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./config.nix
    ../../base/configuration.nix
    ../../modules/assets/fonts
    ../../modules/scripts/bl
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    tmp.cleanOnBoot = true;
  };

  environment = {
    systemPackages = with pkgs; [
      alsa-firmware
      alsa-utils
      brave
      firefox
      obsidian
      pciutils
      swww
      wofi
    ];
  };

  fonts = {
    fontconfig.enable = true;
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    pulseaudio = {
      enable = true;
    };
  };

  networking = {
    hostName = config.hostname;
    enableB43Firmware = true;
    networkmanager.enable = true;
    networkmanager.wifi.backend = "iwd";
  };

  powerManagement = {
    enable = true;
  };

  programs = {
    hyprland.enable = true;

    zsh = {
      enable = true;
      shellInit = /*bash*/ ''
        eval "$(ssh-agent -s)" > /dev/null
        ssh-add ~/.ssh/github 2> /dev/null
        export GPG_TTY=$(tty)
      '';
    };
  };
}

