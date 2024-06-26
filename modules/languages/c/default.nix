{ config, pkgs, ... }:

let
  platform = config.platform;
in
{
  home = {
    packages = with pkgs; [
      clang-tools
      lldb
    ] ++ (if platform == "linux" then with pkgs; [ gdb valgrind ] else [ ]);

    file =
      if platform == "linux" then {
        gdbinit = {
          enable = true;
          target = ".gdbinit";
          text = /*bash*/ ''
            set disassembly intel
          '';
        };
      } else { };
  };

  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      ${builtins.readFile ./c.lua}
    '';
  };
}
