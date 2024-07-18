{ pkgs, ... }:

{
  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      ${builtins.readFile ./java.lua}
    '';
  };
}
