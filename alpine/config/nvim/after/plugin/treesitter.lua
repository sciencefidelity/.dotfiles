require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c",
    "clojure",
    "cpp",
    "css",
    "elixir",
    "erlang",
    "go",
    "html",
    "java",
    "javascript",
    "lua",
    "rust",
    "zig",
  },
  sync_installed = false,
  auto_install = false,
  highlight = {
    enable = true,
  },
  additional_vim_regex_highlightling = false,
})
