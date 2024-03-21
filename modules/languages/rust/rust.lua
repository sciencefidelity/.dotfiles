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

require("lspconfig").rust_analyzer.setup({
  ["rust_analyzer"] = {
    settings = {
      diagnostics = { enable = false },
      cargo = { features = "all" },
      checkOnSave = { command = "clippy" },
    },
  },
})

require("conform").setup({
  formatters_by_ft = {
    rust = { "rustfmt" },
  },
})
