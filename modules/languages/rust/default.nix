{ pkgs, ... }:

{
  programs.zsh = {
    initExtra = /*bash*/ ''
      # cn = cargo new <app-name>
      # cn() { cargo new --bin "$@" && cd "$@"; }
    '';
  };

  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      ${builtins.readFile ./rust.lua}
      ${builtins.readFile ./snippets.lua}
    '';
  };
}
