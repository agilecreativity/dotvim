if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \    'windows' : 'make -f make_mingw32.mak',
  \    'cygwin' : 'make -f make_cygwin.mak',
  \    'mac' : 'make -f make_mac.mak',
  \    'unix' : 'make -f make_unix.mak',
  \   },
  \ }

filetype plugin indent on
set enc=utf-8
