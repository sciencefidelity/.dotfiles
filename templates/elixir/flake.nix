{
  description = "An Elixir devshell";

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
          default = mkShell {
            buildInputs = [
              elixir
              elixir-ls
              erlang

              # scripts
              llm
            ];

            shellHook = /*bash*/ ''
              # gen - generate project with Mix.
              # Name of current folder will be used for project name.
              gen() { mix new . $(basename $PWD); }
            '';
          };
        }
      );
    };
}
