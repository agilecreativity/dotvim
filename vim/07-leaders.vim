"" file: ~/.vim/07-leaders.vim {{{
"" Git related settings
map <leader>gac :Gcommit -a -m ""<left>
map <leader>gb  :Gblame<cr>
map <leader>gc  :Gcommit -m "wip: "<left>
map <leader>gs  :Gstatus<cr>
map <leader>gw  :!git add . && git commit -m 'WIP'<cr>

"" CommandT related settings
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>
nnoremap <silent> <leader>b :CommandTBuffer<cr>
nnoremap <silent> <leader>t :CommandT<cr>

"" If CommandT is not working use ContrlP
"nnoremap <silent> <leader>b :CtrlPBuffer<cr>
"nnoremap <silent> <leader>t :CtrlP<cr>

nnoremap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>n  :NERDTreeToggle<cr>
nnoremap <leader>a  :Ag!<space>
nnoremap <leader>l  :ls<cr>:b
nnoremap <leader>nr :setlocal number!<cr>
command! GdiffInTab tabedit %|vsplit|Gdiff
nnoremap <leader>d :GdiffInTab<cr>
nnoremap <leader>D :tabclose<cr>

map <leader>co ggVG"*y
"" Note: for some reason on OSX, the path is always `/usr/bin/ctags`
"" To use the newer ctags, just override this in ~/.vimrc.local` with full-path
"noremap <leader>ct :!/opt/boxen/homebrew/bin/ctags -R .<cr>
noremap <leader>ct :!/opt/boxen/homebrew/bin/ctags -R --exclude=\*.js --exclude=vendor/\* .<cr>
map <leader>e :CommandT <C-R>=expand("%:p:h") . '/'<cr><cr>

"" Delete the comment lines (default to #) from the file
nnoremap <leader>xc :call DeleteComments()<cr>
nnoremap <leader>xb :s#\v^\_$\n\_^$##ge\|update\|s#\($\n\s*\)\+\%$##ge\|update<cr>

"" change key => value to key: value in ruby
"vnoremap <leader>h :s/:\(\w*\) *=>/\1:/g<cr>
nnoremap <leader>h :% s/:\(\w*\) *=>/\1:/g<cr>

"" Replace multiple empty lines with one empty line
vnoremap <leader>x :s#\v^\_$\n\_^$##ge\|update\|s#\($\n\s*\)\+\%$##ge\|update<cr>

"" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)

map <leader>rn :call RenameFile()<cr>
map <leader>sn :sp ~/.vim/bundle/vim-snippets/snippets/ruby.snippets<cr>
map <leader>sp :split <C-R>=expand("%:p:h") . '/'<cr>
map <leader>vp :vnew  <C-R>=expand("%:p:h") . '/'<cr>
map <leader>y "*y
map <leader>cn :sp ~/Dropbox/notes/coding_notes.md<cr>
map <leader>pn :sp ~/Dropbox/notes/project_notes.md<cr>
map <leader>sv :so ~/.vimrc<cr>
map <leader>vv :sp ~/dotvim/vimrc<cr>
"" }}}
