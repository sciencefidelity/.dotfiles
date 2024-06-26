{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      air
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
    initExtra = /*bash*/ ''
      # gm - go mod init <module-name>
      gm() { mkdir "$@" && cd "$@" && go mod init github.com/sciencefidelity/"$@"; }
    '';
  };

  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      ${builtins.readFile ./go.lua}
    '';
  };
}
