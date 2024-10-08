{ ... }:

{
  programs.go = {
    enable = false;
    goBin = ".local/bin.go";
    goPath = null;
  };

  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "go", "gomod", "gosum", "gotmpl", "gowork" },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "go" },
        callback = function()
          vim.opt_local.tabstop = 4
          vim.opt_local.softtabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.expandtab = false
        end,
      })

      require("lspconfig").gopls.setup({
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

      require("conform").setup({
        formatters_by_ft = {
          go = { "gofmt", "golines", "goimports-reviser" },
        },
      })
    '';
  };
}
