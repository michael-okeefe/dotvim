set background=light
highlight CursorLine guibg=#DDDDDD
set guioptions-=m
set guioptions-=T
if has("gui_gtk2")
    set guifont=Inconsolata\ 18
else
    set guifont=Inconsolata:h18
endif

autocmd GUIEnter * set visualbell t_vb=
