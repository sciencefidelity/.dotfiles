{ ... }:

{
  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter").setup({
        ensure_installed = { "swift" },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "swift" },
        callback = function()
          vim.opt_local.tabstop = 2
          vim.opt_local.softtabstop = 2
          vim.opt_local.shiftwidth = 2
          vim.opt_local.expandtab = true
          vim.treesitter.start()
        end,
      })

      vim.lsp.enable("sourcekit")

      require("conform").setup({
        formatters_by_ft = {
          swift = { "swift" },
        },
      })
    '';
  };
}
