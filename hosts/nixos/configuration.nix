{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./config.nix
    ../../base/configuration.nix
    ../../modules/services/postgresql
    ../../modules/services/redis
    ../../modules/virtualization/docker
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernel = {
      sysctl = {
        "vm.overcommit_memory" = 1;
      };
    };
  };

  networking = {
    hostName = config.hostname;
    wireless.enable = false;
  };
}

