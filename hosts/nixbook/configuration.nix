{ config, lib, pkgs, ... }:

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
    # initrd.kernelModules = [ "wl" ];
    # kernelModules = [ "kvm-intel" "wl" ];
    # extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
    kernel.sysctl = {
      "vm.swappiness" = 10;
      "vm.vsf_cache_pressure" = 50;
    };
    tmp.cleanOnBoot = true;
    kernelParams = [
      "hid_apple.fnmode=2"
      "hid_apple.swap_fn_leftctrl=1"
    ];
  };

  environment = {
    systemPackages = with pkgs; [
      alacritty
      hyprland
      kitty
      pciutils
      swww
      wezterm
    ];
  };

  fonts = {
    fontconfig.enable = true;
    packages = with pkgs; [
      (stdenv.mkDerivation {
        name = "monolisa";
        src = fetchGit {
          url = "git@github.com:sciencefidelity/fonts.git";
          ref = "main";
          rev = "48eecf2ef0e3b97897480995f90b14b796f8799b";
        };
        installPhase = ''
          mkdir -p $out/share/fonts/truetype
          cp -a $src/monolisa-script/*.ttf $out/share/fonts/truetype
        '';
      })
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
  };

  # hardware = {
  #   enableAllFirmware = true;
  # };

  networking = {
    hostName = config.hostname;
    enableB43Firmware = true;
    # networkmanager.enable = true;
    # networkmanager.wifi.backend = "iwd";
    wireless.enable = true;
  };

  powerManagement = {
    enable = true;
  };

  programs = {
    hyprland.enable = true;

    zsh = {
      enable = true;
      shellInit = ''
        eval "$(ssh-agent -s)" > /dev/null
        ssh-add ~/.ssh/github 2> /dev/null
        export GPG_TTY=$(tty)
      '';
    };
  };

  # users = {
  #   users."${config.user}" = {
  #     extraGroups = [ "networkmanager" ];
  #   };
  # };
}

