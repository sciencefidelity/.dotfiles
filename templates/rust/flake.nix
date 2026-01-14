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
        check = pkgs.writeShellScriptBin "check" ''
          cargo fmt --check
          cargo clippy --tests
        '';
        cov = pkgs.writeShellScriptBin "cov" ''
          cargo llvm-cov --html
        '';
        ct = pkgs.writeShellScriptBin "ct" ''
          cargo test
        '';
        format = pkgs.writeShellScriptBin "format" ''
          cargo fmt
        '';
        run = pkgs.writeShellScriptBin "run" ''
          cargo run | ${pkgs.bunyan-rs}/bin/bunyan
        '';
        watch = pkgs.writeShellScriptBin "watch" ''
          ${pkgs.watchexec}/bin/watchexec -e rs -r cargo run
        '';
      in
      with pkgs;
      {
        devShells.default = mkShell {
          nativeBuildInputs = [
            check
            cov
            ct
            format
            pkg-config
            run
            watch
          ];

          buildInputs = [
            taplo
            (rust-bin.stable.latest.default.override {
              extensions = [ "llvm-tools-preview" "rust-analyzer" "rust-src" ];
            })
            (import ./scripts/init.nix { inherit pkgs; })
          ] ++ lib.optionals stdenv.isLinux [ pkgs.cargo-llvm-cov pkgs.clang pkgs.mold ];

          # enable mold linker for Linux
          RUSTFLAGS = if pkgs.stdenv.isLinux then "-C linker=clang -C link-arg=-fuse-ld=${pkgs.mold}/bin/mold" else "";

          shellHook = /*bash*/ ''
          '';
        };
      }
    );
}

