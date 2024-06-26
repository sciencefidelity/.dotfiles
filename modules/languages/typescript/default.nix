{ config, lib, pkgs, ... }:

{
  home = {
    packages = with pkgs; with nodePackages; [
      eslint_d
      nodejs_22
      pnpm
      typescript
      typescript-language-server
      yarn
    ];
  };

  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      ${builtins.readFile ./typescript.lua}
    '';
  };
}
