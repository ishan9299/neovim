" ----- Completion -----
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
