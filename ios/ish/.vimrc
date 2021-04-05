" Color settings
set t_Co=256

" set color scheme
packadd! dracula
syntax enable
let g:dracula_colorterm = 0
colorscheme dracula

" iSH is slow, make sure vim has time to do the syntax parsing
set redrawtime=10000

" Disable auto indent. 
set noai

set tabstop=2
set softtabstop=2
