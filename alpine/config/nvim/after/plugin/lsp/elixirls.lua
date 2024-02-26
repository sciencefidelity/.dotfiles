vim.api.nvim_create_autocmd("FileType", {
  pattern = { "elixir", "eelixir", "heex", "surface" },
  callback = function()
    vim.lsp.start({
      name = "elixir-ls",
      cmd = { "/home/matt/.elixir/elixir-ls/language_server.sh" },
      root_dir = vim.fs.dirname(vim.fs.find({ "mix.exs" }, { upward = true, limit = 2 })[1]),
      single_file_support = true,
    })
  end
})
