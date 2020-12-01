-- TODO check if plenary is loaded
local vim = vim
vim.cmd('packadd! gitsigns')
vim.cmd('packadd! plenary')
require('gitsigns').setup()
