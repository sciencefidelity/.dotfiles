require("nvim-treesitter.configs").setup {
  ensure_installed = { "c", "cpp", "elixir", "go", "lua", "rust", "zig" },
  sync_installed = false,
  auto_install = false,
  highlight = {
    enable = true,
  },
  additional_vim_regex_highlightling = false,
}
