{ config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system/base.nix
  ];

  boot = {
    kernel.sysctl = {
      "vm.swappiness" = 10;
      "vm.vsf_cache_pressure" = 50;
    };
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = config.hostname;
    wireless.enable = false;
  };
}

