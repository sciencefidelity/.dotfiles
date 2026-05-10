require("nvim-treesitter").install({
  "bash",
  "css",
  "dockerfile",
  "html",
  "json",
  "markdown",
  "markdown_inline",
  "ruby",
  "scheme",
  "scss",
  "toml",
  "wgsl",
  "yaml",
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
