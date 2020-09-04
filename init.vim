" vim: foldmethod=marker
set termguicolors
luafile ~/.config/nvim/init.lua

command! -nargs=0 -bar Helptags
    \  for p in glob('~/.config/nvim/pack/packages/opt/*', 1, 1)
    \|     exe 'packadd ' . fnamemodify(p, ':t')
    \| endfor
    \| helptags ALL

" sign define LspDiagnosticsErrorSign text=✖
" sign define LspDiagnosticsWarningSign text=⚠
" sign define LspDiagnosticsInformationSign text=ℹ
" sign define LspDiagnosticsHintSign text=➤
