local o = vim.o
local wo = vim.wo
local g = vim.g
local bo = vim.bo
local cmd = vim.cmd
local fn = vim.fn
local map = vim.api.nvim_set_keymap


cmd('filetype plugin indent on') -- Filetype flygin on
cmd('syntax enable') -- enable syntax highlighting

-- ++------ GLOBAL OPTIONS ------++
-- Tabstop
o.ts=4
o.sts=4
o.shiftwidth=4 -- spaces for autoindent
o.expandtab = true -- Turn off tabs
-- Set the path to find the file in a project
o.termguicolors = true
o.path = o.path .. '**'
---------------------------
-- Ignore these files
local ignore = o.wildignore
ignore = ignore .. '*.o,*.obj,*.bin,*.dll,*.exe,'
ignore = ignore .. '*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**,'
ignore = ignore .. '*.pyc,*.out,'
ignore = ignore .. '*.DS_Store,'
ignore = ignore .. '*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.pdf,'
o.wildignore = ignore -- Ignore certain files and folders when globbing
---------------------------
o.hidden = true -- Switch buffers painlessly
o.lazyredraw = true -- Macros don't show any animation
-- The eob removes ~ at the end of buffer
o.fillchars = 'diff:∙,fold:·,vert:│,eob: '
---------------------------
-- Show tabs and spaces
local listchars = ''
-- listchars = listchars .. 'eol:↲,'
listchars = listchars .. 'tab:»·,'
-- listchars = listchars .. 'space:␣,'
listchars = listchars .. 'trail:•,'
listchars = listchars .. 'extends:☛,'
listchars = listchars .. 'precedes:☚,'
listchars = listchars .. 'conceal:┊,'
listchars = listchars .. 'nbsp:☠'
o.listchars = listchars
---------------------------
-- Show line break
o.showbreak = '↳ '
o.showcmd = false
-- These setting are needed for better completion behaviour and some annoyances
-- c = completion messages
-- W = don't echo "[w]"/"[written]" when writing
-- I = no splash screen
-- a = use abbreviations in messages eg. `[RO]` instead of `[readonly]`
o.completeopt = 'menuone,noselect'
o.shortmess = vim.o.shortmess .. 'cWIa'
-- statusline
-- 2 = always show it
-- 1 = show only when there is a split
-- 0 = never show it
o.laststatus = 0
-- Scrolling lines starts 5 lines above the last one
o.scrolloff = 8
-- Font used by neovim gui
o.guifont = "agave Nerd Font:h17"
o.hlsearch = false
o.incsearch = true
-- guicursor
o.guicursor = "" -- disabling the guicursor

-- ++------ GLOBAL VARIABLES ------++
-- Set the Leader key
g.mapleader = " "
-- Disable the built-in plugins
g.loaded_netrwPlugin = 1
g.loaded_2html_plugin = 1 -- Do not load tohtml.vim
g.loaded_vimball = 1
g.loaded_justify = 1
g.loaded_cfilter = 1
g.loaded_shellmenu = 1
g.loaded_termdebug = 1
-- undodir
g.undodir = "~/.config/nvim/.undodir"

-- ++------ BUFFER OPTIONS ------++
-- These settings also need to be set as
-- global options don't know why.
bo.ts=4
bo.sts=4
bo.shiftwidth=4 -- spaces for autoindent
bo.expandtab = true -- Turn of tabs
bo.undofile = true

-- ++------ WINDOW OPTIONS ------++
-- Enables some characters that show up when using tab and trailing spaces
wo.list=true
-- Cursor line
wo.cursorline = false
wo.colorcolumn = "120"
wo.wrap = false
wo.lbr = true

-- ++------ KEY BINDINGS ------++
local normal_silent = { silent = true, noremap = true }
local normal_echo = { silent = false, noremap = true }
-- Edit command but more useful
map('n', '<leader>ew', ':e    <C-R>=expand("%:p:h") . "/" <CR>' , normal_echo)
map('n', '<leader>es', ':sp   <C-R>=expand("%:p:h") . "/" <CR>' , normal_echo)
map('n', '<leader>ev', ':vsp  <C-R>=expand("%:p:h") . "/" <CR>' , normal_echo)
map('n', '<leader>et', ':tabe <C-R>=expand("%:p:h") . "/" <CR>' , normal_echo)
-- Tabs
map('n' , 'tn' , ':tabnew  <CR>'  , normal_silent)
-- Buffers
map('n' , '<leader>bd'       , ':bd <CR>'                 , normal_silent)
map('n' , '<leader><leader>' , '<C-^>'                    , normal_silent)
map('n' , 'gbp' , ':bp<cr>' , normal_silent)
map('n' , 'gbn' , ':bn<cr>' , normal_silent)
map('n' , '<leader>cd'       , [[:lcd %:p:h<CR>:pwd<CR>]] , normal_silent)
-- Windows
map('n', '<A-h>', '<C-w>h', normal_silent)
map('n', '<A-j>', '<C-w>j', normal_silent)
map('n', '<A-k>', '<C-w>k', normal_silent)
map('n', '<A-l>', '<C-w>l', normal_silent)
-- Resize
map('n', '<C-M-h>', ':vertical resize -2<CR>', normal_silent)
map('n', '<C-M-l>', ':vertical resize +2<CR>', normal_silent)
map('n', '<C-M-j>', ':resize -2<CR>', normal_silent)
map('n', '<C-M-k>', ':resize +2<CR>', normal_silent)
-- Terminal
map('t' , '<A-h>' , [[<C-\><C-N><C-w>h]] , normal_silent)
map('t' , '<A-j>' , [[<C-\><C-N><C-w>j]] , normal_silent)
map('t' , '<A-k>' , [[<C-\><C-N><C-w>k]] , normal_silent)
map('t' , '<A-l>' , [[<C-\><C-N><C-w>l]] , normal_silent)

-- ++------ My Functions ------++
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
map('n', '<f7>', [[<cmd>lua toggleLineNumbers()<cr>]], normal_silent)

-- ++------ Plugins ------++

vim.cmd('packadd! modus-theme-vim')
vim.cmd('colorscheme modus-vivendi')

vim.cmd('packadd! nvim-toggleterm.lua')
require"toggleterm".setup{
    size = 15,
    open_mapping = [[<M-t>]],
    shade_filetypes = {},
    shade_terminals = false,
    start_in_insert = true,
    persist_size = true,
    direction = 'horizontal',
}

vim.cmd('packadd! tabular')
vim.cmd('packadd! vim-commentary')
vim.cmd('packadd! vim-dirvish')
vim.cmd('packadd! vim-nix')
vim.cmd('packadd! vim-polyglot')
vim.cmd('packadd! vim-repeat')
vim.cmd('packadd! vim-surround')
