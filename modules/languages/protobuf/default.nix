{ ... }:

{
  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "proto" },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "proto" },
        callback = function()
          vim.opt_local.tabstop = 2
          vim.opt_local.softtabstop = 2
          vim.opt_local.shiftwidth = 2
          vim.opt_local.expandtab = true
        end,
      })

      vim.lsp.enable("buf_ls")

      require("conform").setup({
        formatters_by_ft = {
          proto = { "buf" },
        },
      })
    '';
  };
}
