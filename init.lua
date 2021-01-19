local o = vim.o
local wo = vim.wo
local g = vim.g
local bo = vim.bo
local utils = require('utils')
local map = vim.api.nvim_set_keymap

vim.cmd('filetype plugin indent on') -- Filetype flygin on
vim.cmd('syntax enable') -- enable syntax highlighting

-- ++------ GLOBAL OPTIONS ------++
-- Tabstop
o.ts=4
o.sts=4
o.shiftwidth=4 -- spaces for autoindent
o.expandtab = true -- Turn of tabs
-- Set the path to find the file in a project
o.termguicolors = true
o.path = o.path .. '**'
---------------------------
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
-- Show tabs and spaces
local listchars = ''
-- listchars = listchars .. 'eol:↲,'
listchars = listchars .. 'tab:»·,'
-- listchars = listchars .. 'space:␣,'
listchars = listchars .. 'trail:-,'
listchars = listchars .. 'extends:☛,'
listchars = listchars .. 'precedes:☚,'
listchars = listchars .. 'conceal:┊,'
listchars = listchars .. 'nbsp:☠'
o.listchars = listchars
-- Show line break
o.showbreak = '↳ '
o.showcmd = false
-- These setting are needed for better completion behaviour and some annoyances
-- c = completion messages
-- W = don't echo "[w]"/"[written]" when writing
-- I = no splash screen
-- a = use abbreviations in messages eg. `[RO]` instead of `[readonly]`
o.completeopt = 'menuone,noinsert,noselect'
o.shortmess = vim.o.shortmess .. 'cWIa'
-- statusline
-- 2 = always show it
-- 1 = show only when there is a split
-- 0 = never show it
o.laststatus = 2
-- Scrolling lines starts 5 lines above the last one
o.scrolloff = 8
-- Font used by neovim gui
o.guifont = "Iosevka Nerd Font Mono:h17"
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
-- Foldmethod
wo.foldmethod='expr'
wo.foldlevel=99
wo.foldexpr='nvim_treesitter#foldexpr()'
-- Relative line numbers to get normal line number set relative line number as false
wo.relativenumber = true
wo.number = true
-- Enables some characters that show up when using tab and trailing spaces
wo.list=true
-- Cursor line
wo.cursorline = true
wo.colorcolumn = "120"
wo.wrap = false
-- folding
wo.foldmethod = "expr"
wo.foldexpr = "nvim_treesitter#foldexpr()"

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
map('n'  , 'gbp' , ':bp<cr>' , normal_silent)
map('n'  , 'gbn' , ':bn<cr>' , normal_silent)
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
map('t' , '<esc>' , [[<C-\><C-N>]]       , normal_silent)
map('t' , '<A-h>' , [[<C-\><C-N><C-w>h]] , normal_silent)
map('t' , '<A-j>' , [[<C-\><C-N><C-w>j]] , normal_silent)
map('t' , '<A-k>' , [[<C-\><C-N><C-w>k]] , normal_silent)
map('t' , '<A-l>' , [[<C-\><C-N><C-w>l]] , normal_silent)
-- For colorscheme and highlight groups
map('n', '<f10>' , [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' <cr>]] , normal_silent)

-- ++------ Autocmds ------++
local core_autocmds = {
    git = {
        {"FileType", "gitcommit" , "setl spell"};
        {"FileType", "gitcommit" , "setl complete+=kspell"};
    };

    terminal = {
        {"TermOpen", "*", "setlocal norelativenumber nonumber"};
        {"TermOpen", "*", "startinsert"};
    };

    makefile = {
        {"FileType", "make", [[ setl lcs=tab:»· | setl lcs+=space:␣ | setl noexpandtab ]]}
    };

    c_stuff = {
        {"FileType", "c", "setlocal colorcolumn=80"};
        {"FileType", "cpp", "setlocal colorcolumn=80"}
    }
}
utils.nvim_create_augroups(core_autocmds)
