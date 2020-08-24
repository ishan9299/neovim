" vim: foldmethod=marker

" ----- General Settings -----{{{1
let mapleader      = ' '
lua require('settings')
lua require('mappings')

if !has('nvim')
    " Change cursor shapes based on whether we are in insert mode,
    " see https://vi.stackexchange.com/questions/9131/i-cant-switch-to-cursor-in-insert-mode
    let &t_SI = "\<esc>[6 q"
    let &t_EI = "\<esc>[2 q"
    if exists("&t_SR")
        let &t_SR = "\<esc>[4 q"
    endif
endif

" Highlight the yanked part
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
augroup END


" ----- Terminal -----{{{2
if exists("##TermOpen")
    augroup term_settings
        autocmd!
        " Do not use number and relative number for terminal inside nvim
        autocmd TermOpen * setlocal norelativenumber nonumber
        " Go to insert mode by default to start typing command
        autocmd TermOpen * startinsert
    augroup END
endif
"}}}

" ----- Minpac -----{{{1
function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

" Functionality {{{2
  call minpac#add('junegunn/fzf')
  call minpac#add('junegunn/fzf.vim')
  " Snippets {{{2
  call minpac#add('SirVer/ultisnips')
  call minpac#add('honza/vim-snippets')

  "Markdown {{{2
  call minpac#add('junegunn/goyo.vim', {'type': 'opt'})
  call minpac#add('plasticboy/vim-markdown')
  call minpac#add('vim-pandoc/vim-pandoc-syntax')
  call minpac#add('elzr/vim-json')
  " For Tables and alignment {{{2
  call minpac#add('godlygeek/tabular')

  " Programming {{{2
  " LSP
  call minpac#add('neovim/nvim-lsp', {'type': 'opt'})
  " Direnv
  call minpac#add('direnv/direnv.vim')
  "Completion nvim
  call minpac#add('nvim-lua/completion-nvim')
  "Diagnostic nvim
  call minpac#add('nvim-lua/diagnostic-nvim')
  " }}}

endfunction

" ----- Minpac Commands ----- {{{2
" Define user commands for updating/cleaning the plugins.
" Each of them calls PackInit() to load minpac and register
" the information of plugins, then performs the task.
command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

" ----- Plugin Settings ----- {{{1
" Settings for my plugins
lua require('plugins')

" ----- Markdown ----- {{{2
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" ----- Completion -----{{{2
" Use completion-nvim in every buffer
augroup completion_nvim
    autocmd!
    autocmd BufEnter * lua require'completion'.on_attach()
augroup END

command! -buffer -nargs=0 LspShowLineDiagnostics lua require'jumpLoc'.openLineDiagnostics()
nnoremap <buffer><silent> <C-h> <Cmd>LspShowLineDiagnostics<CR>
 
let g:diagnostic_auto_popup_while_jump = 1
 
command! Format  execute 'lua vim.lsp.buf.formatting()'
 
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
 
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
 
" Avoid showing message extra message when using completion
set shortmess+=c
 
" Auto close popup menu when finish completion
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
 
" Use tab as trigger key
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction
 
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()
 
" Chain completion list
let g:completion_chain_complete_list = {
            \ 'default' : {
            \   'default': [
            \       {'complete_items': ['lsp', 'snippet']},
            \       {'mode': '<c-p>'},
            \       {'mode': '<c-n>'}],
            \   'comment': [],
            \   'string' : [{'complete_items': ['path']}]}}

" ----- FZF -----{{{2
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>gf :GFiles<CR>
" }}}
