# NixOS config for Raspberry pi

{ callPackage, config, lib, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
  link = config.lib.file.mkOutOfStoreSymlink;
in
{

  imports =
    [ # the results of the hardware scan, do not change
      ./hardware-configuration.nix
      <nixos-hardware/raspberry-pi/4>
      (import "${home-manager}/nixos")
    ];

  boot = {
    kernelPackages = pkgs.linuxPackages_rpi4;
    # tmpOnTmpfs = true;
    kernelParams = [
      "8250.nr_uarts=1"
      "console=ttyAMA0,115200"
      "console=tty1"
    ];
    kernel.sysctl = {
      "vm.swappiness" = 10;
      "vm.vfs_cache_pressure" = 50;
    };
    loader = {
      generic-extlinux-compatible.enable = true;
      grub.enable = false;
      raspberryPi = {
        enable = true;
        version = 4;
      };
    };
  };

  hardware.enableRedistributableFirmware = true;
  nixpkgs.config = {
    allowUnfree = true;
  };

  networking = {
    firewall.allowedTCPPortRanges = [
      { from = 2000; to = 9000; }
    ];
    hostName = "pi";
    interfaces.eth0.useDHCP = true;
    interfaces.wlan0.useDHCP = true;
    useDHCP = false;
    wireless = {
      enable = false;
    };
  };

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";

  users = {
    defaultUserShell = pkgs.zsh;
    mutableUsers = false;
    users.root = {
      hashedPassword = "$6$7G8if/Rn$wA9X6NWKQ6zsKkz60zowc6tajW78kKwrvu8HX15jJWDgzLrPWcP2nC0b6uY4r10oEMNL/Alor7phV/wWrfbxc.";
    };
    users.matt = {
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # enable ‘sudo’ for the user
      hashedPassword = "$6$IhUfSjtK9Ydj$qnXZYlZ5KD61T4L6bvpaV.5yxTV/7Q8t8WEQCeJ2u40a9PlMZoBGaPCXIBfrAtru8Pu.ZRYm591anUMdKfypH/";
      openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDROPZMB/lhVBpM+aqatLPxRGE++tpKmWp5DDbmP1RLGy0fmEkorRnrsq8OcMEDr3kjJEe++vG1lrMgucScam/AcYX54iD2K+1dHpfkJY0osatsmyrni5rDjPH308+xj9FasS9DjfymZTZOh1owRFb31YJn4GEF07zVfKFrueXN6n/azjnOhOPTZ8dampjx/M5R+WpQ8iMywJe3CQoQKTf4Ofbyn1hLr3+TusildJkGCvLjix2oQtBpxLJdaXNGvt6u0Ogiv9JHwotk1VjYR5mztyZrGrqC/WTCo7uH4rAULQTOyTKUPsRjMOSDoq6SXHtObIdkHnTB7cLqPF1xKiGJM2dM+K4X9fvB/K3eht0cZPSEMkEnNODK+H4Xc6L3MArSyKvV4a1qLN2R+GiIuh7hz9gPtiNYoo9ERXK/yU3rb2Eam0G7WAz1vtIs8Ud2MGMT1Zk36EDwycxK4XIwhwdU4E1h4qcT1qAIoKNlYPGWqyLJX2nUTsgPF3je06rSG3k= matt@pi" ];
    };
  };

  services.emacs = {
    enable = true;
    package = pkgs.emacsUnstable;
  };

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    }))
  ];

  environment.systemPackages = with pkgs; [
    abduco
    bat
    bc
    cabal-install
    cargo
    clojure
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
    emacs
    exa
    fd
    fzf
    libraspberrypi
    lua
    luajit
    luarocks
    gcc10
    gh
    ghc
    git
    gnupg
    go
    google-cloud-sdk
    gopls
    haskell-language-server
    haskellPackages.purescript
    htop
    home-manager
    lazygit
    lf
    mosh
    neovim-nightly
    nix-linter
    nixfmt
    nodejs
    nodePackages.diagnostic-languageserver
    nodePackages.eslint
    nodePackages.eslint_d
    nodePackages.gatsby-cli
    nodePackages.pnpm
    nodePackages.prettier
    nodePackages.purescript-language-server
    nodePackages.purescript-psa
    nodePackages.pscid
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
    raspberrypi-eeprom
    ripgrep
    rls
    rnix-lsp
    rustup
    samba
    spago
    sumneko-lua-language-server
    tmux
    wget
    zplug
    zsh
  ];

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    viAlias = true;
    vimAlias = true;
  };

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = false;
    autosuggestions.enable = true;

    shellAliases = {
      sudo = "sudo -i";
      poweroff = "sudo poweroff";
      reboot = "sudo reboot";
      sysrs = "sudo nixos-rebuild switch";
      sysup = "sudo nixos-rebuild switch --upgrade";
      sysclean = "sudo nix-collect-garbage -d; and sudo nix-store --optimise";
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
      emacs = "TERM=xterm-24bits emacs -nw";
      push = "git push";
      pull="git fetch origin; git merge origin/main";
      gst = "git status";
      cleanup = "find . -name '*.DS_Store' -type f -ls -delete";
    };
  };


  environment.variables = {
    EDITOR = "nvim";
  };

  services.openssh.enable = true;

  home-manager.users.matt = {

    home.file.".emacs.d/init.el" = {
      source = /home/matt/dotfiles/config/emacs.d/init.el;
    };

    home.file.".npmrc" = {
      source = /home/matt/dotfiles/config/npm/.npmrc;
    };

    home.sessionVariables = {
      SPACESHIP_VI_MODE_SHOW = false;
      SPACESHIP_USER_SHOW = "always";
      SPACESHIP_HOST_SHOW = "always";
      SPACESHIP_PROMPT_ADD_NEWLINE = false;
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

    programs.emacs = {
      enable = true;
    };

    programs.gh = {
      enable = true;
      gitProtocol = "ssh";
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

      extraConfig = { init = { defaultBranch = "main"; } ; };

      signing = {
        key = "F1EC40E6851FF81E";
        signByDefault = true;
      };

      userName = "sciencefidelity";
      userEmail = "32623301+sciencefidelity@users.noreply.github.com";
    };

    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.gpg = {
      enable = true;
    };

    services.gpg-agent = {
      enable = true;
      enableSshSupport = true;
    };

    programs.htop = {
      enable = true;
    };

    programs.neovim = {
      enable = true;
      package = pkgs.neovim-nightly;
      extraConfig = ''
        lua << EOF
        ${builtins.readFile /home/matt/dotfiles/config/nvim/init.lua}
        EOF
      '';
      withNodeJs = true;
      viAlias = true;
      vimAlias = true;
    };

    programs.tmux = {
      enable = true;
      clock24 = true;
      escapeTime = 20;
      extraConfig = ''
        set-option -ga terminal-overrides ",xterm-24bits:Tc"

        # unbind default prefix and set it to Ctrl+s
        set -g prefix C-s
        unbind C-b
        bind C-s send-prefix

        # speed up escape in nvim
        set -g base-index 1

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
        set-option -ag status-right " #[fg="#f1fa8c",bg=default]#(zsh ~/dotfiles/config/zsh/cpu.sh) "
        set-option -ag status-right " #[fg="#8be9fd",bg=default]#(free -h | awk '/^Mem/ {print $3}')/#(free -h | awk '/^Mem/ {print $2}') "
        set-option -ag status-right " #[fg="#50fa7b",bg=default]#(zsh ~/dotfiles/config/zsh/temp.sh) "
        set-option -ag status-right " #[fg="#ff79c6",bg=default]#(date +"%R") "
      '';
      keyMode = "vi";
      newSession = true;
      terminal = "xterm-24bits";
    };

    programs.zsh = {
      enable = true;
      autocd = true;
      # defaultKeymap = "vicmd"; # prints a list of keymappings when starting shell
      # dotDir = ".config/zsh";
      history = {
        save = 1000;
        size = 1000;
      };

      initExtra = ''
        # Basic auto/tab complete
        _comp_options+=(globdots)

        # vi mode
        bindkey -v
        export KEYTIMEOUT=1

        # Use vim keys in tab complete menu
        bindkey -M menuselect 'h' vi-backward-char
        bindkey -M menuselect 'k' vi-up-line-or-history
        bindkey -M menuselect 'l' vi-forward-char
        bindkey -M menuselect 'j' vi-down-line-or-history
        bindkey -v '^?' backward-delete-char

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
        bindkey -s '^o' 'lfcd\n'

        # Edit line in vim with ctrl-e
        autoload edit-command-line; zle -N edit-command-line
        bindkey '^e' edit-command-line

        bindkey '^ ' autosuggest-accept

        export BAT_THEME="Dracula"

        alias ..="cd .."
        alias ...="cd ../.."
        alias ....="cd ../../.."
        alias .....="cd ../../../.."

        eval "$(ssh-agent -s)" > /dev/null
        ssh-add ~/.ssh/github 2> /dev/null
        export GPG_TTY=$(tty)

        # Git aliases
        gitpush() {
          git pull
          git add .
          git commit -m "$*"
          git push
        }
        alias gp=gitpush

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

      initExtraFirst = ''
        if [[ "$TERM" == "xterm-256color" ]]; then
            export TERM=xterm-24bits
        fi
      '';

      zplug = {
        enable = true;
        plugins = [
          { name = "spaceship-prompt/spaceship-prompt"; tags = [ use:spaceship.zsh from:github as:theme ]; }
        ];
      };
    };
  };

  system.stateVersion = "21.11";
}

