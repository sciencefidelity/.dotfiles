{ ... }:

{
  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      ${builtins.readFile ./rust.lua}
      ${builtins.readFile ./snippets.lua}
    '';
  };
}
