{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  shellHook = /*bash*/ ''
    git pull
  '';
}
