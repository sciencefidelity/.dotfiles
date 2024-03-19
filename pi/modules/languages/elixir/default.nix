{ pkgs, ... }:

{
  home = {
    file.iex = {
      enable = true;
      target = ".iex.exs";
      source = ./iex.exs;
    };

    packages = with pkgs; [
      elixir
      elixir-ls
      erlang
    ];
  };

  programs.zsh = {
    initExtra = ''
      ${builtins.readFile ./elixir.sh}
    '';
  };

  programs.neovim = {
    extraLuaConfig = ''
      ${builtins.readFile ./elixir.lua}
    '';
  };
}
