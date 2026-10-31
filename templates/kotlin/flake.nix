{
  description = "An Android devshell";

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
          detekt = pkgs.writeShellScriptBin "detekt" ''
            ./gradlew --warning-mode none detekt
          '';
          llm = pkgs.writeShellScriptBin "llm" ''
            ${pkgs.repomix}/bin/repomix \
              --style markdown \
              --no-file-summary \
              --ignore "app/src/main/res, *.lock" \
              --output "repo.md"
          '';
        in
        with pkgs;
        {
          default = mkShell {
            nativeBuildInputs = [
            ];

            buildInputs = [
              jdk
              ktlint

              # scripts
              detekt
              llm
            ];
          };
        }
      );
    };
}


