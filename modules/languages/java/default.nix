{ ... }:

{
  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "java" },
      })

      vim.lsp.enable("jdtls")

      require("conform").setup({
        formatters_by_ft = {
          java = {},
        },
      })
    '';
  };
}
