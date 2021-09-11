# nix config for Raspberry pi

{ config, pkgs, lib, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{

  imports =
    [ # the results of the hardware scan, do not change
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
    ];

  boot.loader.raspberryPi = {
    enable = true;
    version = 4;
  };
  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  hardware.enableRedistributableFirmware = true;

  networking = {
    hostName = "pi";
    wireless = {
      enable = false;
    };
  };

  users = {
    defaultUserShell = pkgs.zsh;
    mutableUsers = false;
    users.matt = {
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # enable ‘sudo’ for the user
      initialPassword = "nixos";
      # openssh.authorizedKeys.keys =
      #   let keys = import /home/matt/.ssh/keys.nix;
      #   in [ keys.nixos ];
    };
  };

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";

  home-manager.users.matt = {

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
        key = "9F071448877E6705";
        signByDefault = true;
      };

      userName = "sciencefidelity";
      userEmail = "32623301+sciencefidelity@users.noreply.github.com";
    };

    programs.gpg = {
      enable = true;

    };

    programs.htop = {
      enable = true;
    };

    programs.zsh = {
      enable = true;
      autocd = true;
      defaultKeymap = "vicmd";
      # dotDir = ".config/zsh";
      history = {
        save = 1000;
        size = 1000;
      };

      initExtra = ''

        SPACESHIP_VI_MODE_SHOW=false
        SPACESHIP_USER_SHOW=always
        SPACESHIP_HOST_SHOW=always
        SPACESHIP_PROMPT_ADD_NEWLINE=false

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

        if [[ "$TERM" == "xterm-kitty" && "$(uname)" == "Linux" ]]; then
            alias emacs="TERM=xterm-24bit emacs -nw"
        elif [[ "$TERM" == "tmux-256color" ]]; then
            alias emacs="TERM=xterm-24bits emacs -nw"
        else
            alias emacs="emacs"
        fi

        gitpush() {
          pull
          git add .
          git commit -m "$*"
          git push
        }
        gitupdate() {
          eval "$(ssh-agent -s)"
          ssh-add ~/.ssh/github
          ssh -T git@github.com
        }
        alias gp=gitpush
        alias gu=gitupdate

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

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = false;
    autosuggestions.enable = true;

    shellAliases = {
      sysrs = "sudo nixos-rebuild switch";
      sysup = "sudo nixos-rebuild switch --upgrade";
      sysclean = "sudo nix-collect-garbage -d; and sudo nix-store --optimise";
      ls = "exa -F --group-directories-first";
      l = "exa -aF --group-directories-first";
      la = "exa -laF --group-directories-first --git --git-ignore";
      ll = "exa -lF --group-directories-first --git --git-ignore";
      lt = "exa -T --git-ignore";
      lr = "exa -R --git-ignore";
      mkdir = "mkdir -p";
      df = "df -kTh";
      free = "free -h";
      du = "du -h -c";
      cat = "bat -p";
      grep = "rg";
      fd = "fdfind";
      push = "eval '$(ssh-agent -s)'; ssh-add ~/.ssh/github; git push";
      pull="eval '$(ssh-agent -s)'; ssh-add ~/.ssh/github; git fetch origin; git merge origin/main";
      gst = "git status";
      cleanup = "find . -name '*.DS_Store' -type f -ls -delete";
    };
  };

  environment.systemPackages = with pkgs; [
    abduco
    bat
    cabal-install
    delta
    deno
    dart
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
    gh
    ghc
    git
    gnupg
    go
    gopls
    htop
    home-manager
    lazygit
    lf
    mosh
    neovim
    nodejs
    nodePackages.gatsby-cli
    nodePackages.svelte-language-server
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.vue-cli
    nodePackages.vue-language-server
    nodePackages.yarn
    ocamlPackages.js_of_ocaml
    ocamlPackages.js_of_ocaml-ppx
    ocamlPackages.js_of_ocaml-lwt
    raspberrypi-eeprom
    ripgrep
    samba
    sumneko-lua-language-server
    tmux
    wget
    zplug
    zsh
  ];

  environment.variables = {
    EDITOR = "nvim";
  };

  services.openssh.enable = true;

  system.stateVersion = "21.11";
}

