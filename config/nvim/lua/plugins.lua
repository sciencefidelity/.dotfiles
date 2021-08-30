local execute = vim.api.nvim_command
local fn = vim.fn

return require('packer').startup(function()
  --·https://github.com/wbthomason/packer.nvim
  use 'wbthomason/packer.nvim'
  -- https://github.com/tpope/vim-fugitive
  use 'tpope/vim-fugitive'
  -- https://github.com/tpope/vim-rhubarb
  use 'tpope/vim-rhubarb'
  -- https://github.com/tpope/vim-commentary
  use 'tpope/vim-commentary'
  -- https://github.com/ludovicchabant/vim-gutentags
  -- use 'ludovicchabant/vim-gutentags'
  -- https://github.com/nvim-telescope/telescope.nvim
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } }
  -- https://github.com/dracula/vim
  use 'dracula/vim'
  -- https://github.com/itchyny/lightline.vim
  use 'itchyny/lightline.vim'
  -- https://github.com/lukas-reineke/indent-blankline.nvim
  use 'lukas-reineke/indent-blankline.nvim'
  -- https://github.com/lewis6991/gitsigns.nvim
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- https://github.com/nvim-treesitter/nvim-treesitter
  use 'nvim-treesitter/nvim-treesitter'
  -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- https://github.com/kyazdani42/nvim-tree.lua
  use 'kyazdani42/nvim-tree.lua'
  -- https://github.com/neovim/nvim-lspconfig
  use 'neovim/nvim-lspconfig'
  -- https://github.com/glepnir/lspsaga.nvim
  use 'glepnir/lspsaga.nvim'
  -- https://github.com/hrsh7th/nvim-compe
  use 'hrsh7th/nvim-compe'
  -- https://github.com/hrsh7th/vim-vsnip
  use 'hrsh7th/vim-vsnip'
  -- use 'pangloss/vim-javascript' -- JavaScript syntax highlighting and improved indentation
  -- Flutter tools
  -- use 'dart-lang/dart-vim-plugin'
  -- use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' }
  -- Go tools
  -- use 'fatih/vim-go'
  -- use 'ray-x/go.nvim'
  use 'fladson/vim-kitty' -- Highlighting for Kitty.conf
end)
