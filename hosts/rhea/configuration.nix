{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./config.nix
    ../../base/configuration.nix
    ../../modules/assets/fonts
    ../../modules/scripts/bl
    ../../modules/services/interception-tools
    ../../modules/windowmanager/hyprland
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

    facetimehd.enable = true;

    # pulseaudio = {
    #   enable = true;
    # };
  };

  networking = {
    hostName = config.hostname;
    enableB43Firmware = true;
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
    firewall.allowedTCPPorts = [ 22 80 3000 3030 5173 5432 8000 8080 ];
  };

  services = {
    # Keeps machine running with the lid closed (screen will always be on).
    # logind = {
    #   lidSwitch = "ignore";
    # };

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
}

