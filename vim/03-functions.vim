"" file: ~/.vim/03-functions.vim {{{
"" Rename current file {{{
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
"" }}}

"" Multi-purpose tab key {{{
"" Indent if we're at the beginning of a line. Else, do completion.
"" Credit: Gary Bernhardt
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
"" }}}

"" Open a split for each dirty file in git {{{
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
"" }}}

"" Merge a tab into a split in the previous window {{{
function! MergeTabs()
  if tabpagenr() == 1
    return
  endif
  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif
  split
  execute "buffer " . bufferName
endfunction
"" }}}

"" Clear the search buffer when hitting return {{{
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
"" }}}

"" Delete all comment start with # {{{
function! DeleteComments()
  "" remove all comment lines starting with '#' skiping the first line.
  "" e.g. this will work better when we need to deal with (#!/usr/bin/env ruby)
  silent! exec '2,$ s/^\s*\#.*$/'

  "" remove all comment lines starting with '#' (e.g. include the #!/bin/bash)
  "silent! exec 'g/^\s*\#.*$/d'

  "" remove all blank lines
  silent! exec 'g/^\s*$/d'

  "" replace multiple blank lines with one
  "silent! exec 'g/^$/,/./-j'
endfunction
"" }}}

"" Replace multiple blank lines with one if any
function! CompressBlankLines()
  silent! exec 'g/^$/,/./-j'
endfunction

"" Note: to delete all trailing whitespace for each file in repo (VERY DESTRUCTIVE!)
" map <leader>W :args `git grep -lI .` \| argdo %s/\s\+$//gce \| w<cr>

"" Print the information about the ruby version built with vim {{{
"" Example from 'Scriping Vim with Ruby' by Matt Margolis (Madison Ruby 2011)
"" Tips: for real world example see 'github.com/sjbach/lusty'
function! RubyInfo()
  ruby <<EOF
    puts "Your Vim's ruby information:"
    puts "ruby version : #{RUBY_VERSION}"
    puts "ruby platform: #{RUBY_PLATFORM}"
    puts "release date : #{RUBY_RELEASE_DATE}"
EOF
endfunction
"" }}}

"" Wrapper function to `git grep` command {{{
"" Thanks to [Aaron Patterson's dotfile](https://github.com/tenderlove/dot_vim/blob/master/vimrc)
function! GitGrep(...)
  let save = &grepprg
  set grepprg=git\ grep\ -n\ $*
  let s = 'grep'
  for i in a:000
    let s = s . ' ' . i
  endfor
  exe s
  let &grepprg = save
endfunction

command -nargs=? G call GitGrep(<f-args>)
"" }}}

"" Wrapper function go `git grep` for word boundary {{{
function! GitGrepWord()
  normal! "zyiw
  call GitGrep('-w -e ', getreg('z'))
endfunction

nmap <C-x>G :call GitGrepWord()<CR>
"" }}}

"" Switch between CommandT and CtrlP
function! FuzzySearchChooser()
  if has('ruby')
    " Use CommandT if we have ruby
    if has('unix')
      nnoremap <silent><C-t> :CommandT<CR>
    else
      nnoremap <silent><M-t> :CommandT<CR>
    endif
  else
    if has('unix')
      let g:ctrlp_map = '<C-t>'
    else
      let g:ctrlp_map = '<M-t>'
    endif
    nnoremap <leader>t :CtrlPRoot<CR>
    nnoremap <leader>b :CtrlPBuffer<CR>
  endif
endfunction

"" TODO: Please remap this key to something else.
noremap <leader>gg :Ggrep -e '<C-R>=expand("<cword>")<Enter>'<Enter>
"" }}}
