{ config, pkgs, ... }:

{
  users.users.matt = {
    home = "Users/matt";
    description = "Matt Cook";
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    bat
    delta
    emacs
    fzf
    gh
    git
    home-manager
    htop
    lf
    neovim
    ripgrep
    starship
    wget
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];
  environment.shells = [ pkgs.zsh ];

  homebrew = {
    enable = true;
    autoUpdate = false;
    global = {
      brewfile = true;
      noLock = true;
    };

    taps = [
      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/cask-versions"
      "homebrew/core"
      "homebrew/services"
      "buo/cask-upgrade"
      "dart-lang/dart"
      "sass/sass"
    ];

    casks = [
      "android-studio"
      "bartender"
      "brave-browser"
      "dash"
      "figma"
      "firefox"
      "hammerspoon"
      "insomnia"
      "karabiner-elements"
      "kitty"
      "miro"
      "notion"
      "nova"
      "rocket"
      "slack"
      "spotify"
    ];

    masApps = {
      "Affinity Designer" = 824171161;
      "Affinity Photo" = 824183456;
      "Affinity Publisher" = 881418622;
      "Compressor" = 424390742;
      "Final Cut Pro" = 424389933;
      "iA Writer" = 775737590;
      "Logic Pro" = 634148309;
      "Microsoft Excel" = 462058435;
      "Microsoft PowerPoint" = 462062816;
      "Microsoft Word" = 462054704;
      "Motion" = 434290957;
      "OneDrive" = 823766827;
      "Pocket" = 568494494;
      "Refined GitHub" = 1519867270;
      "Save to Raindrop.io" = 1549370672;
      "Slack for Desktop" = 803453959;
      "Vimari" = 1480933944;
      "Xcode" = 497799835;
    };
  };

  system.defaults.dock.autohide = true;
  system.defaults.dock.launchanim = false;
  system.defaults.dock.mineffect = "scale";
  system.defaults.dock.orientation = "bottom";
  system.defaults.dock.show-process-indicators = true;
  system.defaults.dock.show-recents = false;
  system.defaults.dock.tilesize = 64;

  services.nix-daemon.enable = true;
  programs.zsh.enable = true;
  system.stateVersion = 4;
}
