{ ... }:

{
  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      ${builtins.readFile ./svelte.lua}
    '';
  };
}
