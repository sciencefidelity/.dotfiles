{ ... }:

{
  programs.go = {
    enable = false;
    goBin = ".local/bin.go";
    goPath = null;
  };

  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      ${builtins.readFile ./go.lua}
    '';
  };
}
