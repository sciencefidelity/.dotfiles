{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      neovim-unwrapped
    ];

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "${config.home.sessionVariables.EDITOR}";
    };
  };

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    defaultEditor = true;
    extraLuaConfig = ''
      ${builtins.readFile ./config/init.lua}
    '';
    withNodeJs = true;
    viAlias = true;
    vimAlias = true;
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
