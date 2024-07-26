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
    extraModprobeConfig = ''
      options hid_apple fnmode=2
    '';
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

    variables = {
      NIXOS_OZONE_WL = "1";
    };
  };

  fonts = {
    fontconfig.enable = true;
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    facetimehd.enable = true;

    pulseaudio = {
      enable = true;
    };
  };

  networking = {
    hostName = config.hostname;
    enableB43Firmware = true;
    networkmanager.enable = true;
    networkmanager.wifi.backend = "iwd";
    firewall.allowedTCPPorts = [ 22 80 3000 3030 5173 5432 8000 8080 ];
  };

  services = {
    interception-tools = {
      enable = true;
      plugins = with pkgs; [
        interception-tools-plugins.caps2esc
      ];
      udevmonConfig = ''
        - JOB: "${pkgs.interception-tools}/bin/intercept -g $DEVNODE | ${pkgs.interception-tools-plugins.caps2esc}/bin/caps2esc -m 1 | ${pkgs.interception-tools}/bin/uinput -d $DEVNODE"
          DEVICE:
            EVENTS:
              EV_KEY: [KEY_CAPSLOCK, KEY_ESC]
      '';
    };
    logind = {
      lidSwitch = "ignore";
    };

    mbpfan = {
      enable = true;
      settings = {
        general = {
          lowTemp = 61;
          highTemp = 64;
          maxTemp = 84;
        };
      };
    };

    openssh = {
      ports = [ 22 7424 ];
    };
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

