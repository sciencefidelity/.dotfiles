{
  description = "A Clojure devshell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
      in
      with pkgs;
      {
        devShells.default = mkShell {
          buildInputs = [
            cljfmt
            clojure
            clojure-lsp
            jdk
            leiningen
          ];

          shellHook = /*bash*/ ''
            # gen - generate project with Leiningen.
            # Name of current folder will be used for project name.
            gen() { lein new $(basename $PWD) --to-dir . --force; }
          '';
        };
      }
    );
}
