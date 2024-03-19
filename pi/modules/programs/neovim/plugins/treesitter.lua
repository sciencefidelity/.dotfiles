require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "json",
    "nix",
    "toml",
    "yaml",
  },
  sync_installed = false,
  auto_install = false,
  highlight = {
    enable = true,
  },
  additional_vim_regex_highlightling = false,
})
