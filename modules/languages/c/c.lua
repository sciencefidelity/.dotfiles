require("nvim-treesitter.configs").setup({
  ensure_installed = { "c", "cpp" },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
})

require("lspconfig").clangd.setup({
  filetypes = { "c", "cpp", "objc", "objcpp" },
})

require("conform").setup({
  formatters_by_ft = {
    c = { "clang_format" },
    cpp = { "clang_format" },
  },
})
