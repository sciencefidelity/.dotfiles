{
  description = "A Rust devshell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
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
          watch = pkgs.writeShellScriptBin "watch" ''
            ${pkgs.watchexec}/bin/watchexec -e rs -r cargo run
          '';
        in
        with pkgs;
        {
          default = mkShell {
            packages = [
              pkg-config
              taplo
              (rust-bin.stable.latest.default.override {
                extensions = [ "rust-analyzer" "rust-src" ];
              })

              # scripts
              llm
              watch
            ];

            # enable Mold linker for Linux
            RUSTFLAGS = lib.optionals stdenv.hostPlatform.isLinux "-C linker=${clang}/bin/clang -C link-arg=-fuse-ld=${mold}/bin/mold";
          };
        }
      );
    };
}

