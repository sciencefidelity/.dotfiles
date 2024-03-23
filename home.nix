{ config, ... }:

let
  username = config.username;
  homeDirectory = "/home/${username}";
  stateVersion = "24.05";
in
{
  imports = [
    ./system/config.nix
    ./modules/files/hushlogin
    ./modules/languages/c
    ./modules/languages/clojure
    ./modules/languages/elixir
    ./modules/languages/go
    ./modules/languages/java
    ./modules/languages/lua
    ./modules/languages/nix
    ./modules/languages/rust
    ./modules/languages/zig
    ./modules/programs/eza
    ./modules/programs/git
    ./modules/programs/gnupg
    ./modules/programs/neovim
    ./modules/programs/zsh
    ./modules/utils
  ];

  home = {
    username = config.username;
    homeDirectory = homeDirectory;
    stateVersion = stateVersion;
  };
}