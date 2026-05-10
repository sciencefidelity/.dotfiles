{ ... }:

{
  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter").install({ "tera" })
    '';
  };

  home.file = {
    ftTera = {
      enable = true;
      target = ".config/nvim/after/ftplugin/tera.lua";
      text = /*lua*/ ''
        vim.treesitter.start()
      '';
    };
  };
}
