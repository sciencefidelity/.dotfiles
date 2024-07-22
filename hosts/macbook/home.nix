{ config, ... }:

let
  username = config.username;
  homeDirectory = "/Users/${config.username}";
  stateVersion = config.stateVersion;
in
{
  imports = [
    ./config.nix
    ../../modules/applications/wezterm
    ../../modules/files/hushlogin
    ../../modules/files/karabiner
    ../../modules/languages/c
    ../../modules/languages/clojure
    ../../modules/languages/elixir
    ../../modules/languages/go
    ../../modules/languages/java
    ../../modules/languages/lua
    ../../modules/languages/nix
    ../../modules/languages/rust
    ../../modules/languages/svelte
    ../../modules/languages/typescript
    ../../modules/languages/zig
    ../../modules/packages/nixpkgs
    ../../modules/programs/eza
    ../../modules/programs/git
    ../../modules/programs/neovim
    ../../modules/programs/zsh
  ];

  home = {
    homeDirectory = homeDirectory;

    stateVersion = stateVersion;

    username = username;
  };

  programs = {
    home-manager.enable = true;
  };
}
