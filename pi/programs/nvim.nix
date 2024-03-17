{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    defaultEditor = true;
    extraLuaConfig = ''
      ${builtins.readFile ../config/nvim/init.lua}
    '';
    withNodeJs = true;
    viAlias = true;
    vimAlias = true;
  };

  xdg.configFile.nvim = {
    source = ../config/nvim;
    recursive = true;
  };
}
