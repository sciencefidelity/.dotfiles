require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua" },
})

require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = { globals = { "vim" } },
    },
  },
})

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
  },
})

require("Comment.ft").set("lua", { "--%s", "--[[%s--]]" })
