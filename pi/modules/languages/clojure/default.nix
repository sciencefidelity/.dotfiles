{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      cljfmt
      clojure
      clojure-lsp
      leiningen
    ];
  };

  programs.zsh = {
    initExtra = ''
      # ln - lein new app <app-name>
      ln() { lein new app "$@" && cd "$@"; }
    '';
  };

  programs.neovim = {
    extraLuaConfig = ''
      ${builtins.readFile ./clojure.lua}
    '';
  };
}
