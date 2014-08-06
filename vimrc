"--------------------"
" file: ~/.vimrc :beg"
"--------------------"
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

" Quick Spike {{{
nnoremap ,, :!ruby %<CR>
" colorscheme Tomorrow-Night

" Note: this will make tmux work with system clipboard!!
" and will work correctly with Thoughtbot's article!
"set clipboard=unnamed
" nnoremap ;; :!bundle exec rspec %<CR>
" nnoremap ;; :!rubocop %<CR>
nnoremap ;; :!ruby %<CR>
colorscheme seoul256

" Quick spike:
" see: http://usevim.com/2013/01/04/vim101-jumping/
" This will make require './some_file' expands to './some_file.rb'
" use together with 'set path+=custom/directory/name'
set suffixesadd+=.rb
set suffixesadd+=.js

" Load custom configuration for a project
function! AddCustomLoadPath()
  if !empty(s:vim_home.'/custom_load_path.vim')
    " let s:vim_home = '~/.vim/'
    exec 'source '. s:vim_home . '/custom_load_path.vim'
  endif
endfunction

" }}}

set nowrap

" Spikes - adding test for 'Mercurial' support in Vim
let g:lawrencium_debug = 1
let g:lawrencium_hg_executable = '/usr/local/bin/hg'
"--------------------"
" file: ~/.vimrc :end"
"--------------------"
