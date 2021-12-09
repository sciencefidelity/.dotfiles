{ config, pkgs, ... }:

{
  home.username = "matt";
  home.homeDirectory = "/Users/matt";
  home.stateVersion = "21.05";
  programs.home-manager.enable = true;

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

  programs.emacs = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.htop = {
    enable = true;
  };

  programs.kitty = {
    enable = true;
  }

  programs.neovim = {
    enable = true;
    extraConfig = ''
      lua << EOF
      ${builtins.readFile /Users/matt/dotfiles/config/nvim/init.lua}
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
