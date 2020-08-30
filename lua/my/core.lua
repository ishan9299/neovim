-- vim: foldmethod=marker

local api = vim.api
require('utils') 

local opts = { silent = true, noremap = true }

vim.g.mapleader = ' '

--- Mappings {{{1
-- Edit command {{{2
api.nvim_set_keymap('n', '<leader>ew', ':e <C-R>=expand("%:p:h") . "/" <CR>', { silent = false, noremap = true })
api.nvim_set_keymap('n', '<leader>es', ':sp <C-R>=expand("%:p:h") . "/" <CR>', { silent = false, noremap = true })
api.nvim_set_keymap('n', '<leader>ev', ':vsp <C-R>=expand("%:p:h") . "/" <CR>', { silent = false, noremap = true })
api.nvim_set_keymap('n', '<leader>et', ':tabe <C-R>=expand("%:p:h") . "/" <CR>', { silent = false, noremap = true })
-- }}}

-- Buffers {{{2
api.nvim_set_keymap('n', '<leader>bd', ':bd <CR>', opts)
api.nvim_set_keymap('n', '<leader><leader>', '<C-^>', opts)
-- }}}

-- Windows {{{2
api.nvim_set_keymap('n', '<A-h>', '<C-w>h', opts)
api.nvim_set_keymap('n', '<A-j>', '<C-w>j', opts)
api.nvim_set_keymap('n', '<A-k>', '<C-w>k', opts)
api.nvim_set_keymap('n', '<A-l>', '<C-w>l', opts)
-- }}}

-- Terminal {{{2
api.nvim_set_keymap('t', '<esc>', [[<C-\><C-N>]], opts)
api.nvim_set_keymap('t', '<A-h>', [[<C-\><C-N><C-w>h]], opts)
api.nvim_set_keymap('t', '<A-j>', [[<C-\><C-N><C-w>j]], opts)
api.nvim_set_keymap('t', '<A-k>', [[<C-\><C-N><C-w>k]], opts)
api.nvim_set_keymap('t', '<A-l>', [[<C-\><C-N><C-w>l]], opts)
-- }}}

--- }}}


--- Options {{{1
-- UI{{{2

-- Winhighlight command
api.nvim_set_option('winhighlight','NormalNC:ColorColumn')

-- Colorschemes
function toggle_light_dark()
	local background = api.nvim_get_option('bg')
	if background == 'light' then
		api.nvim_set_option('bg','dark')
	else
		api.nvim_set_option('bg','light')
	end
end
api.nvim_set_keymap('n', '<F5>', '<cmd>lua toggle_light_dark()<CR>', opts)
api.nvim_command('colorscheme PaperColor')

-- Relative line numbers
vim.wo.relativenumber = true
vim.wo.number = true

-- Termguicolors
api.nvim_set_option('termguicolors',true)

-- Show unwanted tabs and spaces
api.nvim_set_option('listchars','tab:▸ ,extends:❯,precedes:❮,nbsp:+')
api.nvim_set_option('fillchars','fold: ,vert:┃')

-- Set height of status line
api.nvim_set_option('laststatus',1)

-- }}}

-- Global Settings{{{2

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

-- }}}

-- Autocmds {{{2
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

-- }}}

--- }}}

--- Terminal {{{1
terminal = {
	position = 'botright split',
	width = nil,
	height = 0.25,
	command = 'silent! lcd %:h | term'
}

api.nvim_set_keymap('n', '<f7>', [[<cmd>lua require'window'.create_win(terminal)<cr>]], opts)
--- }}}

--- Dirvish {{{1
dirvish = {
	position = 'vsplit',
	width = 0.25,
	height = nil,
	command = 'silent! lcd %h | Dirvish'
}
api.nvim_set_keymap('n', '<C-e>', [[<cmd>lua require'window'.create_win(dirvish)<cr>]], opts)
--- }}}
