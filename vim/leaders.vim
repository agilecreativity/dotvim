" Git related settings {{{
map <leader>gac :Gcommit -a -m ""<left>
map <leader>gb  :Gblame<cr>
map <leader>gc  :Gcommit -m "wip: "<left>
map <leader>gs  :Gstatus<cr>

" Note: always push
"map <leader>gw  :!git add . && git commit -m 'WIP' && git push<cr>

" Note: only commit but don't push to remote branch
" don't push the code until we have squash it properly!
map <leader>gw  :!git add . && git commit -m 'WIP'<cr>
" }}}

" CommandT related settings {{{
map <leader>f  :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F  :CommandTFlush<cr>\|:CommandT %%<cr>
map <leader>gf :CommandTFlush<cr>\|:CommandT features<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gt :CommandTFlush<cr>\|:CommandTTag<cr>
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
nnoremap <silent> <leader>b :CommandTBuffer<cr>
nnoremap <silent> <leader>t :CommandT<cr>
" }}}


" Tmux related settings {{{
"command! -nargs=? -complete=shellcmd W  :w! | :call ScreenShellSend("load '".@%."';")
map <leader>rc :ScreenShellVertical bundle exec rails c test<cr>
map <leader>rl :w<cr> :call ScreenShellSend("rspec ".@% . ':' . line('.'))<cr>
map <leader>rr :w<cr> :call ScreenShellSend("rspec ".@%)<cr>
map <leader>re :w<cr> :call ScreenShellSend("cucumber --format=pretty ".@% . ':' . line('.'))<cr>
map <leader>rt :w<cr> :call ScreenShellSend("reload!")<cr>
map <leader>,  :w<cr>
  \:call ScreenShellSend("reload!")<cr>
  \:call ScreenShellSend("rspec ".@% . ':' . line('.'))<cr>
" }}}

" vim-spec related settings {{{
map <leader>sd :call RunLastSpec()<cr>
map <leader>sj :call RunNearestSpec()<cr>
map <leader>ss :call RunCurrentSpecFile()<cr>
" }}}

" NERDTree related setting {{{
nnoremap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>n  :NERDTreeToggle<cr>
" }}}

" Misc settings {{{
map <leader>rn :call RenameFile()<cr>
map <leader>sm :RSmodel
map <leader>sn :sp ~/.vim/bundle/vim-snippets/snippets/ruby.snippets<cr>
map <leader>sp :split <C-R>=expand("%:p:h") . '/'<cr>
map <leader>vp :vnew  <C-R>=expand("%:p:h") . '/'<cr>
map <leader>y "*y

nnoremap <leader>(  :tabprev<cr>
nnoremap <leader>)  :tabnext<cr>
nnoremap <leader>a  :Ag<space>
nnoremap <leader>l  :ls<cr>:b
nnoremap <leader>nr :setlocal number!<cr>
nnoremap <leader>nn :split note:todo<cr>

map <leader>co ggVG"*y
map <leader>ct :!ctags -R .<cr>
map <leader>e  :e <C-R>=expand("%:p:h") . '/'<cr>

nnoremap <leader>xc :call DeleteComments()<cr>
vnoremap <leader>h  :s/:\(\w*\) *=>/\1:/g<cr>
" }}}
