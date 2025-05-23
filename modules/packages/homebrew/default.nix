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
      "brave-browser"
      "discord"
      "firefox"
      "karabiner-elements"
      "obsidian"
      "readwise-ibooks"
      "slack"
      "spotify"
      "wireshark"
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
