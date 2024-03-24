{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      nixd
      nixpkgs-fmt
    ];
  };

  programs.neovim = {
    extraLuaConfig = ''
      ${builtins.readFile ./nix.lua}
    '';
  };
}
