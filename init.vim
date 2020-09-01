" vim: foldmethod=marker
set termguicolors
luafile ~/.config/nvim/init.lua

" ----- Plugin Settings -----
" Settings for my plugins
lua require('lsp')
lua require('markdown')
lua require('Ultisnips')

command! -nargs=0 -bar Helptags
    \  for p in glob('~/.vim/pack/bundle/opt/*', 1, 1)
    \|     exe 'packadd ' . fnamemodify(p, ':t')
    \| endfor
    \| helptags ALL
