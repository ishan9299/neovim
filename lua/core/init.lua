require('core.options').setup()  -- set some sane default options
require('core.mappings').setup() -- set the default keys
require('core.autocmds')         -- This sets up the autocommands for terminal git files

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
require('core.plugins.treesitter')  -- configuration for treesitter highlighting
require('core.plugins.colorizer')   -- shows the colors for colorcodes
require('core.plugins.colorbuddy')  -- easily write and modify the colorschemes
require('core.plugins.modus')       -- my colorscheme

--[[
Settings for some languages using lsp
]]
require('core.lang.C++')
require('core.lang.java')
require('core.lang.lua')
require('core.lang.html')
require('core.lang.css')
require('core.lang.vim')
require('core.lang.rust')

--[[
These don't use lsp
]]
require('core.lang.nix')
require('core.lang.markdown')

--[[
You can also set some options
]]

--[[
Fonts used by neovim gui
]]
vim.o.guifont = 'SauceCodePro Nerd Font Medium:h17'

--[[
Set the colorscheme
- modus-operandi (light theme)
- modus-vivendi (dark theme)
]]
vim.cmd('colorscheme modus-operandi')

--[[
Relative line numbers
to get normal line number set relative line number as false
]]
vim.wo.relativenumber = true
vim.wo.number = true

--[[
statusline
2 = always show it
1 = show only when there is a split
0 = never show it
]]
vim.o.laststatus = 2
