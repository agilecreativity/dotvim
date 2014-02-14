" NOTE: exclude javascript files in :Rtags via rails.vim due to warnings when parsing
" let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Use the right ctags for the OS
let os = substitute(system('uname'),"\n","","")

if os == "Darwin"
  let g:tagbar_ctags_bin="/usr/local/bin/ctags"
elseif os == "Linux"
  let g:tagbar_ctags_bin="/usr/bin/ctags"
endif

" Index ctags from any project, including those outside Rails
map <leader>ct :!ctags -R .<cr>

" Show absolute line numbers
let g:tagbar_show_linenumbers = 2

" Let the tagbar open for all the files
let g:tagbar_autoclose = 0
