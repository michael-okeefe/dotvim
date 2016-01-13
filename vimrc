call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'bhurlow/vim-parinfer', { 'for': ['clojure', 'scheme'] }
Plug 'kien/rainbow_parentheses.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-surround'
call plug#end()

colorscheme solarized
set background=light
" For darker themes
highlight CursorLine guibg=#555555
