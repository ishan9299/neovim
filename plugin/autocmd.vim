augroup autocmds
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
    autocmd FileType markdown setlocal spell complete+=kspell ts=4 sts=4 shiftwidth=4 noexpandtab
    autocmd FileType gitcommit setlocal spell complete+=kspell
    autocmd BufNewFile,BufFilePre,BufRead *.nix set filetype=nix | setlocal tabstop=2
    autocmd FileType c,cpp setlocal omnifunc=v:lua.vim.lsp.omnifunc ts=4 sts=4 shiftwidth=4 expandtab
    autocmd FileType rust setlocal omnifunc=v:lua.vim.lsp.omnifunc ts=4 sts=4 shiftwidth=4 expandtab
    autocmd FileType lua setlocal omnifunc=v:lua.vim.lsp.omnifunc ts=2 sts=2 shiftwidth=2 expandtab
    autocmd FileType vim setlocal omnifunc=v:lua.vim.lsp.omnifunc ts=8 sts=8 shiftwidth=4 noexpandtab
    autocmd FileType java setlocal omnifunc=v:lua.vim.lsp.omnifunc ts=8 sts=8 shiftwidth=4 noexpandtab
    autocmd FileType nix setlocal ts=2 sts=2 shiftwidth=2 expandtab
    autocmd BufEnter * lua require'completion'.on_attach()
    autocmd TermOpen * setlocal norelativenumber nonumber
    autocmd TermOpen * startinsert
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("Substitute", 200)
augroup end
