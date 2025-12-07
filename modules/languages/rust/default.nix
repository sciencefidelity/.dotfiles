{ ... }:

{
  programs.neovim = {
    extraLuaConfig = /*lua*/ ''
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "rust" },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "rs" },
        callback = function()
          vim.opt_local.tabstop = 4
          vim.opt_local.softtabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.expandtab = true
        end,
      })

      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust_analyzer"] = {
            diagnostics = { enable = false },
            cargo = { features = "all" },
          },
        },
      })
      vim.lsp.enable("rust_analyzer");

      require("conform").setup({
        formatters_by_ft = {
          rust = { "rustfmt" },
        },
      })
      ${builtins.readFile ./snippets.lua}
    '';
  };
}
