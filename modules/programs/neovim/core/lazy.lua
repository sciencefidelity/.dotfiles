local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
  { "nvim-treesitter/nvim-treesitter", lazy = false, build = ":TSUpdate" },
  "HiPhish/rainbow-delimiters.nvim",
  { "lukas-reineke/indent-blankline.nvim", main = "ibl" },
  "nvim-lua/plenary.nvim",
  { "nvim-telescope/telescope.nvim", tag = "*" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  "neovim/nvim-lspconfig",
  "stevearc/conform.nvim",
  { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-nvim-lsp",
  "saadparwaiz1/cmp_luasnip",
  "numToStr/Comment.nvim",
  { "xiyaowong/transparent.nvim", event = "VimEnter", config = true },
})
