{ config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./config.nix
    ../../base/configuration.nix
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
    firewall.allowedTCPPorts = [ 22 80 3000 5173 8000 8080 3030 ];
  };

  services = {
    openssh = {
      ports = [ 22 7422 ];
    };
  };
}

