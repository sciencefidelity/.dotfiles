{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      zig
      zls
    ];
  };

  programs.zsh = {
    initExtra = ''
      ${builtins.readFile ./zig.sh}
    '';
  };

  programs.neovim = {
    extraLuaConfig = ''
      ${builtins.readFile ./zig.lua}
    '';
  };
}
