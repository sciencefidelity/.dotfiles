{ config, ... }:

let
  username = config.username;
  homeDirectory = "/home/${username}";
  stateVersion = config.stateVersion;
in
{
  imports = [
    ./system/config.nix
    ./modules/files/hushlogin
    ./modules/packages/nixpkgs
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
  ];

  home = {
    username = config.username;
    homeDirectory = homeDirectory;
    stateVersion = stateVersion;
  };
}
