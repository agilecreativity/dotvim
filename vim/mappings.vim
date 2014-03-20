cmap w!! w !sudo tee % >/dev/null
cnoremap %s/ %s/\v
command!  OpenChangedFiles :call OpenChangedFiles()

inoremap <s-tab> <c-n>
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap jk <esc>

" Insert clipboard text and places cursor right after it
inoremap <F4> <esc>"+p`]a
map <F5> :ScreenShellVertical<cr>

" TODO: Please remap these keys to something useful once habit established!
map <Down>  :echo "no! - use k instead"<cr>
map <Left>  :echo "no! - use h instead"<cr>
map <Right> :echo "no! - use l instead"<cr>
map <Up>    :echo "no! - use k instead"<cr>

nmap <C-W>u :call MergeTabs()<cr>
nmap <C-t>  :tabedit .<cr>
nmap Q gqap

nnoremap / /\v
nnoremap ; :
nnoremap <F6> :GundoToggle<cr>
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <F7>  :set paste!<cr>
nnoremap <silent> <F8>  :TagbarToggle<cr>
nnoremap J mzJ`z  " keep the cursor in place while joining line

"nnoremap K :q<cr> " kill window
nnoremap N  Nzz
nnoremap Vaa ggVG " select entire buffer
nnoremap gj j
nnoremap gk k
nnoremap gp `[v`]
nnoremap j  gj
nnoremap k  gk
nnoremap n  nzz
nnoremap vaa ggvGg_

onoremap <silent> al :norm val<cr>
onoremap <silent> il :norm vil<cr>

vmap # :TComment<cr>
vmap Q gq

vnoremap < <gv
vnoremap <silent> <Enter> :EasyAlign<Enter>
vnoremap <silent> al :<c-u>norm!0v$h<cr>
vnoremap <silent> il :<c-u>norm!^vg_<cr>
vnoremap > >gv

xmap s <Plug>VSurround
