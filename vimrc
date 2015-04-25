"" file: ~/.vimrc
let s:vim_home = '~/.vim/'
let os = substitute(system('uname'),"\n","","")
let config_list =
\ [
\ '01-base.vim',
\ '02-plugins.vim',
\ '03-functions.vim',
\ '04-autocmds.vim',
\ '05-themes.vim',
\ '06-settings.vim',
\ '07-leaders.vim',
\ '08-mappings.vim',
\ '09-plugins-setting.vim',
\ '10-commandt-setting.vim',
\ '11-neocomplete-setting.vim'
\ ]

for files in config_list
  for f in split(glob(s:vim_home.files), '\n')
    exec 'source '.f
  endfor
endfor

"" Quick override settings {{{
set timeout timeoutlen=1000 ttimeoutlen=100
set nolist

if has('mouse')
  set mouse=a
endif

"" delete comment char when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  " delete comment char when joining commented lines
  set formatoptions+=j
endif
"" }}}

"" Finally load custom config here if any {{{
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
"" }}}
