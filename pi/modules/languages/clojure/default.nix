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
      ${builtins.readFile ./functions.sh}
    '';
  };
}
