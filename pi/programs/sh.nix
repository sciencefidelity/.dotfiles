{ config, pkgs, ... }:

let
  aliases = {
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    "....." = "cd ../../../..";
    df = "df -kTh";
    ls = "eza -F --group-directories-first";
    l = "eza -AF --group-directories-first";
    la = "eza -lAF --group-directories-first --git";
    ll = "eza -lF --group-directoies-first --git";
    lt = "eza -T --git-ignore";
    lr = "eza -R --git-ignore";
    mkdir = "mkdir -pv";
    rmdir = "rmdir -pv";
    cp = "cp -Rv";
    mv = "mv -iv";
    rm = "rm -rIv";
    du = "du -h -c";
    push = "git push";
    pull = "git fetch origin; git merge origin/main";
    gst = "git status";
    gci = "git commit";
    gco = "git checkout";
    gbr = "git branch";
    lg = "lazygit";
    sysclean = "sudo nix-collect-garbage -d; and sudo nix-store --optimise";
    syshs = "home-manager switch --flake .";
    sysrs = "sudo nixos-rebuild switch --flake .";
  };
in
{
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
    initExtra = ''
      eval "$(ssh-agent -s)" > /dev/null
      ssh-add ~/.ssh/github 2> /dev/null
      export GPG_TTY=$(tty)
      bindkey -v
      bindkey "^ " autosuggest-accept
      bindkey -M menuselect "h" vi-backward-char
      bindkey -M menuselect "k" vi-up-line-or-history
      bindkey -M menuselect "l" vi-forward-char
      bindkey -M menuselect "j" vi-down-line-or-history
      bindkey -v "^?" backward-delete-char
      lfcd() {
        tmp="$(mktemp)"
        lf -last-dir-path="$tmp" "$@"
        if [ -f "$tmp" ]; then
          dir="$(cat "$tmp")"
          rm -f "$tmp"
          [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
        fi
      }
      bindkey -s "^o" "lfcd\n"
      autoload edit-command-line; zle -N edit-command-line
      bindkey "^e" edit-command-line
      atouch() {
        for file_path_info in "$@"; do
          mkdir -p -- "$(dirname -- "$file_path_info")"
          touch -- "$file_path_info"
        done
      }
      mn() { mix new "$@" && cd "$@"; }
      cn() { cargo new "$@" && cd "$@"; }
      gm() { mkdir "$@" && cd "$@" && go mod init github.com/sciencefidelity/"$@"; }
      export PATH="$HOME/.npm-globals/bin:$PATH"
    '';
    initExtraBeforeCompInit = ''
      zstyle ':completion:*' menu select
      zmodload zsh/complist
    '';
    shellAliases = aliases;
    syntaxHighlighting.enable = true;
  };
}
