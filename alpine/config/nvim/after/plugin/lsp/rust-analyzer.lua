require("lspconfig").rust_analyzer.setup({
  settings = {
    diagnostics = { enable = false },
    cargo = { features = "all" },
    checkOnSave = { command = "clippy" },
  },
})
