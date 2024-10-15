{ ... }:

{
  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "javascript", "tsx", "typescript" },
      })

      require("lspconfig").tsserver.setup({})

      require("conform").setup({
        formatters_by_ft = {
          jsx = { "prettierd" },
          javascript = { "prettierd" },
          tsx = { "prettierd" },
          typescript = { "prettierd" },
        },
      })
    '';
  };
}
