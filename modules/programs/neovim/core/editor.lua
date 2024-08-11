-- make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- set tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
-- vim.opt.isfname:append("@-@")

-- turn on signcolumn by default to prevent right shift
vim.o.signcolumn = "yes"

-- enable mouse mode
vim.o.mouse = "a"

-- sync clipboard between OS and Neovim
vim.o.clipboard = "unnamedplus"

-- enable break indent
vim.o.breakindent = true

-- show invisibles
vim.opt.list = true
vim.opt.listchars = { eol = "¬", tab = "→ ", trail = "·", extends = ">", precedes = "<", space = "·" }

vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = { '*.md' },
  callback = function()
    vim.opt.wrap = true
  end,
})

vim.api.nvim_create_autocmd({ 'BufWinLeave' }, {
  pattern = { '*.md' },
  callback = function()
    vim.opt.wrap = false
  end,
})
