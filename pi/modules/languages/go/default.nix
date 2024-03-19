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
      ${builtins.readFile ./go.sh}
    '';
  };

  programs.neovim = {
    extraLuaConfig = ''
      ${builtins.readFile ./go.lua}
    '';
  };
}
