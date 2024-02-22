vim.api.nvim_create_autocmd("FileType", {
  pattern = { "zig", },
  callback = function()
    vim.lsp.start({
      name = "zls",
      cmd = { "zls" },
      root_dir = vim.fs.dirname(vim.fs.find({ "zls.json", "build.zig" }, { upward = true })[1]),
    })
  end
})
