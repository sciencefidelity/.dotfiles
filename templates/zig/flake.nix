{
  description = "A Zig devshell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
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
          devShells.default = mkShell {
            buildInputs = [
              zig
              zls

              # scripts
              llm
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
    };
}
