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
filetype on
filetype plugin on
filetype indent on
set encoding=utf-8
set showcmd
set cursorline

" Wrapping text
command! -nargs=* Wrap set wrap linebreak nolist
set textwidth=0
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

" Statusline
set laststatus=2
set statusline=buff:\ %-10.3n\               " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position

" Misc
set fileformats=unix,dos,mac
set fileformat=unix
set noerrorbells
set wildmenu
set list! " turn list on
set listchars=trail:~,tab:>\  " tab shown as '> '
set number
set numberwidth=4
set ruler
set scrolloff=10
set showmatch

" Rainbow Parenthesis
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" Add support for syntax highlighting in ClojureScript files
autocmd BufRead,BufNewFile *.cljs setlocal filetype=clojure

" Add support for syntax highlighting in EDN files
autocmd BufRead,BufNewFile *.edn setlocal filetype=clojure
autocmd BufRead,BufNewFile *.mikan setlocal filetype=clojure
autocmd BufRead,BufNewFile *.boot setlocal filetype=clojure

" FileType Plugin for C++
autocmd BufRead,BufNewFile *.cc setlocal shiftwidth=2 tabstop=2 noexpandtab
autocmd BufRead,BufNewFile *.hh setlocal shiftwidth=2 tabstop=2 noexpandtab

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

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Delete trailing whitespace in a buffer
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>

" autoformat Go on save
autocmd FileType go autocmd BufWritePre <buffer> Fmt

" autoformat XML -- requires xmllint on path
" autocmd FileType xml exe ":silent %!xmllint --format --recover - 2>/dev/null"
