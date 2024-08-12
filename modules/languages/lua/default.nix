{ ... }:

{
  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      ${builtins.readFile ./lua.lua}
    '';
  };
}
