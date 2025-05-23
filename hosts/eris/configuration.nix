{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./config.nix
    ../../modules/services/redis
    ../../base/configuration.nix
  ];

  boot = {
    initrd.systemd.tpm2.enable = false;
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
    kernelParams = [ "8250.nr_uarts=1" "console=ttyAMA0,115200" "console=tty1" ];
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
    firewall.allowedTCPPorts = [ 22 80 3000 3030 5173 5432 6379 8000 8080 ];
  };

  services = {
    openssh = {
      ports = [ 22 7423 ];
    };
  };
}
