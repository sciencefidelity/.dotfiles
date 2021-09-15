# UltraMinimal NixOS config for Raspberry pi
# Comment lines 10 and 14 to 22 for SD

{ config, pkgs, ... }:

{

  imports =
    [ # the results of the hardware scan, do not change
      <nixos-hardware/raspberry-pi/4>
      ./hardware-configuration.nix
    ];

  boot = {
    kernelPackages = pkgs.linuxPackages_rpi4;
    # tmpOnTmpfs = true;
    kernelParams = [
      "8250.nr_uarts=1"
      "console=ttyAMA0,115200"
      "console=tty1"
    ];
  };

  boot.loader.raspberryPi = {
    enable = true;
    version = 4;
  };
  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  hardware.enableRedistributableFirmware = true;
  nixpkgs.config = {
    allowUnfree = true;
  };

  networking = {
    hostName = "pi";
    wireless = {
      enable = false;
    };
  };

  time.timeZone = "Europe/London";

  networking.useDHCP = false;
  networking.interfaces.eth0.useDHCP = true;
  networking.interfaces.wlan0.useDHCP = true;

  i18n.defaultLocale = "en_GB.UTF-8";
  environment.systemPackages = with pkgs; [
    libraspberrypi
    git
    vim
    raspberrypi-eeprom
    wget
    zsh
  ];

  programs.zsh = {
    enable = true;
  };

  environment.variables = {
    EDITOR = "vim";
  };

  users = {
    defaultUserShell = pkgs.zsh;
    mutableUsers = false;
    users.matt = {
      isNormalUser = true;
      password = "nixos";
      extraGroups = [ "wheel" ];
    };
  };

  services.openssh.enable = true;
  system.stateVersion = "21.11";
}

