" Pathogen
call pathogen#infect()
call pathogen#helptags()

" Syntax highlighting
set nocompatible
" syntax on enable
syntax enable
" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
if exists("g:did_load_filetypes")
    filetype off
    filetype plugin indent off
endif
set runtimepath+=/usr/local/Cellar/go/1.3/libexec/misc/vim
" number of lines to search for balanced parenthesis
filetype plugin indent on
set encoding=utf-8
set showcmd
set cursorline

" Wrapping text
command! -nargs=* Wrap set wrap linebreak nolist
set textwidth=79
set wrap
set linebreak
set nolist

" Whitespace
set tabstop=2
set shiftwidth=2
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

" Add support for syntax highlighting in EDN files
autocmd BufRead,BufNewFile *.edn setlocal filetype=clojure

" Add md as markdown
autocmd BufRead,BufNewFile *.md setlocal filetype=markdown

" Autostart spell check
autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd BufRead,BufNewFile *.md setlocal spell

colorscheme solarized
set background=dark
" For darker themes
highlight CursorLine guibg=#555555

" Other
let mapleader=","

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr()) "we havent moved
    if (match(a:key,'[jk]')) "were we going up/down
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

" Move to the given windows
map <leader>h              :call WinMove('h')<cr>
map <leader>k              :call WinMove('k')<cr>
map <leader>l              :call WinMove('l')<cr>
map <leader>j              :call WinMove('j')<cr>

" Move existing Windows
map <leader>H              :wincmd H<cr>
map <leader>K              :wincmd K<cr>
map <leader>L              :wincmd L<cr>
map <leader>J              :wincmd J<cr>

" Window Close/ Window Rotate
map <leader>wc :wincmd q<cr>
map <leader>wr <C-W>r

" Window Resizing
nmap <leader><left>  :3wincmd <<cr>
nmap <leader><right> :3wincmd ><cr>
nmap <leader><up>    :3wincmd +<cr>
nmap <leader><down>  :3wincmd -<cr>

" Navigation
nmap <C-R> gqq
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

" autoformat Go on save
autocmd FileType go autocmd BufWritePre <buffer> Fmt

" autoformat XML -- requires xmllint on path
" autocmd FileType xml exe ":silent %!xmllint --format --recover - 2>/dev/null"
