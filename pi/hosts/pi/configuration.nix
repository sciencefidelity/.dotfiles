{ config, lib, pkgs, ... }:

let
  hostname = "pi";
  user = "matt";
in
{

  imports = [
    ./hardware-configuration.nix
    ../../system/base.nix
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
    systemPackages = with pkgs; [
      libraspberrypi
      raspberrypi-eeprom
    ];
  };

  networking = {
    hostName = config.hostname;
    wireless.enable = false;
  };
}
