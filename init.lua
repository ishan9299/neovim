local o = vim.o
local wo = vim.wo
local g = vim.g
local bo = vim.bo

vim.cmd('filetype plugin indent on') -- Filetype flygin on
vim.cmd('syntax enable') -- enable syntax highlighting
g.modus_moody_enable = 1
vim.cmd('packadd! colorbuddy.nvim')
require('colorbuddy').colorscheme('modus-operandi')
-- vim.cmd('colorscheme modus-operandi')

-- ++------ BUFFER OPTIONS ------++
-- These settings also need to be set as
-- global options don't know why.
bo.ts=4
bo.sts=4
bo.shiftwidth=4 -- spaces for autoindent
bo.expandtab = true -- Turn of tabs

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


-- ++------ GLOBAL OPTIONS ------++
-- Tabstop
o.ts=4
o.sts=4
o.shiftwidth=4 -- spaces for autoindent
o.expandtab = true -- Turn of tabs
-- Set the path to find the file in a project
o.termguicolors = true
o.path = o.path .. '**'

local ignore = o.wildignore
ignore = ignore .. '*.o,*.obj,*.bin,*.dll,*.exe,'
ignore = ignore .. '*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**,'
ignore = ignore .. '*.pyc,'
ignore = ignore .. '*.DS_Store,'
ignore = ignore .. '*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.pdf,'
o.wildignore = ignore -- Ignore certain files and folders when globbing

o.hidden = true -- Switch buffers painlessly
o.lazyredraw = true -- Macros don't show any animation
-- The eob removes ~ at the end of buffer
o.fillchars = 'diff:∙,fold:·,vert:┃,eob: '
-- Show tabs and spaces
o.listchars='eol:↲,nbsp:¬,extends:»,precedes:«,trail:•,tab:▸ '
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
o.scrolloff = 5
-- Font used by neovim gui
o.guifont = 'Iosevka Nerd Font Mono:h17'


-- ++------ GLOBAL VARIABLES ------++
-- Set the Leader key
g.mapleader = ' '
-- Disable the built-in plugins
g.loaded_netrwPlugin = 1
g.loaded_2html_plugin = 1 -- Do not load tohtml.vim
g.loaded_vimball = 1
g.loaded_justify = 1
g.loaded_cfilter = 1
g.loaded_shellmenu = 1
g.loaded_termdebug = 1



-- Lua files
require('core')
