local o = vim.o
local wo = vim.wo
local g = vim.g

g.mapleader = ' '

o.termguicolors = true

vim.cmd('filetype plugin indent on') -- Filetype flygin on
vim.cmd('syntax enable') -- enable syntax highlighting

o.scrolloff = 5 -- Scrolling lines starts 5 lines above the last one

-- Foldmethod
wo.foldmethod='expr'
wo.foldlevel=99
wo.foldexpr='nvim_treesitter#foldexpr()'

-- Tabstop
o.tabstop = 2
vim.bo.tabstop = 2

-- Set the path to find the file in a project
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

-- Do not load netrw by default since I do not use it, see
-- https://github.com/bling/dotvim/issues/4
g.loaded_netrwPlugin = 1

g.loaded_2html_plugin = 1 -- Do not load tohtml.vim

-- The eob removes ~ at the end of buffer
o.fillchars = 'diff:∙,fold:·,vert:┃,eob: '

-- Show tabs and spaces
wo.list=true
o.listchars='nbsp:⦸,extends:»,precedes:«,trail:•,tab:▸ '

-- Cursor line
wo.cursorline = true

-- Show line break
o.showbreak = '↳ '

o.showcmd = false

-- These setting are needed for better completion behaviour and some annoyances
o.completeopt = 'menuone,noinsert,noselect'
o.shortmess = vim.o.shortmess .. 'cWIa'

-- c = completion messages
-- W = don't echo "[w]"/"[written]" when writing
-- I = no splash screen
-- a = use abbreviations in messages eg. `[RO]` instead of `[readonly]`

o.ts=4 -- tab width
o.sts=4
o.shiftwidth=4 -- spaces for autoindent
o.expandtab = true -- Turn of tabs

require('core')
