vim.api.nvim_create_autocmd("FileType", {
  pattern = { "java" },
  callback = function()
    vim.lsp.start({
      name = "jdtls",
      cmd = { "jdtls" },
      root_dir = vim.fs.dirname(vim.fs.find({ "build.xml", "pom.xml", "settings.gradle", "settings.gradle.kts" },
        { upward = true })[1]),
      single_file_support = true,
    })
  end
})
