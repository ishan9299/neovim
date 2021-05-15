-- TODO
--[[
may be add something to toggle options with my colorschemes.
Also if possible integrate it with telescope.
]]
vim.cmd('syntax on')
vim.g.mapleader = ' ' -- Space as a leader key
-- Disable builtins plugins
vim.g.loaded_netrwPlugin = 1 -- Disable netrw it has problem with symlinks and I am on nixos
vim.g.loaded_2html_plugin = 1 -- converts lines or the entire buffer to html code
vim.g.loaded_gzip = 1 -- disable editing compressed files
vim.g.loaded_tarPlugin = 1 -- disable navigating tar files
vim.g.loaded_zipPlugin = 1 -- disable navigating zip files
vim.g.loaded_tutor_mode_plugin = 1 -- disable vim tutor
vim.g.loaded_python_provider = 0 -- disable the python 2 health checks
vim.g.loaded_python3_provider = 0 -- disable the python 3 health checks
vim.g.loaded_ruby_provider = 0 -- disable the ruby health checks
vim.g.loaded_perl_provider = 0 -- disable the perl health checks
vim.g.loaded_node_provider = 0 -- disable the node health checks
---------------------------
vim.o.scrolloff = 7 -- minimal number of lines to keep above and below the cursor
vim.o.lazyredraw = true -- don't redraw screen when using macros
vim.o.hidden = true -- allow us to switch buffers easily
vim.o.termguicolors = true -- 24-bit RGB in terminal
vim.o.guicursor = '' -- disable the line cursor
vim.o.fillchars = 'diff:∙,fold:·,vert:│,eob: ' -- characters used to fill statuslines and seperators
vim.o.tabstop = 2 -- 4 spaces equals to one tab
vim.o.shiftwidth = 2 -- number of spaces for each step of autoindent
vim.o.undofile = true
vim.o.expandtab = false
vim.o.showbreak = "↳  "
vim.o.timeoutlen = 500
vim.o.listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←,eol:¬"
vim.o.completeopt = 'menuone,noselect'
-- Ignore these files
local ignore = vim.o.wildignore
ignore = ignore .. '*.o,*.obj,*.bin,*.dll,*.exe,'
ignore = ignore .. '*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**,'
ignore = ignore .. '*.pyc,*.out,'
ignore = ignore .. '*.DS_Store,'
ignore = ignore ..
             '*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.pdf,'
vim.o.wildignore = ignore -- Ignore certain files and folders when globbing
---------------------
vim.bo.synmaxcol = 500 -- syntax highlighting for 500 colums only
vim.bo.tabstop = 2 -- 4 spaces equals to one tab
vim.bo.shiftwidth = 2 -- number of spaces for each step of autoindent
vim.bo.expandtab = false
vim.bo.textwidth = 120 -- Maximum width of text that is being inserted
vim.wo.foldenable = false -- no folding
vim.wo.wrap = false -- dont wrap the lines
-- vim.wo.list = true

require('globals')
require('ishan')
-- vim.g.modus_termtrans_enable = 1
vim.g.modus_faint_syntax = 1
vim.cmd('colorscheme modus-vivendi')
-- vim.g.solarized_statusline = 'flat'
-- vim.g.solarized_termtrans = 1
-- vim.g.solarized_diffmode = 'high'
-- vim.cmd('colorscheme solarized-high')

-- Keybindings
vim.cmd([[
nnoremap <leader>wk <cmd>wincmd k<cr> " move to split above [A-k]
nnoremap <leader>wj <cmd>wincmd j<cr> " move to split below [A-j]
nnoremap <leader>wl <cmd>wincmd l<cr> " move to split l [A-l]
nnoremap <leader>wh <cmd>wincmd h<cr> " move to split h [A-h]

tnoremap <leader>wk <C-\><C-N><C-w>k  " move to split k when inside in terminal [A-k]
tnoremap <leader>wj <C-\><C-N><C-w>j  " move to split j when inside in terminal [A-j]
tnoremap <leader>wl <C-\><C-N><C-w>l  " move to split k when inside in terminal [A-l]
tnoremap <leader>wh <C-\><C-N><C-w>h  " move to split h when inside in terminal [A-h]

nnoremap <leader><leader> <C-^> " move to alternate buffers [<space><space>]
nnoremap tn <cmd>tabnew<cr> " open a new tab [tn]
nnoremap tc <cmd>tabclose<cr> " close a tab [tc]
nnoremap tj <cmd>tabNext<cr>
nnoremap tk <cmd>tabprevious<cr>

" got this from vim-screencasts.
nnoremap <leader>ew :e    <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>es :sp   <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>ev :vsp  <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" toggle line numbers
nnoremap <f7> <cmd>lua toggleLineNumbers()<cr> " toggle line numbers [f7]
]])
