{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      nixd
      nixpkgs-fmt
    ];
  };

  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      ${builtins.readFile ./nix.lua}
    '';
  };
}
