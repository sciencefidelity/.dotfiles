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
    initExtra = /*bash*/ ''
      # mn - mix new <app-name>
      mn() { mix new "$@" && cd "$@"; }
    '';
  };

  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      ${builtins.readFile ./elixir.lua}
    '';
  };
}
