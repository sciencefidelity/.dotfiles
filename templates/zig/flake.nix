{
  description = "A Zig devshell";

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
            zig
            zls
          ];

          shellHook = /*bash*/ ''
            # zie = zig init-exe <app-name>
            zie() { zig init-exe; }
            # zil = zig init-lib <lib-name>
            zil() { zig init-lib; }
          '';
        };
      }
    );
}
