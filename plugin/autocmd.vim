augroup disable_autocomments
    autocmd!
    autocmd BufNewFile,BufRead,FileType,OptionSet * set formatoptions-=cro
    autocmd BufNewFile,BufRead,FileType,OptionSet * setlocal formatoptions-=cro
augroup end

nmap <f10> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
