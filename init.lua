local o = vim.o
local g = vim.g

g.mapleader = ' '

o.termguicolors = true

vim.cmd('filetype plugin indent on') -- Filetype flygin on
vim.cmd('syntax enable') -- enable syntax highlighting

vim.o.scrolloff = 5 -- Scrolling lines starts 5 lines above the last one

-- Foldmethod
vim.wo.foldmethod='expr'
vim.wo.foldlevel=99
vim.wo.foldexpr='nvim_treesitter#foldexpr()'

-- Tabstop
vim.o.tabstop = 2
vim.bo.tabstop = 2

local my_path = o.path
my_path = my_path .. '**'
vim.o.path = my_path -- Set the path to find the file in a project


local ignore = o.wildignore
ignore = ignore .. '*.o,*.obj,*.bin,*.dll,*.exe,'
ignore = ignore .. '*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**,'
ignore = ignore .. '*.pyc,'
ignore = ignore .. '*.DS_Store,'
ignore = ignore .. '*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.pdf,'

vim.o.wildignore = ignore -- Ignore certain files and folders when globbing

vim.o.hidden = true -- Switch buffers painlessly

vim.o.lazyredraw = true -- Macros don't show any animation

-- Do not load netrw by default since I do not use it, see
-- https://github.com/bling/dotvim/issues/4
vim.g.loaded_netrwPlugin = 1

vim.g.loaded_2html_plugin = 1 -- Do not load tohtml.vim

-- The eob removes ~ at the end of buffer
vim.o.fillchars = 'diff:∙,fold:·,vert:┃,eob: '

-- Show tabs and spaces
vim.wo.list=true
vim.o.listchars='nbsp:⦸,extends:»,precedes:«,trail:•,tab:▸ '

-- Cursor line
vim.wo.cursorline = true

-- Show line break
vim.o.showbreak = '↳ '

vim.o.showcmd = false

-- These setting are needed for better completion behaviour and some annoyances
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.shortmess = vim.o.shortmess .. 'cWIa'

-- c = completion messages
-- W = don't echo "[w]"/"[written]" when writing
-- I = no splash screen
-- a = use abbreviations in messages eg. `[RO]` instead of `[readonly]`



require('core')
