{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      lua-language-server
    ];
  };

  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      ${builtins.readFile ./lua.lua}
    '';
  };
}
