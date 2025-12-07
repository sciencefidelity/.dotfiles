{ ... }:

{
  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "sql" },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql" },
        callback = function()
          vim.opt_local.tabstop = 4
          vim.opt_local.softtabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.expandtab = true
        end,
      })

      require("conform").setup({
        formatters_by_ft = {
          sql = { "sqruff" },
        },
      })
    '';
  };
}
