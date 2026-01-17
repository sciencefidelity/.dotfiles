{ config, pkgs, ... }:

let
  hostname = config.hostname;
  username = config.username;
  description = config.description;
  homeDirectory = "/Users/${username}";
  stateVersion = 5;
in
{
  imports = [
    ./config.nix
    ../../base/config.nix
    ../../modules/assets/fonts
    ../../modules/packages/homebrew
    ../../modules/services/skhd
    ../../modules/services/yabai
  ];
  environment = {
    shells = [ pkgs.zsh ];

    systemPackages = with pkgs; [
      coreutils
      curl
      wget
    ];
  };

  homebrew = {
    casks = [
      "android-studio"
      "linear-linear"
      "postman"
    ];
    # masApps = {
    #   "Xcode" = 497799835;
    # };
  };

  networking = {
    hostName = hostname;
  };

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  nixpkgs = {
    config.android_sdk.accept_license = true;
    config.allowUnfree = true;
  };

  programs = {
    zsh = {
      enable = true;
    };
  };

  system = {
    defaults = {
      NSGlobalDomain = {
        "com.apple.springing.delay" = 0.5;
        "com.apple.trackpad.scaling" = 1.5;
        "com.apple.keyboard.fnState" = false;
      };

      dock = {
        autohide = true;
        autohide-delay = 0.1;
        autohide-time-modifier = 0.1;
        magnification = false;
        mouse-over-hilite-stack = false;
        mineffect = "scale";
        mru-spaces = false;
        orientation = "bottom";
        persistent-others = [ "/Users/matt/Downloads/" ];
        show-process-indicators = true;
        show-recents = false;
        showhidden = false;
        tilesize = 46;
        wvous-bl-corner = 1;
        wvous-br-corner = 1;
        wvous-tl-corner = 5;
        wvous-tr-corner = 1;
      };

      finder = {
        AppleShowAllExtensions = true;
        CreateDesktop = false;
        FXPreferredViewStyle = "Nlsv";
        QuitMenuItem = true;
        ShowPathbar = true;
        ShowStatusBar = true;
      };

      loginwindow = {
        GuestEnabled = false;
      };

      menuExtraClock = {
        Show24Hour = true;
      };

      screensaver = {
        askForPassword = true;
      };

      trackpad = {
        ActuationStrength = 0;
        FirstClickThreshold = 0;
        SecondClickThreshold = 0;
        TrackpadRightClick = true;
      };

      WindowManager = {
        EnableStandardClickToShowDesktop = false;
      };
    };


    activationScripts.keyboard.text = ''
      hidutil property --set '{"CapsLockDelayOverride":0}'
    '';

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };

    primaryUser = config.username;

    startup.chime = false;

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
