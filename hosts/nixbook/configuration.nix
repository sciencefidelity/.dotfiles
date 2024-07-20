{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./config.nix
    ../../base/configuration.nix
    ../../modules/assets/fonts
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    # initrd.kernelModules = [ "wl" ];
    # kernelModules = [ "kvm-intel" "wl" ];
    # extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
    tmp.cleanOnBoot = true;
  };

  environment = {
    systemPackages = with pkgs; [
      pciutils
      swww
    ];
  };

  fonts = {
    fontconfig.enable = true;
  };

  # hardware = {
  #   enableAllFirmware = true;
  # };

  networking = {
    hostName = config.hostname;
    enableB43Firmware = true;
    # networkmanager.enable = true;
    # networkmanager.wifi.backend = "iwd";
    wireless.enable = true;
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

  # users = {
  #   users."${config.user}" = {
  #     extraGroups = [ "networkmanager" ];
  #   };
  # };
}

