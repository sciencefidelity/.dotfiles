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
        watch = pkgs.writeShellScriptBin "watch" ''
          ${pkgs.watchexec}/bin/watchexec -e rs -r cargo run
        '';
      in
      with pkgs;
      {
        devShells.default = mkShell {
          nativeBuildInputs = [
            pkg-config
            watch
          ];

          buildInputs = [
            taplo
            (rust-bin.stable.latest.default.override {
              extensions = [
                # "llvm-tools-preview" 
                "rust-analyzer"
                "rust-src"
              ];
            })
          ] ++ lib.optionals stdenv.hostPlatform.isLinux [
            # Temporarily disabled because `direnv allow` is failing.
            # pkgs.cargo-llvm-cov
            pkgs.clang
          ];

          # enable mold linker for Linux
          RUSTFLAGS = lib.optionals stdenv.hostPlatform.isLinux "-C linker=clang -C link-arg=-fuse-ld=${pkgs.mold}/bin/mold";
        };
      }
    );
}

