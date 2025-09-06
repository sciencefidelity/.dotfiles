{
  description = "A Node devshell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
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
            eslint_d
            nodejs_latest
            pnpm
            nodePackages.prettier
            typescript
            typescript-language-server
          ];

          shellHook = /*bash*/ ''
          '';
        };
      }
    );
}
