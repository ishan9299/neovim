vim.cmd('packadd! lspconfig')
local lsp = require'nvim_lsp'
local utils = require'utils'

lsp.rust_analyzer.setup{
  on_attach = require'core.lang.lsp'.on_attach;
}

local autocmds = {
  filetypes = {
    {"Filetype" , "rust" , "setl ts=8 sts=8 shiftwidth=8 noexpandtab"},
  }
}

utils.nvim_create_augroups(autocmds)
