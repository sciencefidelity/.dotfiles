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
    "ruby",
    "scheme",
    "scss",
    "toml",
    "wgsl",
    "yaml",
  },
  sync_installed = false,
  auto_install = false,
  highlight = {
    enable = true,
  },
  additional_vim_regex_highlightling = false,
})

vim.filetype.add({
  filename = {
    ["Fastfile"] = "ruby",
    ["Matchfile"] = "ruby",
    ["Appfile"] = "ruby",
    ["Deliverfile"] = "ruby",
  },
})

vim.treesitter.language.register("html", "xhtml")
