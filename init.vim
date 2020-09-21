if exists('g:vscode')
  lua require('vscode')
endif

if !exists('g:vscode')
  lua require('core')
endif
