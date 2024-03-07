require("conform").setup({
  formatters_by_ft = {
    c = { "clang_format" },
    clojure = { "cljstyle" },
    cpp = { "clang_format" },
    elixir = {},
    go = { "gofmt", "golines", "goimports" },
    java = {},
    lua = { "stylua" },
    nix = { "nixpkgs_fmt" },
    rust = { "rustfmt" },
    svelte = { "prettier" },
    typescript = { "prettier" },
    zig = { "zigfmt" },
  },
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args) require("conform").format({ bufnr = args.buf }) end,
})
