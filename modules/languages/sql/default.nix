{ ... }:

{
  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter").install({ "sql" })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql" },
        callback = function()
          vim.opt_local.tabstop = 4
          vim.opt_local.softtabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.expandtab = true
        end,
      })

      vim.lsp.enable("sqruff")

      require("conform").setup({
        formatters_by_ft = {
          sql = { "sqruff" },
        },
      })
    '';
  };

  home.file = {
    ftSql = {
      enable = true;
      target = ".config/nvim/after/ftplugin/sql.lua";
      text = /*lua*/ ''
        vim.treesitter.start()
      '';
    };
  };
}
