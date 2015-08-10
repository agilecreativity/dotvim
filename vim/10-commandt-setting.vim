"" file: ~/.vim/10-commandt-setting.vim {{{
"" Note: Use this one if you don't need to search for assets directory!
let g:CommandTWildIgnore = &wildignore .
      \ ",**/.git/*" .
      \ ",**/.hg/*" .
      \ ",**/tmp/*" .
      \ ",**/bower_components/*" .
      \ ",**/node_modules/*" .
      \ ",**/dist/*" .
      \ ",**/tests/_vendor/*,**/*.svg"

let g:CommandTMatchWindowReverse   = 1
let g:CommandTMaxCachedDirectories = 10
let g:CommandTMaxFiles             = 500000
let g:CommandTScanDotDirectories   = 1

"" See: https://wt.pe/e
if &term =~ 'screen' || &term =~ 'xterm'
  let g:CommandTCancelMap = ['<ESC>', '<C-c>']
endif

"set switchbuf=usetab
"set switchbuf=useopen

"" mappings
if has('jumplist')
  nnoremap <silent> <leader>j :CommandTJump<CR>
endif

nnoremap <leader>g :CommandTTag<CR>

"" buffer/split/tab re-use magic
function! s:BufHidden(buffer)
  let bufno = bufnr(a:buffer)
  let listed_buffers = ''

  redir => listed_buffers
  silent ls
  redir END

  for line in split(listed_buffers, "\n")
    let components = split(line)
    if components[0] == bufno
      return match(components[1], 'h') != -1
    endif
  endfor
  return 0
endfunction

function! s:GotoOrOpen(command, ...)
  for file in a:000
    "" bufwinnr() doesn't see windows in other tabs, meaning we open them again
    "" instead of switching to the other tab; but bufexists() sees hidden
    "" buffers, and if we try to open one of those, we get an unwanted split.
    if bufwinnr(file) != -1 || (bufexists(file) && !s:BufHidden(file))
      exec "sb " . file
    else
      exec a:command . " " . file
    endif
  endfor
endfunction

command! -nargs=+ GotoOrOpen call s:GotoOrOpen(<f-args>)

let g:CommandTAcceptSelectionCommand       = 'GotoOrOpen e'
let g:CommandTAcceptSelectionTabCommand    = 'GotoOrOpen tabe'
let g:CommandTAcceptSelectionSplitCommand  = 'GotoOrOpen sp'
let g:CommandTAcceptSelectionVSplitCommand = 'GotoOrOpen vs'

let g:CommandTAcceptSelectionSplitMap = ['<C-s>','C-CR>']
let g:CommandTAcceptSelectionMap      = ['<CR>', '<C-CR>']
let g:CommandTCancelMap               = ['<C-x>','<C-c>','<esc>']
"" }}}
