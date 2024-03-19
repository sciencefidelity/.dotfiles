{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      jdk
      jdt-language-server
      maven
    ];
  };

  programs.java = {
    enable = true;
  };

  programs.zsh = {
    initExtra = ''
      ${builtins.readFile ./java.sh}
    '';
  };

  programs.neovim = {
    extraLuaConfig = ''
      ${builtins.readFile ./java.lua}
    '';
  };
}
