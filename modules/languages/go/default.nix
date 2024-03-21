{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      go
      goimports-reviser
      golines
      gopls
    ];
  };

  programs.go = {
    enable = true;
    packages = { };
    goBin = ".local/bin.go";
    goPath = null;
  };

  programs.zsh = {
    initExtra = ''
      # gm - go mod init <module-name>
      gm() { mkdir "$@" && cd "$@" && go mod init github.com/sciencefidelity/"$@"; }
    '';
  };

  programs.neovim = {
    extraLuaConfig = ''
      ${builtins.readFile ./go.lua}
    '';
  };
}
