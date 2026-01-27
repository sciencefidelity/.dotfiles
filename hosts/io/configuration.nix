{ config, ... }:

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
    nameservers = [ "127.0.0.1" ];
    wireless.enable = false;
    firewall = {
      allowedTCPPorts = [ 22 80 443 6188 6189 8675 ];
    };
  };

  security = {
    pki = {
      certificates = [ (builtins.readFile /etc/nixos/root_ca.crt) ];
    };
  };

  services = {
    openssh = {
      ports = [ 22 7425 ];
    };

    dnsmasq = {
      enable = true;
      settings = {
        server = [ "/augment.aero/192.168.1.125" ];
      };
    };
  };
}
