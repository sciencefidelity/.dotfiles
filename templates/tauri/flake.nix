{
  description = "A Tauri devshell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { nixpkgs, rust-overlay, ... }:
    let
      inherit (nixpkgs) lib;
      forAllSystems = lib.genAttrs lib.systems.flakeExposed;
    in
    {
      devShells = forAllSystems (
        system:
        let
          overlays = [ (import rust-overlay) ];
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
              bun
              cocoapods
              nodejs
              eslint_d
              pkg-config
              prettierd
              svelte-language-server
              typescript
              typescript-language-server
              taplo
              (rust-bin.stable.latest.default.override {
                extensions = [ "rust-analyzer" "rust-src" ];
                targets = [ "aarch64-apple-ios" "x86_64-apple-ios" "aarch64-apple-ios-sim" ];
              })

              # scripts
              llm
            ];
          };
        }
      );
    };
}

