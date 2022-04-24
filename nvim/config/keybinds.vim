" keymap
inoremap <C-A> <Esc>^i
inoremap <C-E> <Esc>$a
 
" use ctrl + hjkl to control direction when insert mode 
inoremap <C-L> <Right>
inoremap <C-H> <Left>
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-D> <Del>

 
"move to next word
inoremap <C-F> <Esc>wwwi
 
"move to prev word
inoremap <C-B> <Esc>bi
 
"del current char
inoremap <C-D>x <Esc>lxi
 
"del current word
inoremap <C-D>w <Esc>ldwi
 
"del current line
inoremap <C-D>l <Esc>ddi
 
"del content from x to line end
inoremap <C-D>e <Esc>lc$
 
"del content from x to line end
inoremap <C-D>a <Esc>lc^

"use ; to replace : when normal mode
nnoremap ; :

"use kj to replace <Esc>
inoremap kj <Esc>

" use shortcut to change indent
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv

