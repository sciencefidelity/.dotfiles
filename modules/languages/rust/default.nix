{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      cargo-audit
      cargo-expand
      cargo-tarpaulin
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
