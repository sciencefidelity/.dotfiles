{ config, lib, pkgs, ... }:

{
  home.username = "matt";
  home.homeDirectory = "/Users/matt";
  home.stateVersion = "21.05";
  programs.home-manager.enable = true;

  home.file.".emacs.d/init.el" = {
    source = /Users/matt/Developer/dotfiles/config/emacs.d/init.el;
  };

  home.file.".npmrc" = {
    source = /Users/matt/Developer/dotfiles/config/npm/.npmrc;
  };

  home.file.".config/hammerspoon/init.lua" = {
    source = /Users/matt/Developer/dotfiles/config/hammerspoon/init.lua;
  };

  home.file.".config/karabiner/karabiner.json" = {
    source = /Users/matt/Developer/dotfiles/config/karabiner/karabiner.json;
  };

  home.file."/Pictures/tower.jpg" = {
    source = /Users/matt/Developer/dotfiles/pictures/tower.jpg;
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "Dracula";
      italic-text = "always";
      style = "full";
      # map-syntax = [ ".eslintignore:Git Ignore" ".prettierignore:Git Ignore" ".prettierrc:JSON" ];
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
      key = "183D75E092F21FEB";
      signByDefault = true;
    };

    userName = "sciencefidelity";
    userEmail = "32623301+sciencefidelity@users.noreply.github.com";
  };

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
  };
}
