" vim: foldmethod=marker

lua require('my.core')

" ----- Minpac -----{{{1
function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

" Functionality {{{2
  call minpac#add('junegunn/fzf')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('justinmk/vim-dirvish')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-repeat')
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
lua require('my.plugins.lsp')
lua require('my.plugins.markdown')
lua require('my.plugins.Ultisnips')

" ----- Completion -----{{{2
" Use completion-nvim in every buffer
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:completion_chain_complete_list = {
            \ 'default' : {
            \   'default': [
            \       {'complete_items': ['lsp', 'snippet']},
            \       {'mode': '<c-p>'},
            \       {'mode': '<c-n>'}],
            \   'string' : [
            \       {'complete_items': ['path'], 'triggered_only': ['/']}]
            \   },
            \ 'cpp' : {
            \   'default': [
            \       {'complete_items': ['lsp', 'snippet', 'ts']},
            \       {'mode': '<c-p>'},
            \       {'mode': '<c-n>'}],
            \   'comment': [],
            \   'string' : [
            \       {'complete_items': ['path']}]
            \   },
            \ 'markdown' : {
            \   'default': [
            \       {'mode': 'spel'}],
            \   'comment': [],
            \   },
            \}

set completeopt=menuone,noinsert,noselect

call sign_define("LspDiagnosticsErrorSign", {"text" : "✖", "texthl" : "LspDiagnosticsError"})
call sign_define("LspDiagnosticsWarningSign", {"text" : "⚠", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsInformationSign", {"text" : "ℹ", "texthl" : "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsHintSign", {"text" : "➤", "texthl" : "LspDiagnosticsWarning"})

" diagnostic-nvim
let g:diagnostic_level = 'Warning'
let g:diagnostic_enable_virtual_text = 0
let g:diagnostic_virtual_text_prefix = ' '
let g:diagnostic_trimmed_virtual_text = 0
let g:diagnostic_insert_delay = 1

" completion-nvim
let g:completion_enable_auto_hover = 1
let g:completion_auto_change_source = 1
let g:completion_enable_snippet = 'UltiSnips'

" let g:completion_max_items = 10
let g:completion_enable_auto_paren = 0
let g:completion_timer_cycle = 80
let g:completion_auto_change_source = 1
let g:completion_confirm_key = ""

imap <c-j> <cmd>lua require'source'.prevCompletion()<CR>
imap <c-k> <cmd>lua require'source'.nextCompletion()<CR>

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


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
