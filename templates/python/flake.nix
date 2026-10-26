{
  description = "A Python devshell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      inherit (nixpkgs) lib;
      forAllSystems = lib.genAttrs lib.systems.flakeExposed;
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          llm = pkgs.writeShellScriptBin "llm" ''
            ${pkgs.repomix}/bin/repomix \
              --style markdown \
              --no-file-summary \
              --ignore ".envrc, .gitignore, flake.lock, flake.nix" \
              --output "repo.md"
          '';
          uvs = pkgs.writeShellScriptBin "uvs" ''
            uv sync --all-packages
          '';
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              pyright
              python312
              ruff
              taplo
              uv

              # scripts
              llm
              uvs
            ];

            env = lib.optionalAttrs pkgs.stdenv.isLinux {
              # Python libraries often load native shared objects using dlopen(3).
              # Setting LD_LIBRARY_PATH makes the dynamic library loader aware of libraries without using RPATH for lookup.
              LD_LIBRARY_PATH = lib.makeLibraryPath pkgs.pythonManylinuxPackages.manylinux1;
            };

            shellHook = /*bash*/ ''
              unset PYTHONPATH
              uv sync --all-packages
              . .venv/bin/activate
            '';
          };
        }
      );
    };
}

