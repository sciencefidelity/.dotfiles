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
      ${builtins.readFile ./functions.sh}
    '';
  };
}
