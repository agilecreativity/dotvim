set laststatus=2
set statusline=
set statusline+=%f\                    " file name
set statusline+=%h%1*%m%r%w%0*         " flags
set statusline+=%=                     " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P  " offset

hi IncSearch term=reverse
hi Search    term=reverse
hi Visual    term=reverse cterm=reverse ctermbg=9

if $TERM =~ '256color'
  set t_Co=256
elseif $TERM =~ '^xterm$'
  set t_Co=256
endif

if has('gui_running')
  set lines=80
  set columns=120
  set background=light
else
  set background=dark
endif

if has("gui_macvim")
  set autowriteall
  set tabpagemax=100
  set guifont=Menlo\ Regular:h13
endif

syntax enable

set background=dark
colorscheme seoul256

" Use visualbell instead
set noerrorbells
set visualbell
set t_vb="."

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
endif
