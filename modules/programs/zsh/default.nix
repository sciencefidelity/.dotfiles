{ config, lib, pkgs, ... }:

let
  aliases = {
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    "....." = "cd ../../../..";
    l = "ls -A";
    la = "ls -lA";
    ll = "ls -l";
    lt = "ls -T";
    lr = "ls -R";
    df = "df -kTh";
    du = "du -h -c";
    mkdir = "mkdir -pv";
    rmdir = "rmdir -pv";
    cp = "cp -Rv";
    mv = "mv -iv";
    rm = "rm -rIv";
    sysclean = "sudo nix-collect-garbage -d; and sudo nix-store --optimise";
    syshs = "home-manager switch --flake .";
    sysrs = "sudo nixos-rebuild switch --flake .";
    projects = "cd ~/developer/projects/rust";
    learning = "cd ~/developer/learning/rust";
    testing = "cd ~/developer/testing/rust";
    dots = "cd ~/.dotfiles";
  };
in
{
  home = {
    packages = with pkgs; [
      zsh-autosuggestions
      zsh-syntax-highlighting
    ];

    sessionPath = [
      "${config.home.homeDirectory}/.npm-globals/bin"
    ];

    sessionVariables = {
      COLORTERM = "truecolor";
      KEYTIMEOUT = "1";
      PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    };
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    history = {
      save = 5000;
      size = 5000;
      expireDuplicatesFirst = true;
      ignoreAllDups = true;
    };
    initContent = /*bash*/ ''
      autoload -U colors && colors
      PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%(3~|./%2~|%~)%{$fg[red]%}]%{$reset_color%}$%b "

      eval "$(ssh-agent -s)" > /dev/null
      ssh-add ~/.ssh/github 2> /dev/null
      export GPG_TTY=$(tty)

      autoload edit-command-line; zle -N edit-command-line

      # lfcd - use lf to switch directories (bound to ctrl-o).
      lfcd () {
        cd "$(command lf -print-last-dir "$@")"
      }

      bindkey -v
      bindkey "^ " autosuggest-accept
      bindkey -M menuselect "h" vi-backward-char
      bindkey -M menuselect "k" vi-up-line-or-history
      bindkey -M menuselect "l" vi-forward-char
      bindkey -M menuselect "j" vi-down-line-or-history
      bindkey -v "^?" backward-delete-char
      bindkey -s "^o" "lfcd\n"
      bindkey "^e" edit-command-line

      zstyle ':completion:*' menu select
      zmodload zsh/complist
    '';
    shellAliases = aliases;
    syntaxHighlighting.enable = true;
  };
}
