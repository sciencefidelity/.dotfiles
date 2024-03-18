{ pkgs, ... }:

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
    touch = "atouch";
    mkdir = "mkdir -pv";
    rmdir = "rmdir -pv";
    cp = "cp -Rv";
    mv = "mv -iv";
    rm = "rm -rIv";
    sysclean = "sudo nix-collect-garbage -d; and sudo nix-store --optimise";
    syshs = "home-manager switch --flake .";
    sysrs = "sudo nixos-rebuild switch --flake .";
  };
in
{
  home = {
    packages = with pkgs; [
      zsh-autosuggestions
      zsh-syntax-highlighting
    ];

    sessionVariables = {
      COLORTERM = "truecolor";
      KEYTIMEOUT = "1";
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
    initExtra = ''
      ${builtins.readFile ./config/init.sh}
      ${builtins.readFile ./config/functions.sh}
      ${builtins.readFile ./config/keybindings.sh}
    '';
    initExtraBeforeCompInit = ''
      zstyle ':completion:*' menu select
      zmodload zsh/complist
    '';
    shellAliases = aliases;
    syntaxHighlighting.enable = true;
  };
}
