{
  description = "A Rust devshell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, rust-overlay, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
      in
      with pkgs;
      {
        devShells.default = mkShell {
          buildInputs = [
            pkg-config
            taplo
            (rust-bin.stable.latest.default.override {
              extensions = [ "rust-analyzer" "rust-src" ];
            })
          ];

          shellHook = /*bash*/ ''
          ''
          # enable mold linker for Linux
          + pkgs.lib.optionalString pkgs.stdenv.isLinux /*bash*/ ''
            export RUSTFLAGS="-C linker=clang -C link-arg=-fuse-ld=${pkgs.mold-wrapped}/bin/mold"
          '';
        };
      }
    );
}

