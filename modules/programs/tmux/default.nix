{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    escapeTime = 0;
    extraConfig = ''
      set -g status-bg "#1e1e2e"
    '';
    keyMode = "vi";
    mouse = false;
    newSession = true;
    plugins = [ ];
    prefix = "C-a";
    shell = "${pkgs.zsh}/bin/zsh";
    shortcut = "a";
    terminal = "screen-256color";
  };
}
