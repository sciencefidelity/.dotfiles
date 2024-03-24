{ config, pkgs, ... }:

let
  platform = config.platform;
in
{
  home = {
    packages = with pkgs; [
      clang-tools
    ] ++ (if platform == "linux" then with pkgs; [ gdb valgrind ] else [ ]);
  };

  programs.neovim = {
    extraLuaConfig = ''
      ${builtins.readFile ./c.lua}
    '';
  };
}
