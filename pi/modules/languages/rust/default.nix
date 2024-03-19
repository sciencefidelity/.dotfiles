{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      rustup
    ];
  };

  programs.zsh = {
    initExtra = ''
      ${builtins.readFile ./rust.sh}
    '';
  };

  programs.neovim = {
    extraLuaConfig = ''
      ${builtins.readFile ./rust.lua}
    '';
  };
}
