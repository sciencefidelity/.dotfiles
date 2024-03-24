{ config, ... }:

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
  };

  networking = {
    hostName = config.hostname;
    wireless.enable = false;
  };
}

