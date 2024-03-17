require("conform").setup({
  formatters_by_ft = {
    -- astro = { "prettierd" },
    -- c = { "clang_format" },
    -- clojure = { "cljstyle" },
    -- cpp = { "clang_format" },
    -- css = { "prettierd" },
    -- elixir = {},
    -- go = { "gofmt", "golines", "goimports" },
    -- html = { "prettierd" },
    -- java = {},
    lua = { "stylua" },
    nix = { "nixpkgs_fmt" },
    -- rust = { "rustfmt" },
    -- scss = { "prettierd" },
    -- svelte = { "prettierd" },
    -- tsx = { "prettierd" },
    -- typescript = { "prettierd" },
    -- zig = { "zigfmt" },
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
