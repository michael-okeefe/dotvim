set nocompatible

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

" Scrolling
set scrolloff=6

" Set to Match Parens
set showmatch
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta

" Tabs
set tabstop=2
set shiftwidth=2
set expandtab

" Wrapping
set wrap
set linebreak
set nolist
set wrapmargin=0

" Text
set textwidth=0
set autoindent
set formatoptions-=t

" Line Numbering
set number

" Neovim Terminal Mode
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

" Turn on Wildmenu
set wildmenu
if exists("&wildignorecase")
  set wildignorecase
endif

" Set the Leader Character to ","
let mapleader=","

" Markdown
let g:vim_markdown_folding_disabled = 1

" Clipboard
set clipboard=unnamed

" Navigation
nmap <C-R> gqq
nmap j gj
nmap <Down> gj
nmap k gk
nmap <Up> gk
nmap ^ g^
nmap $ g$
nmap 0 g0
" per instructions here: http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing

if has('nvim')
  highlight MatchParen ctermbg=blue guibg=lightblue
  let g:slime_target = "neovim"
end

if !has('nvim')
  set ttymouse=xterm2
  let g:slime_target = "vimterminal"
end

" Turn Off Noises
set noerrorbells visualbell t_vb=

" Turn On Mouse
set mouse=a

" Auto generate vim spell/*.add files
for d in glob('~/.vim/spell/*.add', 1, 1)
  if filereadable(d) && (!filereadable(d . '.spl') || getftime(d) > getftime(d . '.spl'))
    silent exec 'mkspell! ' . fnameescape(d)
  endif
endfor

set fileformat=unix
set fileformats=unix,dos

" TableMode settings
"let g:table_mode_corner_corner='+'
"let g:table_mode_corner='+'
"let g:table_mode_header_fillchar='='

" EasyAlign settings
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Set no fixed end of line
" set nofixendofline

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall

" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object
nmap ga <Plug>(EasyAlign)

" Add to .vimrc to enable project-specific vimrc
" exrc allows loading local executing local rc files.
set exrc
" secure disallows the use of :autocmd, shell and write commands in local .vimrc files.
set secure

" ALE configuration
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
