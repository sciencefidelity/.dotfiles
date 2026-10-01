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
    wireless.enable = false;
    useDHCP = false;
    interfaces.enp7s0.useDHCP = true;

    firewall = {
      allowedTCPPorts = [ 8675 ];
    };
  };

  # TODO: When we refactor this remember that when we do it this way a rebuild requires
  # the `--impure` flag. Maybe there's a better way.
  # security = {
  #   pki = {
  #     certificates = [ (builtins.readFile /etc/nixos/root_ca.crt) ];
  #   };
  # };

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
