{ ... }:

{
  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      ${builtins.readFile ./clojure.lua}
    '';
  };
}
