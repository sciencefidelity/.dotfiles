{ config, ... }:

let
  username = config.username;
  homeDirectory = "/home/${username}";
  stateVersion = config.stateVersion;
in
{
  imports = [
    ../modules/files/hushlogin
    ../modules/languages/c
    ../modules/languages/clojure
    ../modules/languages/elixir
    ../modules/languages/go
    ../modules/languages/java
    ../modules/languages/lua
    ../modules/languages/nix
    ../modules/languages/perl
    ../modules/languages/rust
    ../modules/languages/typescript
    ../modules/languages/zig
    ../modules/packages/nixpkgs
    ../modules/programs/direnv
    ../modules/programs/eza
    ../modules/programs/git
    ../modules/programs/gnupg
    ../modules/programs/neovim
    ../modules/programs/zsh
  ];

  home = {
    username = config.username;
    homeDirectory = homeDirectory;
    stateVersion = stateVersion;
  };

  programs.home-manager.enable = true;
}
