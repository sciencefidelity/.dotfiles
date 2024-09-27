{ ... }:

{
  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "clojure" },
      })

      require("lspconfig").clojure_lsp.setup({})

      require("conform").setup({
        formatters_by_ft = {
          clojure = { "cljfmt" },
        },
      })
    '';
  };
}
