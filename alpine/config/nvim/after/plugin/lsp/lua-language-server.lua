vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua" },
  callback = function()
    vim.lsp.start({
      name = "lua-language-server",
      cmd = { "lua-language-server" },
      root_dir = vim.fs.dirname(vim.fs.find(
        { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "selene.yml" }, { upward = true })[1]),
      single_file_support = true,
      settings = {
        ["Lua"] = {
          runtime = { version = "LuaJIT" },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          diagnostics = { globals = { "hs", "vim" } },
        },
      },
    })
  end
})
