vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*",
  command = "Copilot disable",
})
