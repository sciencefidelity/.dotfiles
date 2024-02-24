vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use { "catppuccin/nvim", as = "catppuccin" }
  use "windwp/nvim-autopairs"
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "HiPhish/rainbow-delimiters.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "nvim-telescope/telescope.nvim"
  use "L3MON4D3/LuaSnip"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp"
  use "saadparwaiz1/cmp_luasnip"
end)
