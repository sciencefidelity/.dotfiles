{ ... }:

{
  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "clojure" },
      })

      vim.lsp.enable("clojure_lsp")

      require("conform").setup({
        formatters_by_ft = {
          clojure = { "cljfmt" },
        },
      })
    '';
  };
}
