-- TODO
local cmd = vim.cmd
local g = vim.g
local fn = vim.fn
local wo = vim.wo
local bo = vim.bo
local o = vim.o
local map = vim.api.nvim_set_keymap
local normal_mode_silent = {silent = true, noremap = true}
local normal_mode_echo = {silent = false, noremap = true}

cmd('syntax on')
g.mapleader = ' ' -- Space as a leader key
-- Disable builtins plugins
g.loaded_netrwPlugin = 1 -- Disable netrw it has problem with symlinks and I am on nixos
g.loaded_2html_plugin = 1 -- converts lines or the entire buffer to html code
g.loaded_gzip = 1 -- disable editing compressed files
g.loaded_tarPlugin = 1 -- disable navigating tar files
g.loaded_zipPlugin = 1 -- disable navigating zip files
g.loaded_tutor_mode_plugin = 1 -- disable vim tutor
g.loaded_python_provider = 0 -- disable the python 2 health checks
g.loaded_python3_provider = 0 -- disable the python 3 health checks
g.loaded_ruby_provider = 0 -- disable the ruby health checks
g.loaded_perl_provider = 0 -- disable the perl health checks
g.loaded_node_provider = 0 -- disable the node health checks
---------------------------
o.scrolloff = 7 -- minimal number of lines to keep above and below the cursor
o.lazyredraw = true -- don't redraw screen when using macros
o.hidden = true -- allow us to switch buffers easily
o.termguicolors = true -- 24-bit RGB in terminal
o.guicursor = '' -- disable the line cursor
o.fillchars = 'diff:∙,fold:·,vert:│,eob: ' -- characters used to fill statuslines and seperators
o.tabstop = 2 -- 4 spaces equals to one tab
o.shiftwidth = 2 -- number of spaces for each step of autoindent
o.undofile = true
o.expandtab = false
o.showbreak = "↳  "
o.listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←,eol:¬"
o.completeopt = 'menuone,noselect'
-- Ignore these files
local ignore = o.wildignore
ignore = ignore .. '*.o,*.obj,*.bin,*.dll,*.exe,'
ignore = ignore .. '*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**,'
ignore = ignore .. '*.pyc,*.out,'
ignore = ignore .. '*.DS_Store,'
ignore = ignore ..
             '*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.pdf,'
o.wildignore = ignore -- Ignore certain files and folders when globbing
---------------------
bo.synmaxcol = 500 -- syntax highlighting for 500 colums only
bo.tabstop = 2 -- 4 spaces equals to one tab
bo.shiftwidth = 2 -- number of spaces for each step of autoindent
bo.expandtab = false
bo.textwidth = 120 -- Maximum width of text that is being inserted
wo.foldenable = false -- no folding
wo.wrap = false -- dont wrap the lines
-- wo.list = true

if fn.executable('nvr') == 1 then
    vim.env.GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
end

require('globals')
require('ishan')
g.modus_moody_enable = 1
g.modus_faint_syntax = 1
g.modus_yellow_comments = 1
cmd('colorscheme modus-vivendi')

-- Keybindings
map('n', '<leader><leader>', '<C-^>', normal_mode_silent) -- move to alternate buffers [<space><space>]
map('n', 'tn', '<cmd>tabnew<cr>', normal_mode_silent) -- open a new tab [tn]
map('n', 'tc', '<cmd>tabclose<cr>', normal_mode_silent) -- close a tab [tc]

map('n', '<leader>wk', '<cmd>wincmd k<cr>', normal_mode_silent) -- move to split above [A-k]
map('n', '<leader>wj', '<cmd>wincmd j<cr>', normal_mode_silent) -- move to split below [A-j]
map('n', '<leader>wl', '<cmd>wincmd l<cr>', normal_mode_silent) -- move to split l [A-l]
map('n', '<leader>wh', '<cmd>wincmd h<cr>', normal_mode_silent) -- move to split h [A-h]
map('t', '<leader>wk', [[<C-\><C-N><C-w>k]], normal_mode_silent) -- move to split k when inside in terminal [A-k]
map('t', '<leader>wj', [[<C-\><C-N><C-w>j]], normal_mode_silent) -- move to split j when inside in terminal [A-j]
map('t', '<leader>wl', [[<C-\><C-N><C-w>l]], normal_mode_silent) -- move to split k when inside in terminal [A-l]
map('t', '<leader>wh', [[<C-\><C-N><C-w>h]], normal_mode_silent) -- move to split h when inside in terminal [A-h]

map('n', '<leader>ew', ':e    <C-R>=expand("%:p:h") . "/" <CR>',
    normal_mode_echo) -- open a new file in a current window [<space>ew]
map('n', '<leader>es', ':sp   <C-R>=expand("%:p:h") . "/" <CR>',
    normal_mode_echo) -- open a new file in a horizontal split [<space>es]
map('n', '<leader>ev', ':vsp  <C-R>=expand("%:p:h") . "/" <CR>',
    normal_mode_echo) -- open a new file in a vertical split [<space>ev]
map('n', '<leader>et', ':tabe <C-R>=expand("%:p:h") . "/" <CR>',
    normal_mode_echo) -- open a new file in a new tab [<space>et]
map('n', '<f7>', [[<cmd>lua toggleLineNumbers()<cr>]], normal_mode_silent) -- toggle line numbers [f7]
