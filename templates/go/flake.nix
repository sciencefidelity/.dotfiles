{
  description = "A Go devshell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { nixpkgs, ... }:
    let
      inherit (nixpkgs) lib;
      forAllSystems = lib.genAttrs lib.systems.flakeExposed;
    in
    {
      devShells = forAllSystems
        (
          system:
          let
            overlays = [ ];
            pkgs = import nixpkgs {
              inherit system overlays;
            };
            gen = pkgs.writeShellScriptBin "gen" ''
              go mod init github.com/sciencefidelity"$(basename $PWD)";
            '';
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
            buildInputs = mkShell
              {
                packages = [
                  air
                  go
                  goimports-reviser
                  golines
                  gopls

                  # scripts
                  gen
                  llm
                ];
              };
          }
        );
    };
}
