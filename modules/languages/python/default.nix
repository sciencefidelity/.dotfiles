{ ... }:

{
  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "python" },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "py" },
        callback = function()
          vim.opt_local.tabstop = 4
          vim.opt_local.softtabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.expandtab = true
        end,
      })

      vim.lsp.enable("pyright")

      require("conform").setup({
        formatters_by_ft = {
          python = { "black" },
        },
      })
    '';
  };
}
