source $VIMRUNTIME/defaults.vim
" Color settings
set t_Co=256                                                                                                                
set background=dark                                                                                                         
let g:jellybeans_overrides = {                                                                                              
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },                                                             
\}                                                                                                                          
if has('termguicolors') && &termguicolors                                                                                   
    let g:jellybeans_overrides['background']['guibg'] = 'none'                                                              
    endif                                                                                                                   
colorscheme jellybeans                                                                                                      
syntax on                                                                                                                   
" Disable auto indent.                                                                                                      
set noai
