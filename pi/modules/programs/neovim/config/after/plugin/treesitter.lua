require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "astro",
    "bash",
    "clojure",
    "css",
    "elixir",
    "go",
    "html",
    "java",
    "javascript",
    "lua",
    "nix",
    "rust",
    "scss",
    "svelte",
    "tsx",
    "typescript",
    "zig",
  },
  sync_installed = false,
  auto_install = false,
  highlight = {
    enable = true,
  },
  additional_vim_regex_highlightling = false,
})

require("nvim-treesitter.configs").setup({ ensure_installed = { "c", "cpp" } })

require("nvim-treesitter.configs").setup({ ensure_installed = { "erlang" } })
