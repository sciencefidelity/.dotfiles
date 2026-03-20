{ ... }:

{
  homebrew = {
    enable = true;
    prefix = "/opt/homebrew";
    global = {
      brewfile = true;
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
      "brave-browser"
      "discord"
      "firefox"
      "icon-composer"
      "karabiner-elements"
      "obsidian"
      "readwise-ibooks"
      "slack"
      "spotify"
      "wezterm"
      "zoom"
    ];

    masApps = {
      "AdBlock for Safari" = 1402042596;
      "Craft - Docs and Notes Editor" = 1487937127;
      "iA Writer" = 775737590;
      "Refined GitHub" = 1519867270;
      "Save to Raindrop.io" = 1549370672;
      "Save to Reader" = 1640236961;
      "Ulysses | Writing App" = 1225570693;
    };
  };
}
