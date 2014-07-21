" Use the right command for Gist
let os = substitute(system('uname'),"\n","","")

if os == "Darwin"
  let g:gist_clip_command = 'pbcopy'
elseif os == "Linux"
  let g:gist_clip_command = '/usr/bin/xclip -selection clipboard'
endif

"$git config --global github.user agilecreativity
if os == "Darwin" || os == "Linux"
  let g:github_token = system('cat ~/codes/bitbucket/private-dotfiles/github/github_token.txt')
endif

let g:gist_detect_filetype = 0
let g:gist_get_multiplefile = 0
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1
let g:gist_show_privates = 1
