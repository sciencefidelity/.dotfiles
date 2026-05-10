{ ... }:

{
  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter").install({ "java" })

      vim.lsp.enable("jdtls")

      require("conform").setup({
        formatters_by_ft = {
          java = {},
        },
      })
    '';
  };

  home.file = {
    ftJava = {
      enable = true;
      target = ".config/nvim/after/ftplugin/java.lua";
      text = /*lua*/ ''
        vim.treesitter.start()
      '';
    };
  };
}
