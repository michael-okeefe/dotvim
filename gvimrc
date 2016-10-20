set background=light
highlight CursorLine guibg=#DDDDDD
set guioptions-=m
set guioptions-=T
if has("gui_gtk2")
  set guifont=Inconsolata\ 18
elseif has("gui_macvim")
  set guifont=Inconsolata:h18
elseif has("gui_win32")
  set guifont=Consolas:h16:cANSI
endif

autocmd GUIEnter * set visualbell t_vb=
