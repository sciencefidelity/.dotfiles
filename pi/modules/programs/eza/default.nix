{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      eza
    ];

    shellAliases = {
      ls = "eza -F";
    };
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    git = true;
    extraOptions = [
      "--group-directories-first"
    ];
  };
}
