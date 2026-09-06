{ ... }:

{
  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter").install({ "haskell" })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "hl" },
        callback = function()
          vim.opt_local.tabstop = 2
          vim.opt_local.softtabstop = 2
          vim.opt_local.shiftwidth = 2
          vim.opt_local.expandtab = true
          vim.opt_local.shiftround = true
        end,
      })

      vim.lsp.enable("hls", {
        filetypes = { "haskell", "lhaskell", "cabal" },
      })

      require("conform").setup({
        formatters_by_ft = {
          haskell = { "stylish-haskell" },
        },
      })
    '';
  };

  home.file = {
    ftHaskell = {
      enable = true;
      target = ".config/nvim/after/ftplugin/haskell.lua";
      text = /*lua*/ ''
        vim.treesitter.start()
      '';
    };
  };
}
