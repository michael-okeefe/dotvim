" Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Syntax highlighting
set nocompatible
syntax on " enable 
filetype plugin indent on
set encoding=utf-8
set showcmd
set cursorline

" Wrapping text
command! -nargs=* Wrap set wrap linebreak nolist
set wrap
set linebreak
set nolist

" Whitespace
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set winwidth=82

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Backup
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" Misc
set fileformats=unix,dos,mac
set fileformat=unix
set noerrorbells
set wildmenu
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set number
set numberwidth=4
set ruler
set scrolloff=10
set showmatch

" Colors and GUI
colorscheme github " elrodeo pablo
if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set gfn=Inconsolata:h20
    " set gfn=Monaco:h16
endif
" For lighter themes
highlight CursorLine guibg=#DDDDDD
" For darker themes
" highlight CursorLine guibg=#555555

" Other
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap j gj
nmap k gk
nmap ^ g^
nmap $ g$
nmap 0 g0
set clipboard=unnamed
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
