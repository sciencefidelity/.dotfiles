{
  description = "An Android devshell";

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
        detekt = pkgs.writeShellScriptBin "detekt" ''
          ./gradlew --warning-mode none detekt
        '';
        llm = pkgs.writeShellScriptBin "llm" ''
          ${pkgs.repomix}/bin/repomix --style markdown --no-file-summary --ignore "app/src/main/res"
        '';
      in
      with pkgs;
      {
        devShells.default = mkShell {
          nativeBuildInputs = [
            detekt
            llm
          ];

          buildInputs = [
            jdk
            ktlint
          ];
        };
      }
    );
}
