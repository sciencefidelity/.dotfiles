local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "nvim-lua/plenary.nvim",
  { "catppuccin/nvim", name = "catppuccin" },
  "windwp/nvim-autopairs",
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "HiPhish/rainbow-delimiters.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "nvim-telescope/telescope.nvim",
  "neovim/nvim-lspconfig",
  "stevearc/conform.nvim",
  "L3MON4D3/LuaSnip",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-nvim-lsp",
  "saadparwaiz1/cmp_luasnip",
  "numToStr/Comment.nvim",
  "xiyaowong/transparent.nvim",
})
