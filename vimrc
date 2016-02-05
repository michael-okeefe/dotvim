" Pathogen
execute pathogen#infect()

" Minimal Setup
syntax on
filetype plugin indent on

" Colors
colorscheme solarized
set background=light
" For darker themes
highlight CursorLine guibg=#555555

" No Backup Files
set noswapfile

" Tabs
set tabstop=2 
set shiftwidth=2
set expandtab

" Line Numbering
set number

" Clipboard
set clipboard=unnamed

" Navigation
nmap <C-R> gqq
nmap j gj
nmap k gk
nmap ^ g^
nmap $ g$
nmap 0 g0
" per instructions here: http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing

" Turn off annoying stuff
set noerrorbells visualbell t_vb=
