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
    initExtra = /*bash*/ ''
      # ln - lein new app <app-name>
      ln() { lein new app "$@" && cd "$@"; }
    '';
  };

  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      ${builtins.readFile ./clojure.lua}
    '';
  };
}
