{ callPackage, config, lib, pkgs, ... }:

let
  # home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
  link = config.lib.file.mkOutOfStoreSymlink;
in
{
  imports = [ <home-manager/nix-darwin> ];

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/mjlbach/neovim-nightly-overlay/archive/master.tar.gz";
    }))
    # (import (builtins.fetchTarball {
    #   url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
    # }))
  ];

  environment = {
    shells = [ pkgs.zsh ];
    systemPackages = with pkgs; [
      bat
      bc
      cabal-install
      # cargo
      clojure
      coreutils
      curl
      delta
      deno
      dart
      elixir
      elixir_ls
      elmPackages.create-elm-app
      elmPackages.elm
      elmPackages.elm-analyse
      elmPackages.elm-format
      elmPackages.elm-language-server
      elmPackages.elm-live
      elmPackages.elm-review
      elmPackages.elm-test
      emacs-nox
      # emacsUnstable-nox
      exa
      fd
      fzf
      lua
      # luajit
      luarocks
      gcc10
      ghc
      gh
      git
      gnupg
      go
      google-cloud-sdk
      gopls
      haskell-language-server
      # home-manager
      htop
      jq
      lazygit
      lf
      mosh
      # neovim
      neovim-nightly
      nix-linter
      nixfmt
      nodejs
      nodePackages.diagnostic-languageserver
      nodePackages.eslint
      nodePackages.eslint_d
      nodePackages.gatsby-cli
      nodePackages.node2nix
      nodePackages.pnpm
      nodePackages.prettier
      # nodePackages.purescript-language-server
      # nodePackages.purescript-psa
      # nodePackages.pscid
      nodePackages.svelte-language-server
      nodePackages.typescript
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      nodePackages.vue-cli
      nodePackages.vue-language-server
      nodePackages.yaml-language-server
      nodePackages.yarn
      ocaml
      ocamlPackages.fmt
      ocamlPackages.js_of_ocaml
      ocamlPackages.js_of_ocaml-ppx
      ocamlPackages.js_of_ocaml-lwt
      ocamlPackages.lsp
      pinentry
      ripgrep
      # rls
      rnix-lsp
      rustup
      spago
      stack
      starship
      # sumneko-lua-language-server
      tmux
      # tree
      wget
      zsh
      zsh-autosuggestions
      zsh-syntax-highlighting
    ];
  };

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
      # "buo/cask-upgrade"
      "sass/sass"
    ];

    brews = [
      "sass/sass/sass"
    ];

    casks = [
      "affinity-designer"
      "affinity-photo"
      "affinity-publisher"
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
      source = /Users/matt/Developer/dotfiles/config/emacs.d/init.el;
    };
    home.file.".npmrc" = {
      source = /Users/matt/Developer/dotfiles/config/npm/.npmrc;
    };
    home.file.".hammerspoon/init.lua" = {
      source = /Users/matt/Developer/dotfiles/config/hammerspoon/init.lua;
    };
    home.file.".config/karabiner/karabiner.json" = {
      source = /Users/matt/Developer/dotfiles/config/karabiner/karabiner.json;
    };

    home.sessionPath = [
      "$HOME/.npm-globals/bin:$PATH"
      "$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$PATH"
    ];
    home.sessionVariables = {
      ANDROID_SDK = "$HOME/Library/Android/sdk";
      BAT_THEME = "Dracula";
      CHROME_EXECUTABLE = "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser";
      CHROME_PATH = "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser";
      EDITOR = "nvim";
      VISUAL = "$EDITOR";
    };

    programs.bat = {
      enable = true;
      config = {
        theme = "Dracula";
        italic-text = "always";
        style = "full";
        map-syntax = [ ".eslintignore:Git Ignore" ".prettierignore:Git Ignore" ".prettierrc:JSON" ];
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
        hist = "log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short";
        type = "cat-file -t";
        dump = "cat-file -p";
      };

      delta.enable = true;

      extraConfig = {
        init = { defaultBranch = "main"; } ;
        pull = { rebase = false; } ;
      };

      signing = {
        key = "40E08B1E5B9DE19A";
        signByDefault = true;
      };

      userName = "sciencefidelity";
      userEmail = "32623301+sciencefidelity@users.noreply.github.com";
    };

    programs.home-manager.enable = true;

    programs.htop = {
      enable = true;
    };

    programs.kitty = {
      enable = true;
      extraConfig = ''
        ${builtins.readFile /Users/matt/Developer/dotfiles/config/kitty/kitty.conf}
      '';
    };

    programs.neovim = {
      enable = true;
      # package = pkgs.neovim-nightly;
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

        directory = {
          format = "in [$path](bold cyan) ";
        };

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

        nodejs = {
          symbol = "⬢ ";
        };

        openstack.disabled = true;

        package = {
          format = "is [$version](bold red) ";
        };

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

    programs.tmux = {
      enable = true;
      clock24 = true;
      escapeTime = 20;
      extraConfig = ''
        # fix colors on truecolor terminals
        if-shell "uname | grep -q Darwin && echo $TERM | grep -q xterm-256color" {
          # set -g default-terminal screen-256color
          # set -ga terminal-overrides ",xterm-256color*:Tc"
          set-option default-terminal "tmux-256color"
          set-option -a terminal-overrides ",xterm-256color:RGB"
        }

        if-shell "uname | grep -q Darwin && echo $TERM | grep -q xterm-kitty" {
          set-option default-terminal "tmux-256color"
          set-option -a terminal-overrides ",xterm-256color:RGB"
        }

        # unbind default prefix and set it to Ctrl+s
        set -g prefix C-s
        unbind C-b
        bind C-s send-prefix

        # speed up escape in nvim
        set -g base-index 1
        set -g escape-time 20

        # custom key bindings
        bind -n M-h select-pane -L
        bind -n M-j select-pane -D
        bind -n M-k select-pane -U
        bind -n M-l select-pane -R

        bind-key t set-option status

        # status bar options
        set -g status-bg "#282a36"
        set -g status-fg "#ff79c6"

        set-option -g status-right ""
        set-option -ag status-right " #[fg="#f1fa8c",bg=default]#(zsh ~/.config/zsh/cpu.sh) "
        set-option -ag status-right " #[fg="#8be9fd",bg=default]#(free -h | awk '/^Mem/ {print $3}')/#(free -h | awk '/^Mem/ {print $2}') "
        set-option -ag status-right " #[fg="#50fa7b",bg=default]#(zsh ~/.config/zsh/temp.sh) "
        set-option -ag status-right " #[fg="#ff79c6",bg=default]#(date +"%R") "
      '';
      keyMode = "vi";
      newSession = true;
      terminal = "xterm-24bits";
    };

    programs.zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
      autocd = true;
      # defaultKeymap = "vicmd"; # prints a list of keymappings when starting shell
      # dotDir = ".config/zsh";
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

        tbtm () {
          if ! tmux has-session -t $1; then
            tmux new -s $1 -d
            tmux split-window -t $1:1 -v -p 10
            tmux send-keys -t $1:1.0 vim Enter
            tmux send-keys -t $1:1.1 \
              "npm run dev" Enter
          fi
          tmux attach -t $1
        }
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
        grep = "rg";
        fd = "fdfind";
        push = "git push";
        pull="git fetch origin; git merge origin/main";
        gst = "git status";
        cleanup = "find . -name '*.DS_Store' -type f -ls -delete";
        ios = "open -a Simulator";
        ssh = "kitty +kitten ssh";
        hs = "open -a Hammerspoon";
      };
    };
  };

  networking.hostName = "naen";
  nix.useDaemon = true;
  nixpkgs.config.allowUnfree = true;

  programs.nix-index.enable = true;
  programs.zsh = {
    enable = true;
    enableBashCompletion = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    variables = {
      ANDROID_SDK = "$HOME/Library/Android/sdk";
      CHROME_EXECUTABLE = "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser";
      CHROME_PATH = "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser";
      EDITOR = "nvim";
    };
  };

  services.nix-daemon.enable = true;
  services.emacs = {
    enable = true;
    # package = pkgs.emacsUnstable-nox;
  };

  system.defaults.NSGlobalDomain = {
    AppleKeyboardUIMode = 3;
    ApplePressAndHoldEnabled = true;
    AppleShowAllExtensions = true;
    InitialKeyRepeat = 15;
    KeyRepeat = 2;
    NSAutomaticCapitalizationEnabled = false;
    NSAutomaticDashSubstitutionEnabled = false;
    NSAutomaticPeriodSubstitutionEnabled = false;
    NSAutomaticQuoteSubstitutionEnabled = false;
    NSAutomaticSpellingCorrectionEnabled = true;
    NSDocumentSaveNewDocumentsToCloud = true;
    NSNavPanelExpandedStateForSaveMode = true;
    NSNavPanelExpandedStateForSaveMode2 = true;
    NSWindowResizeTime = "0";
    "com.apple.keyboard.fnState" = false;
    "com.apple.sound.beep.feedback" = 0;
    "com.apple.springing.delay" = "0";
    "com.apple.springing.enabled" = false;
    "com.apple.trackpad.scaling" = "2";
  };
  system.defaults.alf.globalstate = 0;
  system.defaults.dock = {
    autohide = true;
    autohide-delay = "0";
    autohide-time-modifier = "0.5";
    launchanim = false;
    mineffect = "scale";
    mouse-over-hilite-stack = false;
    orientation = "bottom";
    show-process-indicators = true;
    show-recents = false;
    tilesize = 64;
  };
  system.defaults.finder = {
    AppleShowAllExtensions = true;
    FXEnableExtensionChangeWarning = false;
    _FXShowPosixPathInTitle = false;
  };
  system.defaults.loginwindow = {
    LoginwindowText = "You never change things by fighting the existing reality.";
  };
  system.defaults.screencapture.location = "/Users/matt/Downloads";
  system.defaults.trackpad.ActuationStrength = 0;
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };
  system.stateVersion = 4;

  time.timeZone = "Europe/London";

  users.users.matt = {
    description = "Matt Cook";
    home = "/Users/matt";
    name = "matt";
    shell = pkgs.zsh;
  };
}
