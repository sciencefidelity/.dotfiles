require("nvim-treesitter.configs").setup({
  ensure_installed = { "nix" },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "nix" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

require("conform").setup({
  formatters_by_ft = {
    nix = { "nixpkgs_format" },
  },
})
