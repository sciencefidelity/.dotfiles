{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      zig
      zls
    ];
  };

  programs.zsh = {
    initExtra = ''
      ${builtins.readFile ./functions.sh}
    '';
  };
}
