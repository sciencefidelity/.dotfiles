{ ... }:

{
  programs.go = {
    enable = false;
    packages = { };
    goBin = ".local/bin.go";
    goPath = null;
  };

  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      ${builtins.readFile ./go.lua}
    '';
  };
}
