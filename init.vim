" vim: foldmethod=marker

" ----- General Settings -----{{{1
" Activate matchit plugin
runtime! macros/matchit.vim

" Activate man page plugin
runtime! ftplugin/man.vim

"{ Builtin options and settings
if !has('nvim')
    " Change cursor shapes based on whether we are in insert mode,
    " see https://vi.stackexchange.com/questions/9131/i-cant-switch-to-cursor-in-insert-mode
    let &t_SI = "\<esc>[6 q"
    let &t_EI = "\<esc>[2 q"
    if exists("&t_SR")
        let &t_SR = "\<esc>[4 q"
    endif

    " The number of color to use
    set t_Co=256
endif

filetype plugin indent on
syntax enable

" Use list mode and customized listchars
set list listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:+

" Set height of status line
set laststatus=2

" Changing fillchars for folding, so there is no garbage charactes
set fillchars=fold:\ ,vert:\|

" Do not load netrw by default since I do not use it, see
" https://github.com/bling/dotvim/issues/4
let g:loaded_netrwPlugin = 1

" Do not load tohtml.vim
let g:loaded_2html_plugin = 1

set nu rnu
set path+=**

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 235
" seoul256 (light):
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253
"   let g:seoul256_background = 253
colorscheme seoul256

set guifont=Source\ Code\ Pro:h15

" Highlight the yanked part
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
augroup END

" Ignore certain files and folders when globbing
set wildignore+=*.o,*.obj,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
set wildignore+=*.pyc
set wildignore+=*.DS_Store
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.pdf

" ----- Mappings -----{{{2

let mapleader      = ' '

cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
"}}}

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

" ----- Focus ----- {{{2
set winhighlight=NormalNC:ColorColumn
augroup number_toggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &number | set relativenumber | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &number | set norelativenumber | endif
augroup END
"  }}}

" ----- Minpac -----{{{1
function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

" ----- Functionality -----{{{2
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

" ----- Ultisnips ----- {{{2
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"  " use <Tab> to trigger autocompletion
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ----- Markdown ----- {{{2
" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" ----- Completion -----{{{2
"chain completion
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'snippet']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]

" Recommended Settings
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

" possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip'
let g:completion_enable_snippet = 'UltiSnips'

" Use completion-nvim in every buffer
augroup completion_nvim
    autocmd!
    autocmd BufEnter * lua require'completion'.on_attach()
augroup END

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

" LSP settings
packadd nvim-lsp
luafile ~/.config/nvim/init.lua
