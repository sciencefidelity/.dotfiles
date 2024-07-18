{ pkgs, ... }:

{
  # home = {
  #   packages = with pkgs; [
  #     lua5_4_compat
  #     lua-language-server
  #     stylua
  #   ];
  # };

  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      ${builtins.readFile ./lua.lua}
    '';
  };
}
