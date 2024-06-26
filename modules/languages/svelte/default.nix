{ config, lib, pkgs, ... }:

{
  home = {
    packages = with pkgs; with nodePackages; [
      svelte-language-server
    ];
  };

  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      ${builtins.readFile ./svelte.lua}
    '';
  };
}
