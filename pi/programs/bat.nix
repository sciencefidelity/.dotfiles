{ config, pkgs, ... }:

{
  programs.bat = {
    enable = true;
    config = {
      theme = "Catppuccin-mocha";
      italic-text = "always";
      style = "full";
      map-syntax = [
        ".eslintignore:Git Ignore"
        ".prettierignore:Git Ignore"
        ".prettierrc:JSON"
      ];
    };
    themes = {
      Catppuccin-mocha = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "26c57ec282abcaa76e57e055f38432bd827ac34e";
          sha256 = "sha256-6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
        };
        file = "Catppuccin-mocha.tmTheme";
      };
    };
  };
}
