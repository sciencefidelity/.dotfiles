require("lspconfig").gopls.setup({
  settings = {
    completeUnimported = true,
    usePlaceholders = true,
    analyses = {
      unusedparams = true,
    },
  },
})
