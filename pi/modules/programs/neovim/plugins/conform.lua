require("conform").setup({
  formatters_by_ft = {
    json = { "prettierd" },
    nix = { "nixpkgs_fmt" },
    yaml = { "prettierd" },
  },
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args) require("conform").format({ bufnr = args.buf }) end,
})
