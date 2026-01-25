{ config, pkgs, ... }:

# let
#   domainName = "mattcook.dev";
# in
{
  imports = [
    ./hardware-configuration.nix
    ./config.nix
    ../../base/configuration.nix
    # ../../modules/assets/fonts
    # ../../modules/services/interception-tools
    # ../../modules/services/pipewire
    ../../modules/services/ddns
    # ../../modules/utilities/webcam
    # ../../modules/windowmanager/dwm
    # ../../modules/windowmanager/hyprland
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

  # environment = {
  #   systemPackages = with pkgs; [
  #     brave
  #     firefox
  #     obsidian
  #     obs-studio
  #     zoom-us
  #   ];
  # };

  # fonts = {
  #   fontconfig.enable = true;
  # };

  networking = {
    hostName = config.hostname;
    wireless.enable = false;
    firewall = {
      allowedTCPPorts = [ 22 80 443 6188 6189 8675 ];
    };
  };

  # security.acme = {
  #   acceptTerms = true;
  #   defaults = {
  #     email = "hello@${domainName}";
  #     webroot = "/var/lib/acme/acme-challenge";
  #   };
  #   certs = {
  #     "io.${domainName}" = {
  #       group = config.services.nginx.group;
  #     };
  #   };
  # };

  services = {
    # nginx = {
    #   enable = true;
    #   virtualHosts."io.${domainName}" = {
    #     forceSSL = true;
    #     useACMEHost = "io.${domainName}";
    #     locations."/.well-known".root = "/var/lib/acme/acme-challenge";
    #   };
    # };

    openssh = {
      ports = [ 22 7425 ];
    };
  };
}
