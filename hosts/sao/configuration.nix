{ config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./config.nix
    ../../base/configuration.nix
    ../../modules/services/ca
    ../../modules/services/dns
    # ../../modules/services/sqlite
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
    firewall.allowedTCPPorts = [ 5432 ];
  };

  services = {
    openssh = {
      ports = [ 22 7422 ];
    };
  };
}
