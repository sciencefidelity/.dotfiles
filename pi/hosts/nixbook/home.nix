{ config, pkgs, ... }:

{
  imports = [
    ../../system/config.nix
    ../../modules/applications/hyprland
    ../../modules/applications/wezterm
    ../../modules/files/hushlogin
    ../../modules/languages/c
    ../../modules/languages/clojure
    ../../modules/languages/elixir
    ../../modules/languages/go
    ../../modules/languages/java
    ../../modules/languages/lua
    ../../modules/languages/nix
    ../../modules/languages/rust
    ../../modules/languages/zig
    ../../modules/programs/eza
    ../../modules/programs/git
    ../../modules/programs/gnupg
    ../../modules/programs/neovim
    ../../modules/programs/zsh
    ../../modules/utils
  ];

  home = {
    username = "matt";
    homeDirectory = "/home/matt";
    stateVersion = "23.11";
  };

  # TODO: make this conditional with a global variable to switch it.
  programs.neovim = {
    extraLuaConfig = ''
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    '';
  };
}
