{ ... }:

{
  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      ${builtins.readFile ./typescript.lua}
    '';
  };
}
