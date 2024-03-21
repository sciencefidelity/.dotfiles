{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      rustup
    ];
  };

  programs.zsh = {
    initExtra = ''
      # cn = cargo new <app-name>
      cn() { cargo new --bin "$@" && cd "$@"; }
    '';
  };

  programs.neovim = {
    extraLuaConfig = ''
      ${builtins.readFile ./rust.lua}
    '';
  };
}
