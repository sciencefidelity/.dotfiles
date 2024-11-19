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
    ../../modules/languages/go
    ../../modules/languages/lua
    ../../modules/languages/nix
    ../../modules/languages/rust
    ../../modules/languages/python
    ../../modules/languages/svelte
    ../../modules/languages/terraform
    ../../modules/languages/typescript
    ../../modules/packages/nixpkgs
    ../../modules/programs/direnv
    ../../modules/programs/eza
    ../../modules/programs/git
    ../../modules/programs/gnupg
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
