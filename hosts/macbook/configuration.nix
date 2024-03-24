{ config, pkgs, ... }:

let
  hostname = config.hostname;
  username = config.username;
  description = config.description;
  homeDirectory = "/Users/${username}";
  stateVersion = 4;
in
{
  imports = [
    ../../system/config.nix
    ../../modules/packages/homebrew
    ../../modules/services/karabiner
    ../../modules/services/skhd
    ../../modules/services/yabai
  ];
  environment = {
    shells = with pkgs; [ pkgs.zsh ];

    systemPackages = with pkgs; [
      coreutils
      curl
      git
      wget
    ];
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      (stdenv.mkDerivation {
        name = "monolisa";
        src = fetchGit {
          url = "git@github.com:sciencefidelity/fonts.git";
          ref = "main";
          rev = "4a073ee4f2919c891fc3bb4f4d237aab9c2d419b";
        };
        installPhase = ''
          mkdir -p $out/share/fonts/truetype
          cp -a $src/monolisa-script/*.ttf $out/share/fonts/truetype
        '';
      })
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
  };

  networking = {
    hostName = hostname;
  };

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    useDaemon = true;
  };

  nixpkgs = {
    config.allowUnfree = true;
  };

  programs = {
    zsh = {
      enable = true;
    };
  };

  services = {
    nix-daemon.enable = true;
  };

  system = {
    defaults.dock = {
      autohide-delay = 0.1;
      autohide-time-modifier = 0.1;
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };

    stateVersion = stateVersion;
  };

  users = {
    users."${username}" = {
      name = username;
      description = description;
      home = homeDirectory;
      shell = pkgs.zsh;
    };
  };
}
