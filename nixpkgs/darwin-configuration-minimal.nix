{ config, lib, pkgs, ... }:

{
  imports = [ <home-manager/nix-darwin> ];

  environment = {
    shells = [ pkgs.zsh ];
    systemPackages = with pkgs; [
      home-manager
    ];
  };

  home-manager.users.matt = { config, lib, pkgs, ... }: {
    home.stateVersion = "22.05";

    home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "$EDITOR";
    };

    programs.git = {
      enable = true;
      userName = "sciencefidelity";
      userEmail = "32623301+sciencefidelity@users.noreply.github.com";
    };

    programs.home-manager.enable = true;

    programs.zsh = {
      enable = true;

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

        # Edit line in vim with ctrl-e
        autoload edit-command-line; zle -N edit-command-line
        bindkey "^e" edit-command-line
        bindkey "^ " autosuggest-accept

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
        ls = "ls";
        l = "ls -aF";
        la = "ls -laF";
        ll = "ls -lF";
        mkdir = "mkdir -p";
        df = "df -kTh";
        free = "free -h";
        du = "du -h -c";
        push = "git push";
        pull="git fetch origin; git merge origin/main";
        gst = "git status";
        cleanup = "find . -name '*.DS_Store' -type f -ls -delete";
      };
    };
  };

  networking.hostName = "naen";
  nix.useDaemon = true;
  services.nix-daemon.enable = true;

  system.stateVersion = 4;
  users.users.matt = {
    description = "Matt Cook";
    home = "/Users/matt";
    name = "matt";
    shell = pkgs.zsh;
  };
}
