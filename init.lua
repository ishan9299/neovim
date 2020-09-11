-- vim: foldmethod=marker
local vim = vim
local api = vim.api

local utils = require('utils')
-- Options {{{1
vim.g.mapleader = ' '

-- Relative line numbers
vim.wo.relativenumber = true
vim.wo.number = true

-- Set height of status line
vim.o.laststatus = 1

-- Global Settings

api.nvim_command('filetype plugin indent on')
api.nvim_command('syntax enable')

-- Scrolloff
vim.o.scrolloff = 5

-- Tabstop
api.nvim_set_option('tabstop',2)
vim.o.tabstop = 2

-- Set the path to find the file in a project
local my_path = api.nvim_get_option('path')
my_path = my_path .. '**'
-- api.nvim_set_option('path',my_path)
vim.o.path = my_path


-- Ignore certain files and folders when globbing
local ignore = api.nvim_get_option('wildignore')
ignore = ignore .. '*.o,*.obj,*.bin,*.dll,*.exe,'
ignore = ignore .. '*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**,'
ignore = ignore .. '*.pyc,'
ignore = ignore .. '*.DS_Store,'
ignore = ignore .. '*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.pdf,'

-- api.nvim_set_option('wildignore',ignore)
vim.o.wildignore = ignore

-- Set font for gnvim
-- api.nvim_set_option('guifont','SauceCodePro Nerd Font Medium:h17')
vim.o.guifont = 'SauceCodePro Nerd Font Medium:h17'

-- Switch buffers painlessly
-- api.nvim_set_option('hidden',true)
vim.o.hidden = true

vim.o.lazyredraw = true

-- Do not load netrw by default since I do not use it, see
-- https://github.com/bling/dotvim/issues/4
vim.g.loaded_netrwPlugin = 1

-- Do not load tohtml.vim
vim.g.loaded_2html_plugin = 1

-- The eob removes ~ at the end of buffer
-- vert gives a line when vertically split
vim.o.fillchars = 'diff:∙,fold:·,vert:┃,eob: '

-- Show tabs and spaces
vim.o.listchars='nbsp:⦸,extends:»,precedes:«,trail:•,tab:▸ '

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

-- }}}


--- Mappings {{{1
-- Edit command
local opts = { silent = true, noremap = true }
api.nvim_set_keymap('n', '<leader>ew', ':e    <C-R>=expand("%:p:h") . "/" <CR>' , { silent = false, noremap = true })
api.nvim_set_keymap('n', '<leader>es', ':sp   <C-R>=expand("%:p:h") . "/" <CR>' , { silent = false, noremap = true })
api.nvim_set_keymap('n', '<leader>ev', ':vsp  <C-R>=expand("%:p:h") . "/" <CR>' , { silent = false, noremap = true })
api.nvim_set_keymap('n', '<leader>et', ':tabe <C-R>=expand("%:p:h") . "/" <CR>' , { silent = false, noremap = true })

-- Tabs
api.nvim_set_keymap('n' , 'tn' , ':tabnew  <CR>'  , opts)
api.nvim_set_keymap('n' , 'tj' , ':tabprev <CR>'  , opts)
api.nvim_set_keymap('n' , 'tk' , ':tabNext <CR>'  , opts)

-- Buffers
api.nvim_set_keymap('n' , '<leader>bd'       , ':bd <CR>'                 , opts)
api.nvim_set_keymap('n' , '<leader><leader>' , '<C-^>'                    , opts)
api.nvim_set_keymap('n' , '<leader>cd'       , [[:lcd %:p:h<CR>:pwd<CR>]] , opts)

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

-- Plugins {{{1
-- Tpope plugins text editing
api.nvim_command('packadd! vim-dirvish')
api.nvim_command('packadd! vim-repeat')
api.nvim_command('packadd! vim-commentary')
api.nvim_command('packadd! vim-surround')

-- Lsp plugins
api.nvim_command('packadd! nvim-lsp')
api.nvim_command('packadd! completion-nvim')
api.nvim_command('packadd! diagnostic-nvim')

-- treesitter I am not using it now
api.nvim_command('packadd! nvim-treesitter')

-- colorschemes
api.nvim_command('packadd! nvim-colorizer.lua')

-- Integrate with nix-shell in direnv
api.nvim_command('packadd! direnv.vim')

-- My own theme needs colorbuddy
api.nvim_command('packadd! modus-theme-vim')
api.nvim_command('packadd! colorbuddy.vim')

-- Syntax for lua
api.nvim_command('packadd! BetterLua.vim')

-- plugins for functionality
api.nvim_command('packadd! vim-waikiki')
api.nvim_command('packadd! tabular')
--- }}}

-- Colorschemes
-- TODO find a way to toggle the theme between light and dark
require('colorbuddy').colorscheme('modus-operandi')

-- Autocmds {{{1
local autocmds = {
  highlight_yank = {
    {"TextYankPost", "*", [[silent! lua require'vim.highlight'.on_yank("Substitute", 200)]]};
  };

  markdown_syntax = {
    {"BufNewFile,BufFilePre,BufRead", "*.md"     , "set filetype=markdown"};
    {"FileType", "markdown" , "setlocal spell"};
    {"FileType", "markdown" , "setlocal complete+=kspell"};
  };

  git = {
    { "Filetype", "gitcommit" , "setlocal spell"};
    { "Filetype", "gitcommit" , "setlocal complete+=kspell"};
  };

  nix_syntax = {
    {"BufNewFile,BufFilePre,BufRead", "*.nix", "set filetype=nix | setlocal tabstop=2"};
  };

  terminal = {
    {"TermOpen", "*", "setlocal norelativenumber nonumber"};
    {"TermOpen", "*", "startinsert"};
  };

  filetypes = {
    {" Filetype " , " c     , cpp " , " setl omnifunc=v:lua.vim.lsp.omnifunc ts=8 sts=8 shiftwidth=8 noexpandtab "},
    {" Filetype " , " rust        " , " setl omnifunc=v:lua.vim.lsp.omnifunc ts=8 sts=8 shiftwidth=8 noexpandtab "},
    {" Filetype " , " lua         " , " setl omnifunc=v:lua.vim.lsp.omnifunc ts=2 sts=2 shiftwidth=2 expandtab "},
    {" Filetype " , " vim         " , " setl omnifunc=v:lua.vim.lsp.omnifunc ts=2 sts=2 shiftwidth=2 expandtab "},
    {" Filetype"  , " nix         " , " setl ts=2 sts=2 shiftwidth=2 expandtab "},
    {" Filetype"  , " markdown    " , " setl ts=4 sts=4 shiftwidth=4 noexpandtab "},
    {" Filetype"  , " java        " , " setl ts=8 sts=8 shiftwidth=4 noexpandtab "},
    {" BufEnter " , " *           " , " lua require'completion'.on_attach() "},
  };
}

utils.nvim_create_augroups(autocmds)

-- }}}

-- Colorizer
require'colorizer'.setup()

-- Completion and LSP

-- Recommended settings for completion-nvim {{{1
api.nvim_set_option('completeopt','menuone,noinsert,noselect')
local shortmess_options = api.nvim_get_option('shortmess')

shortmess_options = shortmess_options .. 'c'
api.nvim_set_option('shortmess',shortmess_options)

---- This config came from https://github.com/haorenW1025/config/blob/master/.config/nvim/init.lua
local lsp = require'nvim_lsp'

-- This is chain completion configuration
-- TODO markdown doesn't behave right
local chain_complete_list = {
  lua = {
    string = {
      {mode = {'<c-p>'}},
      {mode = {'<c-n>'}}
    },

    func = {
      {complete_items = {'lsp'}}
    },

    default = {
      {complete_items = {'lsp'}},
      {mode = {'<c-p>'}},
      {mode = {'<c-n>'}}
    }
  },

  markdown = {
    default = {
      {mode = {'spel'}},
      {mode = {'dict'}},
      {mode = {'file'}}
    }
  },

  default = {
    {complete_items = {'lsp', 'snippet'}},
    {complete_items = {'path'}, triggered_only = {'/'}},
    {complete_items = {'buffers'}},
    {mode = {'<c-p>'}},
    {mode = {'<c-n>'}}
  },

  string = {
    {complete_items = {'path'}, triggered_only = {'/'}},
  },

  comment = {},
}

-- This is on_attach function which set's up mappings for buffer using daignostics, completion and LSP
local on_attach = function()
  require'diagnostic'.on_attach({
  })
  require'completion'.on_attach({
    sorting = 'alphabet',
    matching_strategy_list = {'exact', 'fuzzy'},
    chain_complete_list = chain_complete_list,
  })
  -- This came from https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/lsp_config.lua
  local mapper = function(mode, key, result)
    vim.fn.nvim_buf_set_keymap(0, mode, key, result, {noremap=true, silent=true})
  end

  mapper('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  mapper('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>')
  mapper('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  mapper('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  mapper('n', '1gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  mapper('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  mapper('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  mapper('i', '<c-l>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
end

api.nvim_set_var('diagnostic_enable_underline',0)

lsp.clangd.setup{
  on_attach = on_attach;
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true
        }
      }
    }
  },
}

lsp.rust_analyzer.setup{
  on_attach = on_attach;
}

lsp.sumneko_lua.setup {
  on_attach= on_attach;
  runtime = {
    version = "LuaJIT";
  };
  diagnostics={
    enable=true,
    globals={
      "vim", "Color", "c", "Group", "g", "s", "describe", "it", "before_each", "after_each"
    },
  },
}

lsp.jdtls.setup{
  on_attach = on_attach;
  filetypes = { 'java' };
  init_options = {
    workspace = '~/Documents/Programming/java'
  };
  -- root_dir = root_pattern('.git')
}

lsp.vimls.setup{
  on_attach = on_attach;
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true
        }
      }
    }
  },
}
-- }}}

-- Treesitter

-- Settings {{{1
require'nvim-treesitter.configs'.setup {
  ensure_installed = "lua",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = false,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
-- }}}
