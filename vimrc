" Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Syntax highlighting
set nocompatible
" syntax on enable
syntax enable
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
set list! " turn list on
set listchars=trail:~,tab:>-
set number
set numberwidth=4
set ruler
set scrolloff=10
set showmatch

" VimClojure setup
" note: need to install nailgun: brew install nailgun
" /usr/local/Cellar/nailgun/{version,0.7.1 for me}
" Determine indenting using fuzzy matching. e.g. the line starting "(with-"
" will be indented two spaces.
let vimclojure#FuzzyIndent=1
" Highlight built-in functions from clojure.core and friends
let vimclojure#HighlightBuiltins=1
" Highlight functions from contrib
let vimclojure#HighlightContrib=1
" As new symbols are identified using VimClojure's dynamic features, automatically
" highlight them.
let vimclojure#DynamicHighlighting=1
" Color parens so they're easier to match visually
let vimclojure#ParenRainbow=1
" Yes, I want nailgun support
let vimclojure#WantNailgun = 1
" Full path to the nailgun client
let vimclojure#NailgunClient = "/usr/local/Cellar/nailgun/0.7.1/bin/ng"
" Add support for syntax highlighting in ClojureScript files
autocmd BufRead,BufNewFile *.cljs setlocal filetype=clojure

" Colors and GUI
" colorscheme github
" colorscheme elrodeo
" colorscheme pablo
colorscheme solarized
if has("gui_running")
    set background=light
    " For lighter themes
    highlight CursorLine guibg=#DDDDDD
    set guioptions-=m
    set guioptions-=T
    set gfn=Inconsolata:h20
    " set gfn=Monaco:h16
else
    set background=dark
    " For darker themes
    highlight CursorLine guibg=#555555
endif

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
