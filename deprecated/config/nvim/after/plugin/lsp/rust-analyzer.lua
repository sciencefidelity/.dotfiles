require("lspconfig").rust_analyzer.setup({
  ["rust_analyzer"] = {
    settings = {
      diagnostics = { enable = false },
      cargo = { features = "all" },
      checkOnSave = { command = "clippy" },
    },
  },
})
