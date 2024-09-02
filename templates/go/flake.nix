{
  description = "A Go devshell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
      in
      with pkgs;
      {
        devShells.default = mkShell {
          buildInputs = [
            air
            go
            goimports-reviser
            golines
            gopls
          ];

          shellHook = /*bash*/ ''
            # gen - generate a new Go project in the current director.
            # Name of current folder will be used for project name.
            gen() { go mod init github.com/sciencefidelity"$(basename $PWD)"; }
          '';
        };
      }
    );
}
