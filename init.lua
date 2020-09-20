-- vim: foldmethod=marker
local vim = vim
local api = vim.api

-- local utils = require('utils')

-- Options {{{1
vim.g.mapleader = ' '

-- Relative line numbers
vim.wo.relativenumber = true
vim.wo.number = true

vim.o.laststatus = 1 -- Don't show the status line if no splits

api.nvim_command('filetype plugin indent on') -- Filetype flygin on
api.nvim_command('syntax enable') -- enable syntax highlighting

vim.o.scrolloff = 5 -- Scrolling lines starts 5 lines above the last one

-- Tabstop
vim.o.tabstop = 2
vim.bo.tabstop = 2

local my_path = api.nvim_get_option('path')
my_path = my_path .. '**'
vim.o.path = my_path -- Set the path to find the file in a project


local ignore = api.nvim_get_option('wildignore')
ignore = ignore .. '*.o,*.obj,*.bin,*.dll,*.exe,'
ignore = ignore .. '*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**,'
ignore = ignore .. '*.pyc,'
ignore = ignore .. '*.DS_Store,'
ignore = ignore .. '*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.pdf,'

vim.o.wildignore = ignore -- Ignore certain files and folders when globbing

vim.o.guifont = 'SauceCodePro Nerd Font Medium:h17' -- Set font for gnvim

vim.o.hidden = true -- Switch buffers painlessly

vim.o.lazyredraw = true -- Macros don't show any animation

-- Do not load netrw by default since I do not use it, see
-- https://github.com/bling/dotvim/issues/4
vim.g.loaded_netrwPlugin = 1

vim.g.loaded_2html_plugin = 1 -- Do not load tohtml.vim

-- The eob removes ~ at the end of buffer
-- vert gives a line when vertically split
vim.o.fillchars = 'diff:∙,fold:·,vert:┃,eob: '

-- Show tabs and spaces
vim.wo.list=true
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
api.nvim_set_keymap('n'  , '[b' , ':bp<cr>' , opts)
api.nvim_set_keymap('n'  , ']b' , ':bp<cr>' , opts)
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
api.nvim_command('packadd! vim-dirvish')    -- Alternative to netrw
api.nvim_command('packadd! vim-repeat')     -- Full power of .
api.nvim_command('packadd! vim-commentary') -- Allows us to comment easily
api.nvim_command('packadd! vim-surround')   -- Easily delete brackets in lisp

-- Lsp plugins
api.nvim_command('packadd! nvim-lsp')         -- lsp configs
api.nvim_command('packadd! completion-nvim')  -- A decent completion written in lua
api.nvim_command('packadd! diagnostic-nvim')  -- This is a wrapper around lsp to show some messages about errors

-- treesitter I am not using it now
api.nvim_command('packadd! nvim-treesitter')  -- TreeSitter syntax coloring can't make it work for now

-- colorschemes
api.nvim_command('packadd! nvim-colorizer.lua')   -- A really fast colorizer plugin

-- Integrate with nix-shell in direnv
api.nvim_command('packadd! direnv.vim')   -- Integrates direnv and nix-shell with vim

-- My own theme needs colorbuddy
api.nvim_command('packadd! modus-theme-vim')  -- My theme
api.nvim_command('packadd! colorbuddy.vim')   -- easy colorschemes !!

-- Syntax for lua
-- api.nvim_command('packadd! BetterLua.vim')  -- Better colorschemes

-- plugins for functionality
api.nvim_command('packadd! vim-waikiki') -- Markdown
api.nvim_command('packadd! tabular')  -- Make things more readable
--- }}}

-- Colorschemes
-- TODO find a way to toggle the theme between light and dark
vim.o.termguicolors = true
require('colorbuddy').colorscheme('modus-vivendi')

-- Autocmds {{{1
--local autocmds = {
--  highlight_yank = {
--    {"TextYankPost", "*", [[silent! lua require'vim.highlight'.on_yank("Substitute", 200)]]};
--  };
--
--  markdown_syntax = {
--    {"BufNewFile,BufFilePre,BufRead", "*.md"     , "set filetype=markdown"};
--    {"FileType", "markdown" , "setlocal spell"};
--    {"FileType", "markdown" , "setlocal complete+=kspell"};
--  };
--
--  git = {
--    { "Filetype", "gitcommit" , "setlocal spell"};
--    { "Filetype", "gitcommit" , "setlocal complete+=kspell"};
--  };
--
--  nix_syntax = {
--    {"BufNewFile,BufFilePre,BufRead", "*.nix", "set filetype=nix | setlocal tabstop=2"};
--  };
--
--  terminal = {
--    {"TermOpen", "*", "setlocal norelativenumber nonumber"};
--    {"TermOpen", "*", "startinsert"};
--  };
--
--  filetypes = {
--    {" Filetype " , " c     , cpp " , "setlocal omnifunc=v:lua.vim.lsp.omnifunc"},
--    {" Filetype " , " rust        " , "setlocal omnifunc=v:lua.vim.lsp.omnifunc"},
--    {" Filetype " , " lua         " , "setlocal omnifunc=v:lua.vim.lsp.omnifunc"},
--    {" Filetype " , " vim         " , "setlocal omnifunc=v:lua.vim.lsp.omnifunc"},
--    {" Filetype " , " c     , cpp " , "setlocal ts=4 sts=4 shiftwidth=4 expandtab"},
--    {" Filetype " , " rust        " , "setlocal ts=4 sts=4 shiftwidth=4 expandtab"},
--    {" Filetype " , " lua         " , "setlocal ts=2 sts=2 shiftwidth=2 expandtab"},
--    {" Filetype"  , " nix         " , "setlocal ts=2 sts=2 shiftwidth=2 expandtab"},
--    {" Filetype"  , " markdown    " , "setlocal ts=4 sts=4 shiftwidth=4 noexpandtab"},
--    {" Filetype"  , " java        " , "setlocal ts=8 sts=8 shiftwidth=4 noexpandtab"},
--    {" BufEnter " , " *           " , "lua require'completion'.on_attach()"},
--  };
--}

-- utils.nvim_create_augroups(autocmds)

-- }}}

-- Colorizer
require'colorizer'.setup()

-- Completion and LSP

-- Recommended settings for completion-nvim {{{1
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

vim.g.diagnostic_enable_underline = 0

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

vim.cmd('sign define LspDiagnosticsErrorSign text=✖')
vim.cmd('sign define LspDiagnosticsWarningSign text=⚠')
vim.cmd('sign define LspDiagnosticsInformationSign text=ℹ')
vim.cmd('sign define LspDiagnosticsHintSign text=➤')
-- }}}

-- Treesitter
-- Settings {{{1
require'nvim-treesitter.configs'.setup {
  ensure_installed = "lua",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
-- }}}
