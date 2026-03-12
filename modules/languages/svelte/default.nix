{ ... }:

{
  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "svelte" },
      })

      vim.lsp.enable("svelte")

      require("conform").setup({
        formatters_by_ft = {
          svelte = { "prettierd", "prettier", stop_after_first = true },
        },
      })
    '';
  };
}
