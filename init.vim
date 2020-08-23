" vim: set foldmethod=marker

" ----- General Settings -----{{{1
set nu rnu
let mapleader      = ' '
colorscheme seoul256

" Highlight the yanked part
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
augroup END

" ----- Minpac -----{{{1
function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

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

  " Functionality {{{2
  "LeaderF 
  call minpac#add('Yggdroot/LeaderF', {'do': '!sh install.sh'})
  "Deoplete
  call minpac#add('Shougo/deoplete.nvim', {'do': 'UpdateRemotePlugins' })
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

" ----- Deoplete ----- {{{2
let g:deoplete#enable_at_startup = 1

" ----- LeaderF ----- {{{2
" don't show the help in normal mode
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_ShowDevIcons = 0

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

" Ignore certain files and directories when searching files
let g:Lf_WildIgnore = {
    \ 'dir': ['.git', '__pycache__', '.DS_Store'],
    \ 'file': ['*.exe', '*.dll', '*.so', '*.o', '*.pyc', '*.jpg', '*.png',
    \ '*.gif', '*.db', '*.tgz', '*.tar.gz', '*.gz', '*.zip', '*.bin', '*.pptx',
    \ '*.xlsx', '*.docx', '*.pdf', '*.tmp', '*.wmv', '*.mkv', '*.mp4',
    \ '*.rmvb']
    \}

" Only fuzzy-search files names
let g:Lf_DefaultMode = 'NameOnly'

" Do not use version control tool to list files under a directory since
" submodules are not searched by default.
let g:Lf_UseVersionControlTool = 0
