" Use Ag (https://github.com/ggreer/the_silver_searcher) instead of Grep when available
if executable("ag")
  let g:ackprg = 'ag --nogroup --column'
  " Use ag in CtrlP for listing files.
  set grepprg=ag\ --nogroup\ --nocolor
endif
