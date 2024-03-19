{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      clang-tools
      gdb
      valgrind
    ];
  };

  programs.neovim = {
    extraLuaConfig = ''
      ${builtins.readFile ./c.lua}
    '';
  };
}
