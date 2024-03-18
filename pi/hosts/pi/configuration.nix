{ config, lib, pkgs, ... }:

let
  hostname = "pi";
  user = "matt";
in
{

  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
    kernelParams = [ "8250.nr_uarts=1" "console=ttyAMA0,115200" "console=tty1" ];
    kernel.sysctl = {
      "vm.swappiness" = 10;
      "vm.vsf_cache_pressure" = 50;
    };
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };

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
      libraspberrypi
      libtool
      raspberrypi-eeprom
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

  networking = {
    hostName = hostname;
    useDHCP = false;
    wireless.enable = false;
    interfaces = {
      eth0.useDHCP = true;
      wlan0.useDHCP = true;
    };
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
      hashedPassword =
        "$6$7G8if/Rn$wA9X6NWKQ6zsKkz60zowc6tajW78kKwrvu8HX15jJWDgzLrPWcP2nC0b6uY4r10oEMNL/Alor7phV/wWrfbxc.";
    };
    users."${user}" = {
      hashedPassword =
        "$6$IhUfSjtK9Ydj$qnXZYlZ5KD61T4L6bvpaV.5yxTV/7Q8t8WEQCeJ2u40a9PlMZoBGaPCXIBfrAtru8Pu.ZRYm591anUMdKfypH/";
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };
}
