{
  description = "A Bun devshell";

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
            bun
            eslint_d
            nodePackages.prettier
            svelte-language-server
            typescript
            typescript-language-server
          ];

          shellHook = /*bash*/ ''
          '';
        };
      }
    );
}

