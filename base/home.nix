{ config, ... }:

let
  username = config.username;
  homeDirectory = "/home/${username}";
  stateVersion = config.stateVersion;
in
{
  imports = [
    ../modules/files/hushlogin
    ../modules/languages/go
    ../modules/languages/haskell
    ../modules/languages/kotlin
    ../modules/languages/lua
    ../modules/languages/nix
    ../modules/languages/protobuf
    ../modules/languages/python
    ../modules/languages/ocaml
    ../modules/languages/rust
    ../modules/languages/sql
    ../modules/languages/svelte
    ../modules/languages/tera
    ../modules/languages/typescript
    ../modules/packages/nixpkgs
    ../modules/programs/direnv
    ../modules/programs/eza
    ../modules/programs/git
    ../modules/programs/gnupg
    ../modules/programs/neovim
    ../modules/programs/rhea
    ../modules/programs/tmux
    ../modules/programs/zsh
  ];

  home = {
    username = config.username;
    homeDirectory = homeDirectory;
    stateVersion = stateVersion;
  };

  programs.home-manager.enable = true;
}
