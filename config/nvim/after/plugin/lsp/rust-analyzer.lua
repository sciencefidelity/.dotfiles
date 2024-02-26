vim.api.nvim_create_autocmd("FileType", {
  pattern = { "rs", "rust" },
  callback = function()
    vim.lsp.start({
      name = "rust_analyzer",
      cmd = { "rust-analyzer" },
      root_dir = vim.fs.dirname(vim.fs.find({ "Cargo.toml" }, { upward = true })[1]),
      settings = {
        ["rust-analyzer"] = {
          diagnostics = { enable = false },
          cargo = { features = "all" },
          checkOnSave = { command = "clippy" },
        },
      },
    })
  end
})
