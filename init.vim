if has('nvim') && executable('nvr')
  let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

lua require('init')

" To get proper transperancy disable these highlights
" hi Normal guibg=none
" hi NonText guibg=none
" hi LineNr guibg=none
" hi SignColum guibg=none
" hi TabLineFill guibg=none
