{ ... }:

{
  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter").setup({ "gdscript" })

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

  home.file = {
    ftGdscript = {
      enable = true;
      target = ".config/nvim/after/ftplugin/gdscript.lua";
      text = /*lua*/ ''
        vim.treesitter.start()
      '';
    };
  };
}
