require('core.options').setup()  -- set some sane default options
require('core.mappings').setup() -- set the default keys
require('core.autocmds')         -- This sets up the autocommands that are used to setup tab vs spaces and filetypes

--[[
The plugins which are automatically loaded
- surround
- tabular
- repeat
- commentary
- dirvish
- direnv

The plugins over here are stored in opt directory comment them out to disable them
]]

require('core.plugins.completion')  -- completion for neovim
require('core.plugins.diagnostic')  -- diagnostic for lsp
require('core.plugins.lsp').init()  -- lsp configuration
require('core.plugins.treesitter')  -- configuration for treesitter highlighting
require('core.plugins.colorizer')   -- shows the colors for colorcodes
require('core.plugins.colorbuddy')  -- easily write and modify the colorschemes
require('core.plugins.modus')       -- my colorscheme

--[[
You can set some options
]]

-- Fonts used by neovim gui
vim.o.guifont = 'SauceCodePro Nerd Font Medium:h17'

-- Set the colorscheme
vim.cmd('colorscheme modus-operandi')

-- Relative line numbers
vim.wo.relativenumber = true
vim.wo.number = true

-- statusline
vim.o.laststatus = 1 -- Don't show the status line if no splits
