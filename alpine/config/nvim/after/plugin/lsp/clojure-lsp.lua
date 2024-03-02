vim.api.nvim_create_autocmd("FileType", {
  pattern = { "clojure", "edn" },
  callback = function()
    vim.lsp.start({
      name = "clojure-lsp",
      cmd = { "clojure-lsp" },
      root_dir = vim.fs.dirname(vim.fs.find(
      { "project.clj", "deps.edn", "build.boot", "shadow-cljs.edn", ".git", "bb.edn" }, { upward = true, limit = 2 })[1]),
      single_file_support = true,
    })
  end
})
