{ ... }:

{
  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
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

      require("lspconfig").pyright.setup({})

      require("conform").setup({
        formatters_by_ft = {
          python = { "black" },
        },
      })
    '';
  };
}
