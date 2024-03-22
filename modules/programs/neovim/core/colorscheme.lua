vim.o.termguicolors = true
vim.cmd.colorscheme("catppuccin")
vim.cmd("hi statusline guibg=NONE guifg=#45475a")
vim.cmd("hi MsgArea guifg=#585b70")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
