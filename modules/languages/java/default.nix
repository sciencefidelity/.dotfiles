{ ... }:

{
  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "java" },
      })

      require("lspconfig").jdtls.setup({})

      require("conform").setup({
        formatters_by_ft = {
          java = {},
        },
      })
    '';
  };
}
