
" ++------ Autocmds ------++
augroup core_autocmds
autocmd!
" gitcommit
autocmd FileType gitcommit setl spell
autocmd FileType gitcommit setl complete+=kspell
" terminal
autocmd TermOpen * setl norelativenumber nonumber
autocmd TermOpen * startinsert
" makefile
autocmd FileType make setl lcs=tab:»· | setl lcs+=space:␣ | setl lcs+=trail:• | setl noexpandtab
" C/C++
autocmd FileType c,cpp setlocal colorcolumn=80
" highlight yanked region
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="Visual", timeout=310}
" flake.lock
autocmd BufNewFile,BufRead flake.lock setl ft=json
" GLSL
autocmd BufNewFile,BufRead *.vs,*.fs,*.shader setl ft=glsl
augroup end


" Show syntax highlighting groups for word under cursor
nmap <F10> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
