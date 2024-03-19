require("nvim-treesitter.configs").setup({
  ensure_installed = { "elixir", "erlang" },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "ex", "exs" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

require("lspconfig").elixirls.setup({ cmd = { "elixir-ls" } })

require("conform").setup({
  formatters_by_ft = {
    elixir = {},
  },
})
