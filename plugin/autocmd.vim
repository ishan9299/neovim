augroup disable_autocomments
    autocmd!
    autocmd BufNewFile,BufRead,FileType,OptionSet * set formatoptions-=cro
    autocmd BufNewFile,BufRead,FileType,OptionSet * setlocal formatoptions-=cro
augroup end

augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
augroup END
