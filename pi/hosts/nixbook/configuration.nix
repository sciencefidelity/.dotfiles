{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system/base.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernel.sysctl = {
      "vm.swappiness" = 10;
      "vm.vsf_cache_pressure" = 50;
    };
    tmp.cleanOnBoot = true;
    kernalParams = [
      "hid_apple.fnmode= 2"
      "hid_apple.swap_fn_leftctrl=1"
    ];
  };

  environment = {
    systemPackages = with pkgs; [
      hyprland
      kitty
      swww
    ];
  };

  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      inconsolata
    ];
  };

  programs = {
    hyprland.enable = true;
  };
}

