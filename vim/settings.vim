syntax on
let mapleader=","
let localmapleader="\\"

"set clipboard=unnamed         " use the system clipboard
"inoremap <esc> <nop>

" Note: work best with NERDTree when we rename/move/delete file
set hidden                     " allow background buffers without writing them

set autoindent
set autoread                   " auto-reload buffer when file changed on disk
set backspace=indent,eol,start " allow backspacing over everythings in insert mode
set backup
set backupdir=~/.tmp
set cursorline
set directory=~/.tmp
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set gdefault                   " have :s///g flag by default
set guioptions-=T
set helpheight=1000
set history=10000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set listchars=tab:▸\ ,trail:•,extends:»,precedes:«
set list                       " show invisible characters
set nofoldenable
set nojoinspaces               " use only 1 space when joining the lines, not 2
set noswapfile
set number                     " show number
set ruler
set scrolloff=3                " have some context around the current line
set shiftround                 " round indent to the multiple of shiftwidth
set shiftwidth=2
set showbreak=↪\               " visual clue to wrap lines (e.g unicode 21AA)
set showcmd                    " show partial commands below the status line
set showmatch                  " briefely jump to matching bracket if insert one
set smartcase
set splitbelow                 " new window from the split to be below the current one
set splitright                 " new windows is put right to the current one
set synmaxcol=800              " Don't try to highlight lines longer than 800 characters.
set tabstop=2
set timeout timeoutlen=1000 ttimeoutlen=100
set title
set t_ti= t_te=                " prevent Vim from clobbering the scrollback buffer
set winwidth=79
set wrap
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview
setlocal numberwidth=3

" Wildmenu settings, see :h wildmenu {{{
set wildmenu
set wildmode=full
set wildignore+=.hg,.git,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.pdf,*.mobi,*.epub
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.spl
set wildignore+=*.sw?
set wildignore+=*.DS_Store
set wildignore+=*.pyc
set wildignore+=*.orig
set wildignore+=classes
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/build/*
set wildignore+=*/assets/images/*
set wildignore+=*/assets/documents/*
set wildignore+=*/assets/images/*
set wildignore+=tags,.tags
set foldmethod=manual

call MapCR()
let g:rails_menu = 2
