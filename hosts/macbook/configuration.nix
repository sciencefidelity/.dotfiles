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
    # shells = with pkgs; [ pkgs.zsh ];

    systemPackages = with pkgs; [
      coreutils
      curl
      git
      wget
      zsh
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
    zsh = {
      enable = true;
    };
  };

  services = {
    nix-daemon.enable = true;

    skhd = {
      enable = true;
      skhdConfig = ''
        alt - j : yabai -m window --focus south
        alt - k : yabai -m window --focus north
        alt - h : yabai -m window --focus west
        alt - j : yabai -m window --focus east
        alt - s : yabai -m display --focus west
        alt - g : yabai -m display --focus east
        shift + alt - r : yabai -m space --rotate 270
        shift + alt - y : yabai -m space --mirror y-axis
        shift + alt - x : yabai -m space --mirror x-axis
        shift + alt - t : yabai -m window --toggle float --grid 4:4:1:1:2:2
        shift + alt - m : yabai -m window --toggle zoom-fullscreen
        shift + alt - e : yabai -m space --balance
        shift + alt - j : yabai -m window --swap south
        shift + alt - k : yabai -m window --swap north
        shift + alt - h : yabai -m window --swap west
        shift + alt - j : yabai -m window --swap east
        ctrl + alt - j : yabai -m window --warp south
        ctrl + alt - k : yabai -m window --warp north
        ctrl + alt - h : yabai -m window --warp west
        ctrl + alt - j : yabai -m window --warp east
        shift + alt - s : yabai -m window --display west; yabai -m display --focus west
        shift + alt - g : yabai -m window --display east; yabai -m display --focus east
        shift + alt - p : yabai -m window --space prev
        shift + alt - j : yabai -m window --space next
        shift + alt - 1 : yabai -m window --space 1
        shift + alt - 2 : yabai -m window --space 2
        shift + alt - 3 : yabai -m window --space 3
        shift + alt - 4 : yabai -m window --space 4
        shift + alt - 5 : yabai -m window --space 5
        shift + alt - 6 : yabai -m window --space 6
        shift + alt - 7 : yabai -m window --space 7
        ctrl + alt - q : brew services stop yabai
        ctrl + alt - s : brew services start yabai
      '';
    };

    yabai = {
      enable = true;
      config = {
        layout              = "bsp";
        focus_follows_mouse = "autoraise";
        mouse_follows_focus = "off";
        window_placement    = "second_child";
        window_opacity      = "off";
        top_padding         = 7;
        bottom_padding      = 7;
        left_padding        = 7;
        right_padding       = 7;
        window_gap          = 7;
        mouse_modifier      = "alt";
        mouse_action1       = "move";
        mouse_action2       = "resize";
        mouse_drop_action   = "swap";
      };
      extraConfig = ''
        yabai -m rule --add app="^System Settings$" manage=off
        yabai -m rule --add app="^Calculator$" manage=off
        yabai -m rule --add app="^Karabiner-Elements$" manage=off
      '';
    };
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
