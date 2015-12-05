" file: ~/.vim/08-mappings.vim {{{
cmap w!! w !sudo tee % >/dev/null
cnoremap %s/ %s/\v
command! OpenChangedFiles :call OpenChangedFiles()

inoremap <s-tab> <c-n>
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap jk <esc>

" Insert clipboard text and places cursor right after it
inoremap <F4> <esc>"+p`]a
map      <F5> :ScreenShellVertical<cr>
nnoremap <F6> :GundoToggle<cr>

map <Down>  :echo "no! - use k instead"<cr>
map <Left>  :echo "no! - use h instead"<cr>
map <Right> :echo "no! - use l instead"<cr>
map <Up>    :echo "no! - use k instead"<cr>

nmap <C-W>u :call MergeTabs()<cr>
nmap <C-t>  :tabedit .<cr>
nmap Q gqap

nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <F7>  :set paste!<cr>
nnoremap <silent> <F8>  :TagbarToggle<cr>

nnoremap / /\v
nnoremap ; :
nnoremap J mzJ`z    " keep the cursor in place while joining line
nnoremap Vaa ggVG   " select entire buffer
nnoremap gj j       " move by screen line not file line
nnoremap gk k
nnoremap gp `[v`]
nnoremap j  gj
nnoremap k  gk
nnoremap n  nzz
nnoremap n  Nzz     " keep search map in the middle of the screen
nnoremap vaa ggvGg_ " select the entire buffer

onoremap <silent> al :norm val<cr>
onoremap <silent> il :norm vil<cr>

vmap # :TComment<cr>
vmap Q gq

vnoremap < <gv
vnoremap > >gv
vnoremap <silent> <Enter> :EasyAlign<Enter>
vnoremap <silent> al :<c-u>norm!0v$h<cr>
vnoremap <silent> il :<c-u>norm!^vg_<cr>
xmap s <Plug>VSurround

" Useful abbreviations
ab q1  q!
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
" }}}
