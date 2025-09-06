{
  description = "A Tauri devshell";

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
            bun
            cocoapods
            nodejs_latest
            eslint_d
            pkg-config
            nodePackages.prettier
            svelte-language-server
            typescript
            typescript-language-server
            taplo
            (rust-bin.stable.latest.default.override {
              extensions = [ "rust-analyzer" "rust-src" ];
              targets = [ "aarch64-apple-ios" "x86_64-apple-ios" "aarch64-apple-ios-sim" ];
            })
          ];

          shellHook = /*bash*/ ''
          '';
        };
      }
    );
}


