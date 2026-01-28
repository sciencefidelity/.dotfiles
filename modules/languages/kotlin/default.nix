{ ... }:

{
  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "kotlin" },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "kt" },
        callback = function()
          vim.opt_local.tabstop = 4
          vim.opt_local.softtabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.expandtab = true
          vim.treesitter.start()
        end,
      })

      vim.lsp.enable("kotlin_lsp")

      require("conform").setup({
        formatters_by_ft = {
          kotlin = { "ktfmt" },
        },
      })

      require("conform").formatters.ktfmt = {
        append_args = { "--kotlinlang-style" },
      }
    '';
  };
}
