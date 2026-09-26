{ config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./config.nix
    ../../base/configuration.nix
    ../../modules/services/ddns
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
    nameservers = [ "127.0.0.1" ];
    wireless.enable = false;
    firewall = {
      allowedTCPPorts = [ 8675 ];
    };
  };

  security = {
    pki = {
      certificates = [ (builtins.readFile /etc/nixos/root_ca.crt) ];
    };
  };

  services = {
    openssh = {
      ports = [ 22 ];
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "prohibit-password";
      };
    };
  };
}
