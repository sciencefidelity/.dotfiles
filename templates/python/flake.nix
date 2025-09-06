{
  description = "A Terraform devshell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
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
            pkgs.black
            pkgs.pyright
            (pkgs.python3.withPackages (python-pkgs: [
              python-pkgs.pandas
            ]))
          ];

          shellHook = /*bash*/ ''
            # python -m venv .venv --copies
          '';
        };
      }
    );
}
