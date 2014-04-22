let s:vim_home = '~/.vim/'
let os = substitute(system('uname'),"\n","","")

let config_list =
\ [
\ 'base.vim',
\ 'plugins.vim',
\ 'functions.vim',
\ 'autocmds.vim',
\ 'themes.vim',
\ 'settings.vim',
\ 'leaders.vim',
\ 'mappings.vim',
\ 'aliases.vim',
\ 'plugin-settings/*.vim'
\ ]

for files in config_list
  for f in split(glob(s:vim_home.files), '\n')
    exec 'source '.f
  endfor
endfor

" Quick override settings {{{
set timeout timeoutlen=1000 ttimeoutlen=100
set nolist

if has('mouse')
  set mouse=a
endif

" delete comment char when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  " delete comment char when joining commented lines
  set formatoptions+=j
endif
" }}}

" Quick Spike [remove when done]
nnoremap ,, :!ruby %<CR>
nnoremap ;; :!rubocop %<CR>
