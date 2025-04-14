{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    escapeTime = 0;
    extraConfig = ''
      set-option -sa terminal-overrides ",xterm*:Tc"
      set -g status-bg "#1e1e2e"
      setw -g mouse on
    '';
    keyMode = "vi";
    mouse = false;
    newSession = true;
    plugins = [ ];
    prefix = "C-s";
    shell = "${pkgs.zsh}/bin/zsh";
    shortcut = "s";
    terminal = "screen-256color";
  };
}
