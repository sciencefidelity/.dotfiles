{ ... }:

{
  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter").install({ "kotlin" })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "kotlin" },
        callback = function()
          vim.opt_local.tabstop = 4
          vim.opt_local.softtabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.expandtab = true
          vim.treesitter.start()
        end,
      })

      vim.lsp.enable("kotlin_language_server")

      require("conform").setup({
        formatters_by_ft = {
          kotlin = { "ktlint" },
        },
      })
    '';
  };

  home.file = {
    ftKotlin = {
      enable = true;
      target = ".config/nvim/after/ftplugin/kotlin.lua";
      text = /*lua*/ ''
        vim.treesitter.start()
      '';
    };
  };
}
