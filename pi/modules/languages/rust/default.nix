{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      rustup
    ];
  };

  programs.zsh = {
    initExtra = ''
      ${builtins.readFile ./functions.sh}
    '';
  };
}
