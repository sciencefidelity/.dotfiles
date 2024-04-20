require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "css",
    "html",
    "json",
    "markdown",
    "markdown_inline",
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
