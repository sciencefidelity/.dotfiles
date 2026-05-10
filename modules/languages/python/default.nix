{ ... }:

{
  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter").install({ "python" })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "py" },
        callback = function()
          vim.opt_local.tabstop = 4
          vim.opt_local.softtabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.expandtab = true
          vim.opt_local.shiftround = true
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "py" },
        callback = function() vim.treesitter.start() end,
      })

      require("conform").setup({
        formatters_by_ft = {
          python = { "ruff_format" },
        },
      })
    '';
  };

  home.file = {
    ftPython = {
      enable = true;
      target = ".config/nvim/after/ftplugin/python.lua";
      text = /*lua*/ ''
        vim.treesitter.start()
      '';
    };
  };
}
