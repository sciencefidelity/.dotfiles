{ pkgs, ... }:

{
  home = {
    file.iex = {
      enable = true;
      target = ".iex.exs";
      source = ./config/iex.exs;
    };

    packages = with pkgs; [
      elixir
      elixir-ls
      erlang
    ];
  };

  programs.zsh = {
    initExtra = ''
      ${builtins.readFile ./config/functions.sh}
    '';
  };
}
