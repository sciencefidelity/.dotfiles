{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    lua5_4_compat
    lua-language-server
    stylua
  ];
  shellHook = /*bash*/ ''
    git pull
  '';
}
