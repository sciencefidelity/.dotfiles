{ config, lib, pkgs, ... }:

let
  hostname = "macbook";
  username = "matt";
  description = "Matt Cook";
  homeDirectory = "/Users/${username}";
  stateVersion = 4;
in
{
  environment = {
    shells = with pkgs; [ pkgs.zsh ];

    systemPackages = with pkgs; [
      coreutils
      curl
      git
      wget
      zsh
    ];
  };

  homebrew = {
    enable = true;
    brewPrefix = "/opt/homebrew/bin";
    global = {
      brewfile = true;
      lockfiles = true;
    };
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };

    taps = [
      "homebrew/bundle"
      "homebrew/services"
      "homebrew/cask-versions"
    ];

    casks = [
      "affinity-designer"
      "affinity-photo"
      "affinity-publisher"
      "appcleaner"
      "balenaetcher"
      "bartender"
      "brave-browser"
      "discord"
      "displaycal"
      "figma"
      "firefox"
      "flutter"
      "hammerspoon"
      "insomnia"
      "iterm2-nightly"
      "karabiner-elements"
      "microsoft-edge"
      "microsoft-teams"
      "miro"
      "notion"
      "nova"
      "obsidian"
      "reader"
      "redisinsight"
      "safari-technology-preview"
      "sigmaos"
      "slack"
      "spotify"
      "zoom"
      "warp"
      "wezterm"
      "visual-studio-code"
    ];

    masApps = {
      "Compressor" = 424390742;
      "Craft - Docs and Notes Editor" = 1487937127;
      "Drafts" = 1435957248;
      "Final Cut Pro" = 424389933;
      "iA Writer" = 775737590;
      "Logic Pro" = 634148309;
      "Microsoft Excel" = 462058435;
      "Microsoft PowerPoint" = 462062816;
      "Microsoft Word" = 462054704;
      "Motion" = 434290957;
      "OneDrive" = 823766827;
      "Refined GitHub" = 1519867270;
      "Save to Raindrop.io" = 1549370672;
      "Save to Reader" = 1640236961;
      "Ulysses | Writing App" = 1225570693;
      "Xcode" = 497799835;
    };
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
    zsh.enable = true;
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
