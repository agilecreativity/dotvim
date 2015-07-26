" Plugin: ag.vim  {{{
" Use Ag instead of grep when available
" if executable("ag")
"   let g:ackprg = 'ag --nogroup --column'
"   set grepprg=pt\ --nogroup\ --nocolor
" endif

" Experimental use of 'pt' instead of 'ag
if executable("pt")
  let g:ackprg = 'pt --nogroup --column'
  set grepprg=pt\ --nogroup\ --nocolor
endif
" }}}

" Plugin: CtrlP {{{
if executable("ag")
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:ctrlp_map = '<c-p>'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = 't'
let g:ctrlp_prompt_mappings = {
  \   'AcceptSelection("e")': [],
  \   'AcceptSelection("t")': ['<cr>', '<c-m>']
  \ }

let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_reuse_window = 'netrw'
" }}}

" Plugin: gist.vim  {{{
" Use the right command for Gist
let os = substitute(system('uname'),"\n","","")
if os == "Darwin"
  let g:gist_clip_command = 'pbcopy'
elseif os == "Linux"
  let g:gist_clip_command = '/usr/bin/xclip -selection clipboard'
endif
"$git config --global github.user agilecreativity
if os == "Darwin" || os == "Linux"
  let g:github_token = system('cat ~/apps/private-dotfiles/github/github_token.txt')
endif

let g:gist_detect_filetype = 0
let g:gist_get_multiplefile = 0
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1
let g:gist_show_privates = 1
" }}}

" Plugin: html.vim {{{
let g:html_use_encoding  = "UTF-8" " force the default encoding
let g:html_use_css       = 1       " Use stylesheet instead of inline css
let g:html_number_lines  = 0       " don't show the line number
let g:html_no_pre        = 1       " don't use wrap line
let g:html_expand_tabs   = 1       " force tab to be expanded
let g:html_dynamic_folds = 1       " the user can click on toggle folds open or close, default 0
let g:html_use_xhtml     = 1       " generate XHTML 1.0 instead of HTML 4.01
let g:html_number_lines  = 1       " show line number
" }}}

" Plugin: NERDTree.vim {{{
let NERDTreeIgnore =
\ [
\ '\.pyc$',
\ '\.pyo$',
\ '\.py\$class$',
\ '\.obj$',
\ '\.o$',
\ '\.so$',
\ '\.egg$',
\ '^\.git$',
\ '^\.hg$',
\ '^\.idea',
\ '.min.js'
\ ]

let g:NERDTreeDirArrows=0
let g:NERDTreeMinimalUI=1 " Hide the 'Press ? for help'
" }}}

" Plugin: screen.vim {{{
let g:ScreenImpl = 'Tmux'
let g:ScreenShellTmuxInitArgs = '-2'
let g:ScreenShellInitialFocus = 'vim'
let g:ScreenShellQuitOnVimExit = 0
" }}}

" Plugin: tagbar.vim {{{
" NOTE: exclude javascript files in :Rtags via rails.vim due to warnings when parsing
" let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Use the right ctags for the OS
let os = substitute(system('uname'),"\n","","")
if os == "Darwin"
  " As we use boxen, otherwise just `/usr/local/bin/ctag`
  let g:tagbar_ctags_bin="/opt/boxen/homebrew/bin/ctags"
  " Index ctags from any project, including those outside Rails
  map <leader>ct :!/opt/boxen/hombrew/bin/ctags -R .<cr>
elseif os == "Linux"
  let g:tagbar_ctags_bin="/usr/bin/ctags"
  " Index ctags from any project, including those outside Rails
  map <leader>ct :!/usr/bin/ctags -R .<cr>
endif

" Index ctags from any project, including those outside Rails
" map <leader>ct :!ctags -R .<cr>

" Show absolute line numbers
let g:tagbar_show_linenumbers = 2

" Let the tagbar open for all the files
let g:tagbar_autoclose = 0
" }}}

" Plugin: tmuxline.vim {{{
" see: https://github.com/edkolev/tmuxline.vim
let g:tmuxline_theme = 'zenburn'
" }}}

" Plugin: vim-airline.vim {{{
" see: https://github.com/bling/vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" }}}

" Plugin: vim-instant-markdown.vim {{{
" See: https://github.com/suan/vim-instant-markdown
" To disable the preview and use :InstantMarkdownPreview
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_slow = 1
" }}}

" Plugin: vim-jsbeautify.vim {{{
" See: https://github.com/maksimr/vim-jsbeautify
" TODO: create the file ~/.editorconfig
" }}}

" Plugin: vim-notes.vim {{{
" See: https://github.com/xolox/vim-notes
"let g:notes_directories = [ '~/Dropbox/notes' ]
"let g:notes_suffix = '.txt'
" }}}

" Plugin: vim-rspec.vim {{{
" See: https://github.com/thoughtbot/vim-rspec
" let g:rspec_command="!bundle exec rspec --drb {spec}"
" }}}

" Plugin: closetag.vim {{{
"let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
" }}}

" Plugin: vim-snippets.vim {{{
" Be explicit about the snippets directory
let g:snippets_dir=$HOME.'/.vim/bundle/vim-snippets/snippets'
" }}}

" Plugin: YouCompleteMe and UltiSnip {{{
" See: https://github.com/Valloric/YouCompleteMe/issues/36
"      http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme/18685821#18685821

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabCrMapping = 0

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" }}}

" Plugin: majutsushi/tagbar {{{
" See: https://github.com/jstemmer/gotags
" Install: $go get -u github.com/jstemmer/gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
      \ 'p:package',
      \ 'i:imports:1',
      \ 'c:constants',
      \ 'v:variables',
      \ 't:types',
      \ 'n:interfaces',
      \ 'w:fields',
      \ 'e:embedded',
      \ 'm:methods',
      \ 'r:constructor',
      \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }
" }}}

" Plugin: elzr/vim-json {{{
let g:vim_json_syntax_conceal = 0
" }}}

" Plugin: airblade/vim-gitgutter {{{
let g:gitgutter_max_signs = 5000
" }}}
