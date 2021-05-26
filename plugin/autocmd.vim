augroup disable_autocomments
	autocmd!
	autocmd BufNewFile,BufRead,FileType,OptionSet * set formatoptions-=cro
	autocmd BufNewFile,BufRead,FileType,OptionSet * setlocal formatoptions-=cro
	autocmd BufNewFile,BufRead *.vs,*.fs set ft=glsl
	autocmd BufNewFile,BufRead *.nix set ft=nix
	autocmd BufNewFile,BufRead *.lock set ft=json
	autocmd BufNewFile,BufRead *.fish set ft=fish
	autocmd BufNewFile,BufRead *.zig set ft=zig
	autocmd BufWinEnter,WinEnter term://* startinsert
augroup end

augroup vimrc-incsearch-highlight
	autocmd!
	autocmd CmdlineEnter /,\? :set hlsearch
	autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

nmap <f10> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
