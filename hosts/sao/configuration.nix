{ config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./config.nix
    ../../base/configuration.nix
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
    firewall.allowedTCPPorts = [ 22 80 3000 3030 5173 5432 8000 8080 ];
  };

  services = {
    openssh = {
      ports = [ 22 7422 ];
    };
  };
}

