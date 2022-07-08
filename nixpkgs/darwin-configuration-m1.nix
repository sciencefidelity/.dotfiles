{ config, lib, pkgs, ... }:

let
  home-manager = builtins.fetchTarball
    "https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz";
  link = config.lib.file.mkOutOfStoreSymlink;
  pkgsUnstable = import <nixpkgs-unstable> { };
in {
  imports = [ <home-manager/nix-darwin> ];

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url =
        "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
    }))
    (import (builtins.fetchTarball {
      url =
        "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
    }))
  ];

  environment = {
    shells = [ pkgs.zsh ];
    systemPackages = with pkgs; [
      air
      # android-tools # refusing to evaluate
      bat
      cabal-install
      cocoapods
      coreutils
      ctags
      curl
      delta
      deno
      docker
      emacs-nox
      elixir
      erlang
      exa
      fd
      fswatch
      fzf
      gh
      ghc
      git
      gnupg
      pkgsUnstable.go_1_18
      gopls
      grc
      # haskell-language-server # package broken
      home-manager
      lf
      mosh
      # neovim
      neovim-nightly
      nix-linter
      nixfmt
      # nodejs
      nodejs-16_x
      nodePackages.diagnostic-languageserver
      nodePackages.eslint
      nodePackages.eslint_d
      nodePackages.neovim
      nodePackages.pnpm
      nodePackages.prettier
      nodePackages.stylelint
      nodePackages.svelte-language-server
      nodePackages.typescript
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      nodePackages.vue-language-server
      nodePackages.yaml-language-server
      nodePackages.yarn
      pinentry
      unrar
      ripgrep
      rnix-lsp
      rustup
      pscale
      stack
      starship
      wget
      zsh
      zsh-autosuggestions
      zsh-syntax-highlighting
    ];
  };

  homebrew = {
    enable = true;
    autoUpdate = true;
    brewPrefix = "/opt/homebrew/bin";
    cleanup = "zap";
    global = {
      brewfile = true;
      noLock = true;
    };

    taps = [
      "dart-lang/dart"
      "homebrew/bundle"
      "homebrew/services"
      "homebrew/core"
      "homebrew/cask"
      "sass/sass"
    ];

    brews = [ "mongosh" "sass/sass/sass" "vapor" ];

    casks = [
      "affinity-designer"
      "affinity-photo"
      "affinity-publisher"
      "android-studio"
      "bartender"
      "blender"
      "brave-browser"
      "dash"
      "discord"
      "displaycal"
      "figma"
      "firefox"
      "flutter"
      "hammerspoon"
      "insomnia"
      "karabiner-elements"
      "kitty"
      "microsoft-teams"
      "miro"
      "notion"
      "nova"
      "obsidian"
      "rocket"
      "sketch"
      "slack"
      "spotify"
      "zoom"
      "visual-studio-code"
    ];

    masApps = {
      "Compressor" = 424390742;
      "Craft - Docs and Notes Editor" = 1487937127;
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
      "Vimari" = 1480933944;
      "Xcode" = 497799835;
    };
  };

  home-manager.backupFileExtension = "bak";
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.matt = { config, lib, pkgs, ... }: {
    home.stateVersion = "22.05";

    home.file.".emacs.d/init.el" = {
      source = ~/Developer/dotfiles/config/emacs.d/init.el;
    };
    home.file.".config/kitty/kitty.conf" = {
      source = ~/Developer/dotfiles/config/kitty/kitty.conf;
    };
    home.file.".config/safari/reboot.css" = {
      source = ~/Developer/dotfiles/config/safari/reboot.css;
    };
    home.file.".npmrc" = { source = ~/Developer/dotfiles/config/npm/.npmrc; };
    home.file.".hammerspoon/init.lua" = {
      source = ~/Developer/dotfiles/config/hammerspoon/init.lua;
    };
    home.file.".config/karabiner/karabiner.json" = {
      source = /Users/matt/Developer/dotfiles/config/karabiner/karabiner.json;
    };
    home.file.".grc/grc.conf" = {
      source = ~/Developer/dotfiles/config/grc/grc.conf;
    };
    home.file.".grc/conf.gotest" = {
      source = ~/Developer/dotfiles/config/grc/conf.gotest;
    };

    home.sessionPath = [
      # "~/.npm-globals/bin:$PATH"
      "$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$PATH"
    ];
    home.sessionVariables = {
      ANDROID_SDK = "~/Library/Android/sdk";
      BAT_THEME = "Dracula";
      CHROME_EXECUTABLE =
        "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser";
      CHROME_PATH =
        "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser";
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
        dracula = builtins.readFile (pkgs.fetchFromGitHub {
          owner = "dracula";
          repo = "sublime"; # Bat uses sublime syntax for its themes
          rev = "26c57ec282abcaa76e57e055f38432bd827ac34e";
          sha256 = "019hfl4zbn4vm4154hh3bwk6hm7bdxbr1hdww83nabxwjn99ndhv";
        } + "/Dracula.tmTheme");
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

      delta.enable = true;

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
      extraConfig = ''
        lua << EOF
        ${builtins.readFile /Users/matt/Developer/dotfiles/config/nvim/init.lua}
        EOF
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

        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[➜](bold red)";
          vicmd_symbol = "[➜](bold purple)";
        };

        cmake.disabled = true;
        conda.disabled = true;
        crystal.disabled = true;

        directory = { format = "in [$path](bold cyan) "; };

        docker_context.disabled = true;
        dotnet.disabled = true;
        gcloud.disabled = true;
        helm.disabled = true;

        hostname = {
          ssh_only = false;
          format = "on [$hostname](bold blue) ";
          trim_at = ".";
          disabled = false;
        };

        java.disabled = true;
        julia.disabled = true;
        hg_branch.disabled = true;

        nodejs = { symbol = "⬢ "; };

        openstack.disabled = true;

        package = { format = "is [$version](bold red) "; };

        perl.disabled = true;
        php.disabled = true;
        rlang.disabled = true;
        red.disabled = true;
        ruby.disabled = true;
        scala.disabled = true;
        singularity.disabled = true;
        terraform.disabled = true;

        username = {
          style_user = "yellow bold";
          style_root = "red bold";
          format = "[$user]($style) ";
          disabled = false;
          show_always = true;
        };

        vagrant.disabled = true;
        vlang.disabled = true;
        vcsh.disabled = true;
        zig.disabled = true;
      };
    };

    programs.zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
      autocd = true;

      history = {
        save = 1000;
        size = 1000;
      };

      initExtra = ''
        # Basic auto/tab complete
        autoload -U compinit
        zstyle ":completion:*" menu select
        zmodload zsh/complist
        compinit
        _comp_options+=(globdots)

        # vi mode
        bindkey -v
        export KEYTIMEOUT=1

        # Use vim keys in tab complete menu
        bindkey -M menuselect "h" vi-backward-char
        bindkey -M menuselect "k" vi-up-line-or-history
        bindkey -M menuselect "l" vi-forward-char
        bindkey -M menuselect "j" vi-down-line-or-history
        bindkey -v "^?" backward-delete-char

        # Use lf to switch directories and bind it to ctrl-o
        lfcd () {
            tmp="$(mktemp)"
            lf -last-dir-path="$tmp" "$@"
            if [ -f "$tmp" ]; then
                dir="$(cat "$tmp")"
                rm -f "$tmp"
                [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
            fi
        }
        bindkey -s "^o" "lfcd\n"

        # Edit line in vim with ctrl-e
        autoload edit-command-line; zle -N edit-command-line
        bindkey "^e" edit-command-line

        bindkey "^ " autosuggest-accept

        eval "$(ssh-agent -s)" > /dev/null
        ssh-add ~/.ssh/github 2> /dev/null
        export GPG_TTY=$(tty)

        # open emacs with truecolor
        if [[ "$TERM" == "xterm-kitty" && "$(uname)" == "Linux" ]]; then
            alias emacs="TERM=xterm-24bit emacs -nw"
        elif [[ "$TERM" == "xterm-kitty" && "$(uname)" == "Darwin" ]]; then
            alias emacs="TERM=xterm-emacs emacs -nw"
        elif [[ "$TERM" == "tmux-256color" ]]; then
            alias emacs="TERM=xterm-24bits emacs -nw"
        else
            alias emacs="emacs"
        fi

        alias -s {cs,js,html}=nova

        gp() {
          git pull
          git add .
          git commit -m "$*"
          git push
        }

        # archive extractor - usage: ext <file>
        ext ()
        {
          if [ -f $1 ] ; then
            case $1 in
              *.tar.bz2) tar xjf $1;;
              *.tar.gz) tar xzf $1;;
              *.tar.xz) tar xJf $1;;
              *.bz2) bunzip2 $1;;
              *.rar) unrar x $1;;
              *.gz) gunzip $1 ;;
              *.tar) tar xf $1 ;;
              *.tbz2) tar xjf $1;;
              *.tgz) tar xzf $1;;
              *.zip) unzip $1;;
              *.Z) uncompress $1;;
              *.7z) 7z x $1;;
              *) echo "'$1' cannot be extracted via ex()";;
            esac
          else
            echo "'$1' is not a valid file"
          fi
        }
        export PATH="$HOME/.npm-globals/bin:$PATH"
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
        ls = "exa -F --group-directories-first";
        l = "exa -aF --group-directories-first";
        la = "exa -laF --group-directories-first --git";
        ll = "exa -lF --group-directories-first --git";
        lt = "exa -T --git-ignore";
        lr = "exa -R --git-ignore";
        mkdir = "mkdir -p";
        df = "df -kTh";
        free = "free -h";
        du = "du -h -c";
        cat = "bat";
        fd = "fdfind";
        push = "git push";
        pull = "git fetch origin; git merge origin/main";
        gst = "git status";
        cleanup = "find . -name '*.DS_Store' -type f -ls -delete";
        ios = "open -a Simulator";
        ssh = "kitty +kitten ssh";
        hs = "open -a Hammerspoon";
        gottd = "fswatch -o . | (while read; do grc go test; done)";
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
      CHROME_EXECUTABLE =
        "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser";
      CHROME_PATH =
        "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser";
      BAT_THEME = "Dracula";
      EDITOR = "nvim";
      GOPATH = "/Users/matt/Developer/go";
      VISUAL = "$EDITOR";
    };
  };

  services.nix-daemon.enable = true;

  system.defaults.dock = {
    autohide-delay = "0";
    autohide-time-modifier = "0.5";
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
