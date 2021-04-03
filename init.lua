-- TODO
local cmd = vim.cmd
local g = vim.g
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
g.loaded_matchit = 1 -- extends matching when using % not really needed though
g.loaded_gzip = 1 -- disable editing compressed files
g.loaded_tarPlugin = 1 -- disable navigating tar files
g.loaded_zipPlugin = 1 -- disable navigating zip files
g.loaded_tutor_mode_plugin = 1 -- disable vim tutor
g.loaded_matchparen = 1 -- disable the match paren plugin it is causing extreme slow downs
g.loaded_python_provider = 0 -- disable the python 2 health checks
g.loaded_python3_provider = 0 -- disable the python 3 health checks
g.loaded_ruby_provider = 0 -- disable the ruby health checks
g.loaded_perl_provider = 0 -- disable the perl health checks
g.loaded_node_provider = 0 -- disable the node health checks
---------------------------
o.scrolloff = 15 -- minimal number of lines to keep above and below the cursor
o.lazyredraw = true -- don't redraw screen when using macros
o.laststatus = 2 -- only show the statusline when a split exists
o.hidden = true -- allow us to switch buffers easily
o.termguicolors = true -- 24-bit RGB in terminal
o.guicursor = '' -- disable the line cursor
o.fillchars = 'diff:∙,fold:·,vert:│,eob: ' -- characters used to fill statuslines and seperators
-- Ignore these files
local ignore = o.wildignore
ignore = ignore .. '*.o,*.obj,*.bin,*.dll,*.exe,'
ignore = ignore .. '*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**,'
ignore = ignore .. '*.pyc,*.out,'
ignore = ignore .. '*.DS_Store,'
ignore = ignore .. '*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.pdf,'
o.wildignore = ignore -- Ignore certain files and folders when globbing
---------------------
bo.synmaxcol = 500 -- syntax highlighting for 500 colums only
bo.tabstop = 4 -- 4 spaces equals to one tab
bo.shiftwidth = 4 -- number of spaces for each step of autoindent
bo.expandtab = true
bo.textwidth = 120 -- Maximum width of text that is being inserted
bo.formatoptions = 'jql' -- disable the autocommenting
wo.foldenable = false -- no folding
wo.wrap = false -- dont wrap the lines

-- Plugins
cmd('packadd! modus-theme-vim')
cmd('colorscheme modus-operandi') -- set my colorscheme

cmd('packadd! nvim-solarized-lua')
-- o.bg = 'light'
-- g.solarized_visibility = 'high'
-- g.solarized_statusline = 'flat'
-- cmd('colorscheme solarized-flat')

cmd('packadd! nvim-toggleterm.lua')
require"toggleterm".setup{
    size = 15,
    open_mapping = [[<M-t>]],
    shade_filetypes = {},
    shade_terminals = false,
    start_in_insert = true,
    persist_size = true,
    direction = 'horizontal',
}
cmd('packadd! tabular')
cmd('packadd! vim-commentary')
cmd('packadd! vim-dirvish')
cmd('packadd! vim-nix')
cmd('packadd! vim-repeat')
cmd('packadd! vim-surround')
cmd('packadd! vim-startuptime')

-- Toggle Line Numbers
function _G.toggleLineNumbers()
    local relativeNumbers = (wo.rnu and wo.nu)
    local numbers = wo.nu
    if (numbers == false) then
        wo.nu = true -- move to normal lineNumbers
    elseif(numbers == true and relativeNumbers == false) then
        wo.rnu = true -- move to relativeNumbers
    elseif(relativeNumbers == true) then
        wo.nu = false -- hide the numbering
        wo.rnu = false -- hide the relative numbering
    end
end
map('n', '<f7>', [[<cmd>lua toggleLineNumbers()<cr>]], normal_mode_silent) -- toggle line numbers [f7]

-- Completion Binding
local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end

map('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})


-- Keybindings
map('n', '<leader><leader>', '<C-^>', normal_mode_silent) -- move to alternate buffers [<space><space>]
map('n', 'tn', '<cmd>tabnew<cr>', normal_mode_silent) -- open a new tab [tn]
map('n', 'tc', '<cmd>tabclose<cr>', normal_mode_silent) -- close a tab [tc]
map('n', '<A-k>', '<cmd>wincmd k<cr>', normal_mode_silent) -- move to split above [A-k]
map('n', '<A-j>', '<cmd>wincmd j<cr>', normal_mode_silent) -- move to split below [A-j]
map('n', '<A-l>', '<cmd>wincmd l<cr>', normal_mode_silent) -- move to split l [A-l]
map('n', '<A-h>', '<cmd>wincmd h<cr>', normal_mode_silent) -- move to split h [A-h]
map('t', '<A-h>', [[<C-\><C-N><C-w>h]], normal_mode_silent) -- move to split h when inside in terminal [A-h]
map('t', '<A-j>', [[<C-\><C-N><C-w>j]], normal_mode_silent) -- move to split j when inside in terminal [A-j]
map('t', '<A-k>', [[<C-\><C-N><C-w>k]], normal_mode_silent) -- move to split k when inside in terminal [A-k]
map('t', '<A-l>', [[<C-\><C-N><C-w>l]], normal_mode_silent) -- move to split k when inside in terminal [A-l]
map('n', '<leader>ew', ':e    <C-R>=expand("%:p:h") . "/" <CR>' , normal_mode_echo) -- open a new file in a current window [<space>ew]
map('n', '<leader>es', ':sp   <C-R>=expand("%:p:h") . "/" <CR>' , normal_mode_echo) -- open a new file in a horizontal split [<space>es]
map('n', '<leader>ev', ':vsp  <C-R>=expand("%:p:h") . "/" <CR>' , normal_mode_echo) -- open a new file in a vertical split [<space>ev]
map('n', '<leader>et', ':tabe <C-R>=expand("%:p:h") . "/" <CR>' , normal_mode_echo) -- open a new file in a new tab [<space>et]
