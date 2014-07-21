"------------------------------"
" file: ~/.vim/themmes.vim :beg"
"------------------------------"

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

set background=dark
set lines=80
set columns=120
colorscheme seoul256

if has('gui_running')
  if has("gui_gtk2")
    set guifont=Inconsolata\ Bold\ 12
    set guioptions-=T
    set guioptions-=t
    set guioptions-=g
    set guioptions-=m
    " remove bottom, left, right scrollbar from Gvim
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=b
  elseif has("gui_macvim")
    set autowriteall
    set tabpagemax=20
    set guifont=Menlo\ Regular:h13
  endif
endif

syntax enable

" Use visualbell instead
set noerrorbells
set visualbell
set t_vb="."

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
endif

"------------------------------"
" file: ~/.vim/themmes.vim :end"
"------------------------------"
