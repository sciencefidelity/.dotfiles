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
      ${builtins.readFile ./clojure.sh}
    '';
  };

  programs.neovim = {
    extraLuaConfig = ''
      ${builtins.readFile ./clojure.lua}
    '';
  };
}
