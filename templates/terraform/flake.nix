{
  description = "A Terraform devshell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { nixpkgs, ... }:
    let
      inherit (nixpkgs) lib;
      forAllSystems = lib.genAttrs lib.systems.flakeExposed;
    in
    {
      devShells = forAllSystems (
        system:
        let
          overlays = [ ];
          pkgs = import nixpkgs {
            inherit system overlays;
          };
          llm = pkgs.writeShellScriptBin "llm" ''
            ${pkgs.repomix}/bin/repomix \
              --style markdown \
              --no-file-summary \
              --ignore "*.lock" \
              --output "repo.md"
          '';
        in
        with pkgs;
        {
          default = mkShell {
            buildInputs = [
              terraform
              terraform-lsp
              terraform-providers.azurerm
              tflint

              # scripts
              llm
            ];
          };
        }
      );
    };
}
