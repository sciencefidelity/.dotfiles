{
  description = "An Elixir devshell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
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
            elixir
            elixir-ls
            erlang
          ];

          shellHook = /*bash*/ ''
            # gen - generate project with Mix.
            # Name of current folder will be used for project name.
            gen() { mix new . $(basename $PWD); }
          '';
        };
      }
    );
}
