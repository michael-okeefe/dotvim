" Pathogen
execute pathogen#infect()
" Regenerate any documentation files
call pathogen#helptags()

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

" Turn on Wildmenu
set wildmenu
set wildignorecase

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

" Turn Off Noises
set noerrorbells visualbell t_vb=

" Auto generate vim spell/*.add files
for d in glob('~/.vim/spell/*.add', 1, 1)
    if filereadable(d) && (!filereadable(d . '.spl') || getftime(d) > getftime(d . '.spl'))
        silent exec 'mkspell! ' . fnameescape(d)
    endif
endfor
