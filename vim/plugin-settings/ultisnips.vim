" settings for ultisnips {{{
" https://github.com/Valloric/YouCompleteMe/issues/420
function! g:UltiSnips_Complete()
  call UltiSnips_ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips_JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsListSnippets="<c-e>"
let g:UltiSnipsEditSplit="vertical"

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
" }}}
