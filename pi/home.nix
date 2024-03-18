{ config, pkgs, ... }:

{
  imports = [
    ./modules/files/hushlogin
    ./modules/languages/c
    ./modules/languages/clojure
    ./modules/languages/elixir
    ./modules/languages/go
    ./modules/languages/lua
    ./modules/languages/java
    ./modules/languages/lua
    ./modules/languages/rust
    ./modules/programs/eza
    ./modules/programs/git
    ./modules/programs/gnupg
    ./modules/programs/neovim
    ./modules/programs/zsh
    ./modules/utils
  ];

  home = {
    username = "matt";
    homeDirectory = "/home/matt";
    stateVersion = "23.11";
  };
}
