{ pkgs, ... }:

let
  home-manager = builtins.fetchTarball
    "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz";
  # link = config.lib.file.mkOutOfStoreSymlink;
  pkgsUnstable = import <nixpkgs-unstable> { };
in
{
  imports = [ <home-manager/nix-darwin> ];

  environment = {
    # shells = [ pkgs.zsh ];
    systemPackages = with pkgs; [
      air
      arrayfire
      pkgsUnstable.babashka
      bat
      pkgsUnstable.bun
      pkgsUnstable.cargo-shuttle
      pkgsUnstable.clang-tools
      pkgsUnstable.clojure
      cocoapods
      coreutils
      ctags
      curl
      delta
      # pkgsUnstable.deno
      duf
      emacs29-nox
      pkgsUnstable.elixir_1_15
      pkgsUnstable.elixir-ls
      pkgsUnstable.erlang_26
      eza
      fd
      pkgsUnstable.flyctl
      fswatch
      fzf
      gh
      git
      gnupg
      # pkgsUnstable.go
      pkgsUnstable.gopls
      home-manager
      # pkgsUnstable.python311Packages.jupyterlab
      imagemagick
      lazygit
      lf
      mkcert
      moreutils
      mosh
      neovim-unwrapped
      nil
      nixpkgs-fmt
      pkgsUnstable.nodejs_20
      nodePackages.degit
      pkgsUnstable.nodePackages.pnpm
      nodePackages.wrangler
      nodePackages.yalc
      nodePackages.yarn
      pkgsUnstable.openai
      pango
      pinentry
      pkg-config
      pv
      # python311Full
      # pkgsUnstable.python311Packages.pip
      unrar
      pkgsUnstable.railway
      ripgrep
      pkgsUnstable.rust-script
      pkgsUnstable.rustup
      pscale
      starship
      tree
      pkgsUnstable.vimPlugins.lazy-nvim
      pkgsUnstable.wasm-pack
      pkgsUnstable.wasmer
      pkgsUnstable.wasmtime
      wget
      pkgsUnstable.worker-build
      zsh
      zsh-autosuggestions
      zsh-syntax-highlighting
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
      "auth0/auth0-cli"
      "dart-lang/dart"
      "fastly/tap"
      "homebrew/bundle"
      "homebrew/services"
      "homebrew/cask-versions"
      "tinygo-org/tools"
    ];

    brews = [ "auth0" "binaryen" "deno" "fastly" "gcc" "go" "java" "leiningen" "mongosh" "nss" "python" "tinygo" "vapor" ];

    casks = [
      "affinity-designer"
      "affinity-photo"
      "affinity-publisher"
      "android-studio"
      "appcleaner"
      "balenaetcher"
      "bartender"
      "brave-browser"
      "dash"
      "discord"
      "displaycal"
      "docker"
      "figma"
      "firefox"
      "flutter"
      "hammerspoon"
      "insomnia"
      "iterm2-nightly"
      "karabiner-elements"
      "linear-linear"
      "microsoft-edge"
      "microsoft-teams"
      "miro"
      "notion"
      "nova"
      "obsidian"
      "raspberry-pi-imager"
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

  home-manager.backupFileExtension = "bak";
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.matt = { config, lib, pkgs, ... }: {
    home.stateVersion = "22.11";

    home.file.".config/safari/reboot.css" = {
      source = ~/Developer/dotfiles/config/safari/reboot.css;
    };
    # TODO: encrypt data so this file can be committed
    # home.file.".npmrc" = { source = ~/Developer/dotfiles/config/npm/.npmrc; };
    # home.file.".hammerspoon/init.lua" = {
    #   source = ~/Developer/dotfiles/config/hammerspoon/init.lua;
    # };
    home.file.".config/karabiner/karabiner.json" = {
      source = /Users/matt/Developer/dotfiles/config/karabiner/karabiner.json;
    };
    home.file.".config/iterm2/com.googlecode.iterm2.plist" = {
      source = /Users/matt/Developer/dotfiles/config/iterm2/com.googlecode.iterm2.plist;
    };
    home.file.".wezterm.lua" = {
      source = /Users/matt/Developer/dotfiles/config/wezterm/.wezterm.lua;
    };
    home.file.".grc/grc.conf" = {
      source = ~/Developer/dotfiles/config/grc/grc.conf;
    };
    home.file.".grc/conf.gotest" = {
      source = ~/Developer/dotfiles/config/grc/conf.gotest;
    };
    home.file.".iex.exs" = {
      source = ~/Developer/dotfiles/config/iex/.iex.exs;
    };
    home.file.".warp/keybindings.yaml" = {
      source = ~/Developer/dotfiles/config/warp/keybindings.yaml;
    };
    home.file.".warp/launch_configurations" = {
      source = ~/Developer/dotfiles/config/warp/launch_configurations;
    };

    home.sessionPath = [
      "~/.npm-globals/bin:$PATH"
      "$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$PATH"
    ];
    home.sessionVariables = {
      ANDROID_SDK = "~/Library/Android/sdk";
      BAT_THEME = "Dracula";
      CHROME_EXECUTABLE = "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser";
      CHROME_PATH = "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser";
      EDITOR = "nvim";
      GOPATH = "/Users/matt/Developer/go";
      VISUAL = "$EDITOR";
    };

    programs.bat = {
      enable = true;
      config = {
        theme = "Dracula";
        italic-text = "always";
        style = "full";
        map-syntax = [
          ".eslintignore:Git Ignore"
          ".prettierignore:Git Ignore"
          ".prettierrc:JSON"
        ];
      };
      themes = {
        dracula = {
          src = pkgs.fetchFromGitHub {
            owner = "dracula";
            repo = "sublime"; # Bat uses sublime syntax for its themes
            rev = "26c57ec282abcaa76e57e055f38432bd827ac34e";
            sha256 = "019hfl4zbn4vm4154hh3bwk6hm7bdxbr1hdww83nabxwjn99ndhv";
          };
          file = "Dracula.tmTheme";
        };
      };
    };

    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.gh = {
      enable = true;
      settings.git_protocol = "ssh";
    };

    programs.git = {
      enable = true;

      aliases = {
        co = "checkout";
        ci = "commit";
        st = "status";
        br = "branch";
        hist =
          ''log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'';
        type = "cat-file -t";
        dump = "cat-file -p";
      };

      delta = {
        enable = true;
        # options = {
        #   line_numbers = true;
        #   side_by_side = true;
        #   syntax_theme = "Dracula";
        # };
      };

      signing = {
        key = "22C1322FB7B3F0B2";
        signByDefault = true;
      };

      extraConfig = {
        init = { defaultBranch = "main"; };
        pull = { rebase = false; };
      };

      userName = "sciencefidelity";
      userEmail = "32623301+sciencefidelity@users.noreply.github.com";
    };

    programs.home-manager.enable = true;

    programs.neovim = {
      enable = true;
      defaultEditor = true;
      extraLuaConfig = ''
        ${builtins.readFile /Users/matt/Developer/dotfiles/config/nvim/init.lua}
      '';
      withNodeJs = true;
      viAlias = true;
      vimAlias = true;
    };

    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = false;

        format = lib.concatStrings [
          "$username"
          "$shlvl"
          "$singularity"
          "$kubernetes"
          "$directory"
          "$hostname"
          "$vcsh"
          "$git_branch"
          "$git_commit"
          "$git_state"
          "$git_metrics"
          "$git_status"
          "$hg_branch"
          "$docker_context"
          "$package"
          "$cmake"
          "$cobol"
          "$dart"
          "$deno"
          "$dotnet"
          "$elixir"
          "$elm"
          "$erlang"
          "$golang"
          "$helm"
          "$java"
          "$julia"
          "$kotlin"
          "$lua"
          "$nim"
          "$nodejs"
          "$ocaml"
          "$perl"
          "$php"
          "$pulumi"
          "$purescript"
          "$python"
          "$rlang"
          "$red"
          "$ruby"
          "$rust"
          "$scala"
          "$swift"
          "$terraform"
          "$vlang"
          "$vagrant"
          "$zig"
          "$nix_shell"
          "$conda"
          "$memory_usage"
          "$aws"
          "$gcloud"
          "$openstack"
          "$env_var"
          "$crystal"
          "$custom"
          "$cmd_duration"
          "$line_break"
          "$jobs"
          "$battery"
          "$time"
          "$status"
          "$shell"
          "$character"
        ];

        aws.disabled = true;
        battery.disabled = true;
        cmake.disabled = true;
        conda.disabled = true;
        crystal.disabled = true;
        docker_context.disabled = true;
        dotnet.disabled = true;
        helm.disabled = true;
        julia.disabled = true;
        hg_branch.disabled = true;
        openstack.disabled = true;
        perl.disabled = true;
        php.disabled = true;
        rlang.disabled = true;
        red.disabled = true;
        ruby.disabled = true;
        scala.disabled = true;
        singularity.disabled = true;
        terraform.disabled = true;
        vagrant.disabled = true;
        vlang.disabled = true;
        vcsh.disabled = true;

        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[➜](bold red)";
          vicmd_symbol = "[➜](bold purple)";
        };

        directory = { format = "in [$path](bold cyan) "; };

        hostname = {
          ssh_only = false;
          format = "on [$hostname](bold blue) ";
          trim_at = ".";
          disabled = false;
        };

        nodejs = { symbol = "⬢ "; };

        package = { format = "is [$version](bold red) "; };

        username = {
          style_user = "yellow bold";
          style_root = "red bold";
          format = "[$user]($style) ";
          disabled = false;
          show_always = true;
        };
      };
    };

    programs.zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      autocd = true;

      history = {
        save = 1000;
        size = 1000;
      };

      initExtra = ''
        ${builtins.readFile /Users/matt/Developer/dotfiles/config/zsh/zshrc}
      '';

      initExtraBeforeCompInit = ''
        zstyle ':completion:*' menu select
        zmodload zsh/complist
      '';

      shellAliases = {
        sudo = "sudo -i";
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
        "....." = "cd ../../../..";
        ls = "eza -F --group-directories-first";
        l = "eza -aF --group-directories-first";
        la = "eza -laF --group-directories-first --git";
        ll = "eza -lF --group-directories-first --git";
        lt = "eza -T --git-ignore";
        lr = "eza -R --git-ignore";
        df = "df -kTh";
        touch = "atouch";
        mkdir = "mkdir -pv";
        rmdir = "rmdir -pv";
        cp = "cp -Rv";
        mv = "mv -iv";
        rm = "rm -rIv";
        du = "du -h -c";
        cat = "bat";
        fd = "fdfind";
        c = "code";
        dv = "npm run dev";
        yd = "npm run dev";
        cr = "cargo run";
        gr = "go run";
        mr = "mix run";
        push = "git push";
        pull = "git fetch origin; git merge origin/main";
        gst = "git status";
        gci = "git commit";
        gco = "git checkout";
        gbr = "git branch";
        lg = "lazygit";
        cf = "clang-format -i";
        cleanup = "find . -name '*.DS_Store' -type f -ls -delete";
        ios = "open -a Simulator";
        hs = "open -a Hammerspoon";
        gotdd = "go test && fswatch -o . | (while read; do grc go test; done)";
        dartwatch = "dart run && fswatch -o -1 -d bin | (while read; do dart run; done)";
        darttdd = "dart test && fswatch -o -1 -d bin test | (while read; do dart test; done)";
        # python = "python3";
        pywatch = "python challenge.py && fswatch -o . | (while read; do python challenge.py; done)";
        # pip = "pip3";
      };
    };
  };

  networking.hostName = "macbook";
  nix.useDaemon = true;
  nixpkgs.config.allowUnfree = true;

  programs.zsh = {
    enable = true;
    enableBashCompletion = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    variables = {
      ANDROID_SDK = "~/Library/Android/sdk";
      CHROME_EXECUTABLE = "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser";
      CHROME_PATH = "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser";
      BAT_THEME = "Dracula";
      EDITOR = "nvim";
      GOPATH = "/Users/matt/Developer/go";
      VISUAL = "$EDITOR";
    };
  };

  services.nix-daemon.enable = true;

  system.defaults.dock = {
    autohide-delay = 0.1;
    autohide-time-modifier = 0.1;
  };
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };

  system.stateVersion = 4;
  users.users.matt = {
    description = "Matt Cook";
    home = "/Users/matt";
    name = "matt";
    shell = pkgs.zsh;
  };
}
