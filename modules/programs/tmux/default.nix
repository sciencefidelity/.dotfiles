{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "screen-256color";
  };
}
