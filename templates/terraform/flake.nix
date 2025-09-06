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
          config.allowUnfree = true;
        };
      in
      with pkgs;
      {
        devShells.default = mkShell {
          buildInputs = [
            terraform
            terraform-lsp
            terraform-providers.azurerm
            tflint
          ];

          shellHook = /*bash*/ ''
          '';
        };
      }
    );
}
