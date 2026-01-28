{ ... }:

{
  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "kotlin" },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "kotlin" },
        callback = function()
          vim.opt_local.tabstop = 4
          vim.opt_local.softtabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.expandtab = true
          vim.treesitter.start()
        end,
      })

      vim.lsp.enable("kotlin_language_server")

      require("conform").setup({
        formatters_by_ft = {
          kotlin = { "ktlint" },
        },
      })
    '';
  };
}
