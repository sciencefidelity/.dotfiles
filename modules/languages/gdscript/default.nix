{ ... }:

{
  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "gdscript" },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "gd" },
        callback = function()
          vim.opt_local.tabstop = 4
          vim.opt_local.softtabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.expandtab = true
        end,
      })

      vim.lsp.enable("gdscript")

      require("conform").setup({
        formatters_by_ft = {
          gdscript = { "gdformat" },
        },
      })
    '';
  };
}
