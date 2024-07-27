{
  description = "A Java devshell";

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
            jdk
            jdt-language-server
            maven
          ];

          shellHook = /*bash*/ ''
            # gen - generate a new project with maven.
            # Name of current folder will be used for project name.
            gen() { mvn -B archetype:generate \
              -DgroupId=com.sciencefidelity."$(basename $PWD)" \
              -DartifactId="$(basename $PWD)" \
              -DarchetypeArtifactId=maven-archetype-quickstart \
              -DarchetypeVersion=1.4 }
          '';
        };
      }
    );
}
