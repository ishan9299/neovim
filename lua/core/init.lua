local vim = vim
local keybindings = require('core.mappings')
local options = require('core.options')
local plugins = require('core.plugins')
local utils = require('utils')

vim.cmd('packadd! nvim-lsp')           -- lsp configs
vim.cmd('packadd! completion-nvim')    -- A decent completion written in lua
vim.cmd('packadd! diagnostic-nvim')    -- This is a wrapper around lsp to show some messages about errors
vim.cmd('packadd! nvim-treesitter')    -- TreeSitter syntax coloring can't make it work for now
vim.cmd('packadd! nvim-colorizer.lua') -- A really fast colorizer plugin
vim.cmd('packadd! direnv.vim')         -- Integrates direnv and nix-shell with vim
vim.cmd('packadd! modus-theme-vim')    -- My theme
vim.cmd('packadd! colorbuddy.vim')     -- easy colorschemes !!
vim.cmd('packadd! vim-waikiki')        -- Markdown
vim.cmd('packadd! vim-dirvish')        -- Alternative to netrw
vim.cmd('packadd! vim-repeat')         -- Full power of .
vim.cmd('packadd! vim-commentary')     -- Allows us to comment easily
vim.cmd('packadd! vim-surround')       -- Easily delete brackets in lisp
vim.cmd('packadd! tabular')            -- Make things more readable

options.setup()
keybindings.setup()
plugins.lsp()
plugins.treesitter()

vim.o.termguicolors = true
vim.g.modus_faint_syntax = 1
vim.cmd('colorscheme modus-vivendi')

require'colorizer'.setup() -- Colorizer

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
