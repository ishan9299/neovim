-- vim: foldmethod=marker

local api = vim.api
require('utils') 

local opts = { silent = true, noremap = true }

vim.g.mapleader = ' '

-- Plugins
api.nvim_command('packadd! vim-dirvish')
api.nvim_command('packadd! vim-repeat')
api.nvim_command('packadd! vim-commentary')
api.nvim_command('packadd! vim-snippets')
api.nvim_command('packadd! ultisnips')
api.nvim_command('packadd! vim-polyglot')
api.nvim_command('packadd! nvim-lsp')
api.nvim_command('packadd! completion-nvim')
api.nvim_command('packadd! diagnostic-nvim')
api.nvim_command('packadd! colorbuddy.vim')
api.nvim_command('packadd! nvim-colorizer.lua')
api.nvim_command('packadd! direnv.vim')
api.nvim_command('packadd! fzf')
api.nvim_command('packadd! fzf.vim')
api.nvim_command('packadd! vim-pandoc-syntax')
api.nvim_command('packadd! vim-waikiki')

-- Colorizer
require'colorizer'.setup()

--- Mappings {{{1
-- Edit command
api.nvim_set_keymap('n', '<leader>ew', ':e    <C-R>=expand("%:p:h") . "/" <CR>' , { silent = false, noremap = true })
api.nvim_set_keymap('n', '<leader>es', ':sp   <C-R>=expand("%:p:h") . "/" <CR>'	, { silent = false, noremap = true })
api.nvim_set_keymap('n', '<leader>ev', ':vsp  <C-R>=expand("%:p:h") . "/" <CR>' , { silent = false, noremap = true })
api.nvim_set_keymap('n', '<leader>et', ':tabe <C-R>=expand("%:p:h") . "/" <CR>' , { silent = false, noremap = true })

-- Tabs
api.nvim_set_keymap('n' , 'tn' , ':tabnew  <CR>'  , opts)
api.nvim_set_keymap('n' , 'tj' , ':tabprev <CR>'  , opts)
api.nvim_set_keymap('n' , 'tk' , ':tabNext <CR>'  , opts)

-- Buffers
api.nvim_set_keymap('n' , '<leader>bd'       , ':bd <CR>' , opts)
api.nvim_set_keymap('n' , '<leader><leader>' , '<C-^>'    , opts)


-- Windows 
api.nvim_set_keymap('n', '<A-h>', '<C-w>h', opts)
api.nvim_set_keymap('n', '<A-j>', '<C-w>j', opts)
api.nvim_set_keymap('n', '<A-k>', '<C-w>k', opts)
api.nvim_set_keymap('n', '<A-l>', '<C-w>l', opts)


-- Terminal
api.nvim_set_keymap('t' , '<esc>' , [[<C-\><C-N>]]       , opts)
api.nvim_set_keymap('t' , '<A-h>' , [[<C-\><C-N><C-w>h]] , opts)
api.nvim_set_keymap('t' , '<A-j>' , [[<C-\><C-N><C-w>j]] , opts)
api.nvim_set_keymap('t' , '<A-k>' , [[<C-\><C-N><C-w>k]] , opts)
api.nvim_set_keymap('t' , '<A-l>' , [[<C-\><C-N><C-w>l]] , opts)

-- For colorscheme highlight groups
api.nvim_set_keymap('n', '<f10>' , [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' <cr>]] , opts)

--- }}}

--- Options {{{1
-- UI

-- Winhighlight command
api.nvim_set_option('winhighlight','NormalNC:ColorColumn')


-- Colorschemes

-- local background = api.nvim_get_option('bg')
-- function toggle_theme(background)
-- 	if background == 'light' then
-- 		require('modus-vivendi')
-- 	else
-- 		require('modus-operandi')
-- 	end
-- end

require('modus-operandi')
api.nvim_set_keymap('n', '<f5>', [[<cmd> lua toggle_theme <cr>]] , opts)

-- Relative line numbers
vim.wo.relativenumber = true
vim.wo.number = true

-- Show unwanted tabs and spaces
api.nvim_set_option('listchars','tab:▸ ,extends:❯,precedes:❮,nbsp:+')
api.nvim_set_option('fillchars','fold: ,vert:┃')

-- Set height of status line
api.nvim_set_option('laststatus',1)


-- Global Settings

api.nvim_command('filetype plugin indent on')
api.nvim_command('syntax enable')


-- Set the path to find the file in a project
local my_path = api.nvim_get_option('path')
my_path = my_path .. '**'
api.nvim_set_option('path',my_path)


-- Ignore certain files and folders when globbing
local ignore = api.nvim_get_option('wildignore')
ignore = ignore .. '*.o,*.obj,*.bin,*.dll,*.exe,'
ignore = ignore .. '*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**,'
ignore = ignore .. '*.pyc,'
ignore = ignore .. '*.DS_Store,'
ignore = ignore .. '*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.pdf,'

api.nvim_set_option('wildignore',ignore)

-- Set font for gapi.nvim
api.nvim_set_option('guifont','Fira Mono:h16')

-- Switch buffers painlessly
api.nvim_set_option('hidden',true)


-- Do not load netrw by default since I do not use it, see
-- https://github.com/bling/dotvim/issues/4
api.nvim_set_var('loaded_netrwPlugin',1)

-- Do not load tohtml.vim
api.nvim_set_var('loaded_2html_plugin',1)


-- Autocmds 
local autocmds = {
	highlight_yank = {
		{"TextYankPost", "*", [[silent! lua require'vim.highlight'.on_yank("Substitute", 200)]]};
	};

	pandoc_syntax = {
		{"BufNewFile,BufFilePre,BufRead", "*.md", "set filetype=markdown.pandoc"};
	};

	terminal = {
		{"TermOpen", "*", "setlocal norelativenumber nonumber"};
		{"TermOpen", "*", "startinsert"};
	};

	completion = {
		{ " Filetype " , " c     , cpp " , " setl omnifunc=v:lua.vim.lsp.omnifunc " };
		{ " Filetype " , " rust        " , " setl omnifunc=v:lua.vim.lsp.omnifunc " };
		{ " Filetype " , " lua         " , " setl omnifunc=v:lua.vim.lsp.omnifunc " };
		{ " Filetype " , " vim         " , " setl omnifunc=v:lua.vim.lsp.omnifunc " };
	};
}

nvim_create_augroups(autocmds)


--- }}}

--- Terminal
terminal = {
	position = 'botright split',
	width    = nil,
	height   = 0.25,
	command  = 'silent! lcd %:h | term'
}
api.nvim_set_keymap('n', '<f7>', [[<cmd>lua require'window'.create_win(terminal)<cr>]], opts)


--- Dirvish
dirvish = {
	position = 'vsplit',
	width    = 0.25,
	height   = nil,
	command  = 'silent! lcd %h | Dirvish'
}
api.nvim_set_keymap('n', '<C-e>', [[<cmd>lua require'window'.create_win(dirvish)<cr>]], opts)
