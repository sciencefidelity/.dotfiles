{ ... }:

{
  programs.go = {
    enable = false;
    env.GOBIN = ".local/bin.go";
    env.GOPATH = null;
  };

  programs.neovim = {
    initLua = /*lua*/ ''
      require("nvim-treesitter").install({ "go", "gomod", "gosum", "gotmpl", "gowork" })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "go" },
        callback = function()
          vim.opt_local.tabstop = 4
          vim.opt_local.softtabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.expandtab = false
        end,
      })

      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      })
      vim.lsp.enable("gopls")

      require("conform").setup({
        formatters_by_ft = {
          go = { "gofmt", "golines", "goimports-reviser" },
        },
      })
    '';
  };

  home.file = {
    ftGo = {
      enable = true;
      target = ".config/nvim/after/ftplugin/go.lua";
      text = /*lua*/ ''
        vim.treesitter.start()
      '';
    };
  };
}
