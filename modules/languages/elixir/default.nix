{ ... }:

{
  home = {
    file.iex = {
      enable = true;
      target = ".iex.exs";
      source = ./iex.exs;
    };
  };

  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      ${builtins.readFile ./elixir.lua}
    '';
  };
}
