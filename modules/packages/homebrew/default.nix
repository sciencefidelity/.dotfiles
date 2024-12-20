{ ... }:

{
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
    ];

    casks = [
      # "affinity-publisher@1"
      "brave-browser"
      "discord"
      "firefox"
      "karabiner-elements"
      "obsidian"
      "readwise-ibooks"
      "slack"
      "spotify"
      # "visual-studio-code"
      "wezterm"
      "zoom"
    ];

    masApps = {
      "AdBlock for Safari" = 1402042596;
      "Craft - Docs and Notes Editor" = 1487937127;
      "iA Writer" = 775737590;
      # "Microsoft Excel" = 462058435;
      # "Microsoft PowerPoint" = 462062816;
      # "Microsoft Word" = 462054704;
      "Refined GitHub" = 1519867270;
      "Save to Raindrop.io" = 1549370672;
      "Save to Reader" = 1640236961;
      "Ulysses | Writing App" = 1225570693;
      "Xcode" = 497799835;
    };
  };
}
