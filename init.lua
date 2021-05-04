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
o.laststatus = 0 -- only show the statusline when a split exists
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

-- -------- Plugins ----------
cmd('packadd! neorg')
cmd('packadd! tabular')
cmd('packadd! vim-commentary')
cmd('packadd! plenary')
cmd('packadd! popup')
cmd('packadd! nvim-web-devicons')
cmd('packadd! lir')
cmd('packadd! lir-bookmarks')
cmd('packadd! lir-mmv')

local actions = require 'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require 'lir.clipboard.actions'
local mmv_actions = require 'lir.mmv.actions'
local bookmark_actions = require 'lir.bookmark.actions'

require'lir'.setup {
    show_hidden_files = false,
    devicons_enable = true,
    mappings = {
        ['l'] = actions.edit,
        ['<C-s>'] = actions.split,
        ['<C-v>'] = actions.vsplit,
        ['<C-t>'] = actions.tabedit,

        ['h'] = actions.up,
        ['q'] = actions.quit,
        ['<C-[>'] = actions.quit,

        ['K'] = actions.mkdir,
        ['N'] = actions.newfile,
        ['R'] = actions.rename,
        ['@'] = actions.cd,
        ['Y'] = actions.yank_path,
        ['D'] = actions.delete,
        ['.'] = actions.toggle_show_hidden,

        ['J'] = function()
            mark_actions.toggle_mark()
            vim.cmd('normal! j')
        end,
        ['C'] = clipboard_actions.copy,
        ['X'] = clipboard_actions.cut,
        ['P'] = clipboard_actions.paste,

        ['M'] = mmv_actions.mmv,

        ['B'] = bookmark_actions.list,
        ['ba'] = bookmark_actions.add
    },
    hide_cursor = true
}

local b_actions = require 'lir.bookmark.actions'
require'lir.bookmark'.setup {
    bookmark_path = '~/.lir_bookmark',
    mappings = {
        ['l'] = b_actions.edit,
        ['<C-s>'] = b_actions.split,
        ['<C-v>'] = b_actions.vsplit,
        ['<C-t>'] = b_actions.tabedit,
        ['<C-e>'] = b_actions.open_lir,
        ['B'] = b_actions.open_lir,
        ['q'] = b_actions.open_lir
    }
}

-- custom folder icon
require'nvim-web-devicons'.setup({
    override = {
        lir_folder_icon = {
            icon = "",
            color = "#7ebae4",
            name = "LirFolderNode"
        }
    }
})

-- use visual mode
function _G.LirSettings()
    vim.api.nvim_buf_set_keymap(0, 'x', 'J',
                                ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
                                {noremap = true, silent = true})

    -- echo cwd
    vim.api.nvim_echo({{vim.fn.expand('%:p'), 'Normal'}}, false, {})
end

vim.cmd [[augroup lir-settings]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd Filetype lir :lua LirSettings()]]
vim.cmd [[augroup END]]
map('n', '-', [[:lua require'lir.float'.toggle()<cr>]], normal_mode_silent)

cmd('packadd! vim-repeat')
cmd('packadd! vim-surround')
cmd('packadd! vim-startuptime')
cmd('packadd! nvim-web-devicons')
cmd('packadd! galaxyline')
cmd('packadd! glow')
-- ------- ColorsScheme -------
cmd('packadd! lush')
cmd('packadd! modus-theme-vim')
cmd('packadd! nvim-solarized-lua')
cmd('packadd! zephyr-nvim')
cmd('packadd! nvcode-color-scheme')
cmd('packadd! tokyonight')
cmd('packadd! material')
cmd('packadd! one-nvim')
cmd('packadd! melange')
cmd('packadd! gruvbox')
o.bg = 'light'
-- g.modus_moody_line = 1
-- g.solarized_visibility = 'normal'
cmd('colorscheme modus-vivendi')
-- g.solarized_statusline = 'flat'
-- cmd('colorscheme solarized-flat')

-- ------- Extra Plugins ----------
cmd('packadd! nvim-toggleterm')
require"toggleterm".setup {
    size = 10,
    open_mapping = [[<M-t>]],
    shade_filetypes = {},
    shade_terminals = false,
    start_in_insert = true,
    persist_size = true,
    direction = 'float'
}

cmd('packadd! lspconfig')
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {noremap = true, silent = true}
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',
                   opts)
    buf_set_keymap('n', '<space>D',
                   '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e',
                   '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
                   opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
                   opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
                   opts)
    buf_set_keymap('n', '<space>q',
                   '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = {"ccls", "rust_analyzer"}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        settings = {
            ["rust-analyzer"] = {
                assist = {
                    importMergeBehavior = "last",
                    importPrefix = "by_self"
                },
                cargo = {loadOutDirsFromCheck = true},
                procMacro = {enable = true}
            }
        }
    }
end

----- Syntax Plugins ------
cmd('packadd! vim-nix')
cmd('packadd! vim-fish')
cmd('packadd! vim-cpp-modern')
cmd('packadd! vim-cmake-syntax')
cmd('packadd! vim-glsl')
cmd('packadd! vim-go')
cmd('packadd! BetterLua')
----------- Telescope -----------
cmd('packadd! nvim-telescope')
map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>",
    normal_mode_silent)
map('n', '<leader>lg', "<cmd>lua require('telescope.builtin').live_grep()<cr>",
    normal_mode_silent)
map('n', '<leader>lb', "<cmd>lua require('telescope.builtin').buffers()<cr>",
    normal_mode_silent)
map('n', '<leader>hh', "<cmd>lua require('telescope.builtin').help_tags()<cr>",
    normal_mode_silent)
map('n', '<leader>tc',
    "<cmd>lua require('telescope.builtin').colorscheme()<cr>",
    normal_mode_silent)
--------------------------------
-- --- Completion Plugin -------
cmd('packadd! nvim-compe')
require'compe'.setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,

    source = {
        path = true,
        buffer = true,
        calc = true,
        nvim_lsp = true,
        nvim_lua = true,
        vsnip = false
    }
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = fn.col('.') - 1
    if col == 0 or fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
-- + move to prev/next item in completion menuone
-- + jump to prev/next snippet's placeholder

_G.tab_complete = function()
    if fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return fn['compe#complete']()
    end
end

_G.s_tab_complete = function()
    if fn.pumvisible() == 1 then
        return t "<C-p>"
    else
        return t "<S-Tab>"
    end
end

map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
----------------------------
-- ---- Truezen -------
cmd('packadd! truezen')
local true_zen = require("true-zen")

-- setup for TrueZen.nvim
true_zen.setup({
    true_false_commands = false,
	cursor_by_mode = false,
	bottom = {
		hidden_laststatus = 0,
		hidden_ruler = false,
		hidden_showmode = false,
		hidden_showcmd = false,
		hidden_cmdheight = 1,

		shown_laststatus = 0,
		shown_ruler = true,
		shown_showmode = false,
		shown_showcmd = false,
		shown_cmdheight = 1
	},
	top = {
		hidden_showtabline = 0,

		shown_showtabline = 1
	},
	left = {
		hidden_number = false,
		hidden_relativenumber = false,
		hidden_signcolumn = "no",

		shown_number = false,
		shown_relativenumber = false,
		shown_signcolumn = "no"
	},
	ataraxis = {
		ideal_writing_area_width = 0,
		just_do_it_for_me = false,
		left_padding = 10,
		right_padding = 10,
		top_padding = 0,
		bottom_padding = 0,
		custome_bg = "",
		disable_bg_configuration = false,
		disable_fillchars_configuration = false,
		force_when_plus_one_window = false,
		force_hide_statusline = true
	},
	focus = {
		margin_of_error = 5,
		focus_method = "experimental"
	},
	events = {
		before_minimalist_mode_shown = false,
		before_minimalist_mode_hidden = false,
		after_minimalist_mode_shown = false,
		after_minimalist_mode_hidden = false
	},
	integrations = {
		integration_galaxyline = true,
		integration_tmux = true,
	}
})

-- Toggle Line Numbers
function _G.toggleLineNumbers()
    local relativeNumbers = (wo.rnu and wo.nu)
    local numbers = wo.nu
    if (numbers == false) then
        wo.nu = true -- move to normal lineNumbers
    elseif (numbers == true and relativeNumbers == false) then
        wo.rnu = true -- move to relativeNumbers
    elseif (relativeNumbers == true) then
        wo.nu = false -- hide the numbering
        wo.rnu = false -- hide the relative numbering
    end
end
map('n', '<f7>', [[<cmd>lua toggleLineNumbers()<cr>]], normal_mode_silent) -- toggle line numbers [f7]

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

map('n', '<leader>ew', ':e    <C-R>=expand("%:p:h") . "/" <CR>',
    normal_mode_echo) -- open a new file in a current window [<space>ew]
map('n', '<leader>es', ':sp   <C-R>=expand("%:p:h") . "/" <CR>',
    normal_mode_echo) -- open a new file in a horizontal split [<space>es]
map('n', '<leader>ev', ':vsp  <C-R>=expand("%:p:h") . "/" <CR>',
    normal_mode_echo) -- open a new file in a vertical split [<space>ev]
map('n', '<leader>et', ':tabe <C-R>=expand("%:p:h") . "/" <CR>',
    normal_mode_echo) -- open a new file in a new tab [<space>et]
