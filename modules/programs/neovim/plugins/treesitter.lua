require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "html",
    "json",
    "markdown",
    "markdown_inline",
    "proto",
    "scheme",
    "scss",
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

vim.treesitter.language.register("html", "xhtml")
