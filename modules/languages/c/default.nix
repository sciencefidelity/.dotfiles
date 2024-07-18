{ config, pkgs, ... }:

let
  platform = config.platform;
in
{
  home = {
    packages = [
      pkgs.clang-tools
      pkgs.lldb
    ] ++ (if platform == "linux" then [ pkgs.gdb pkgs.valgrind ] else [ ]);

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
