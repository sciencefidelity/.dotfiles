{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      jdk
      jdt-language-server
      maven
    ];
  };

  programs.java = {
    enable = true;
  };

  programs.zsh = {
    initExtra = /*bash*/ ''
      # mvg - mvn generate
      mvg() {
        mvn -B archetype:generate \
          -DgroupId=com.sciencefidelity."$@" \
          -DartifactId="$@" \
          -DarchetypeArtifactId=maven-archetype-quickstart \
          -DarchetypeVersion=1.4
        cd "$@";
      }
    '';
  };

  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      ${builtins.readFile ./java.lua}
    '';
  };
}
