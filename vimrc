" Pathogen
call pathogen#infect()
call pathogen#helptags()

" Syntax highlighting
set nocompatible
" syntax on enable
syntax enable
" for responsiveness, limit syntax highlighting on long lines
set synmaxcol=120
" set to zero to scan everything
let g:clojure_maxlines = 50
" number of lines to search for balanced parenthesis
let g:paredit_matchlines = 50
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

" Add support for syntax highlighting in ClojureScript files
autocmd BufRead,BufNewFile *.cljs setlocal filetype=clojure
autocmd BufRead,BufNewFile *.cljs call PareditInitBuffer()

" Add support for syntax highlighting in EDN files
autocmd BufRead,BufNewFile *.edn setlocal filetype=clojure
autocmd BufRead,BufNewFile *.edn call PareditInitBuffer()

" Add md as markdown
autocmd BufRead,BufNewFile *.md setlocal filetype=markdown

" Autostart spell check
autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd BufRead,BufNewFile *.md setlocal spell

" colorscheme github
" colorscheme elrodeo
" colorscheme pablo
colorscheme solarized
set background=dark
" For darker themes
highlight CursorLine guibg=#555555

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
" fixes issue under tmux
if $TMUX == ''
    set clipboard=unnamed
end
set noerrorbells visualbell t_vb=

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

" Clojure options.
autocmd Syntax clojure RainbowParenthesesLoadRound
autocmd BufEnter *.clj RainbowParenthesesToggle
autocmd BufLeave *.clj RainbowParenthesesToggle

" Remove Trailing Whitespace on Save
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.clj :%s/\s\+$//e
autocmd BufWritePre *.cljs :%s/\s\+$//e
autocmd BufWritePre *.edn :%s/\s\+$//e
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.as :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.css :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.txt :%s/\s\+$//e
autocmd BufWritePre *.md :%s/\s\+$//e

let g:rbpt_max = 9
