-- Make line numbers default
vim.wo.number = true
-- Enable mouse mode
-- vim.o.mouse = 'a'
-- Enable break indent
vim.o.breakindent = true
-- Save undo history
vim.opt.undofile = true
-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'
-- Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.g.dracula_bold = 1
vim.g.dracula_italic = 1
vim.cmd [[colorscheme dracula]]
-- Set statusbar
vim.g.lightline = {
  colorscheme = 'dracula',
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'fugitive#head' },
}
-- Show invibles
vim.opt.list = true
vim.opt.listchars = { eol = '¬', tab = '→ ', trail = '·', extends = '>', precedes = '<', space = '·' }
-- Set tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
-- Color column
-- vim.wo.colorcolumn = '80'
vim.highlight.create('ColorColumn', { ctermbg=0, guibg='#44475A' }, false)
