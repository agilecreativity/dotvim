" Use Ag (https://github.com/ggreer/the_silver_searcher) instead of Grep when available
if executable("ag")
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:ctrlp_map = '<c-p>'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = 't'
let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")': [], 'AcceptSelection("t")': ['<cr>', '<c-m>'] }
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_reuse_window = 'netrw'
