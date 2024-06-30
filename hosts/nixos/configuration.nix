{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./config.nix
    ../../base/configuration.nix
    ../../modules/services/postgresql
    ../../modules/services/redis
    ../../modules/services/kubernetes
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

  # nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];
  # environment.systemPackages = [
  #   pkgs.rust-bin.selectLatestNightlyWith
  #   (toolchain: toolchain.default.override {
  #     extensions = [ "rust-src" ];
  #   })
  # ];

  networking = {
    hostName = config.hostname;
    wireless.enable = false;
  };
}

