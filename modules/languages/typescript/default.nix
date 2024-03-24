{ config, lib, pkgs, ... }:

{
  home = {
    packages = with pkgs; with nodePackages; [
      nodejs_20
      eslint_d
      typescript
      typescript-language-server
      pnpm
    ];
  };

  # programs.zsh = {
  #   initExtra = ''
  #   '';
  # };

  programs.neovim = {
    extraLuaConfig = ''
      ${builtins.readFile ./typescript.lua}
    '';
  };
}
