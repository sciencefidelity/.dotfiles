{ ... }:

{
  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "javascript", "tsx", "typescript" },
      })

      require("lspconfig").ts_ls.setup({})

      require("conform").setup({
        formatters_by_ft = {
          jsx = { "prettier" },
          javascript = { "prettier" },
          tsx = { "prettier" },
          typescript = { "prettier" },
        },
      })
      ${builtins.readFile ./snippets.lua}
    '';
  };
}
