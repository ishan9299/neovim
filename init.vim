if has('nvim') && executable('nvr')
  let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

if exists('g:vscode')
  lua require('vscode')
endif

if !exists('g:vscode')
  lua require('core')
endif
